import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Licenciatarios/document_model.dart';
import 'package:sqflite/sqlite_api.dart';

class DocumentDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertDocument(DocumentModel producto) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'Document',
        producto.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<DocumentModel>> getDocument() async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<DocumentModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Document WHERE documentEstado = '1' ");

      if (maps.isNotEmpty) list = DocumentModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<DocumentModel>> getDocumentForId(String id) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<DocumentModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Document WHERE idDocument ='$id' and documentEstado = '1' ");

      if (maps.isNotEmpty) list = DocumentModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  deleteDocument() async {
    final db = await dbprovider.database;

    final res = await db.rawDelete("DELETE FROM Document");

    return res;
  }
}
