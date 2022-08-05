import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/inicio/archivos_model.dart';
import 'package:sqflite/sqlite_api.dart';

class ArchivosDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertArchivo(ArchivosModel archivoModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'Archivos',
        archivoModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<ArchivosModel>> getArchivos() async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<ArchivosModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Archivos WHERE estadoArchivo='1'");

      if (maps.isNotEmpty) list = ArchivosModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<ArchivosModel>> getArchivoById(String idArchivo) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<ArchivosModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Archivos WHERE idArchivo='$idArchivo' ");

      if (maps.isNotEmpty) list = ArchivosModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawUpdate("UPDATE Archivos SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
