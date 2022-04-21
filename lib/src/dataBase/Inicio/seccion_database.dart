import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/inicio/seccion_model.dart';
import 'package:sqflite/sqlite_api.dart';

class SeccionDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertSeccion(SeccionModel seccionModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'Seccion',
        seccionModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<SeccionModel>> getSeccions() async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<SeccionModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Seccion");

      if (maps.isNotEmpty) list = SeccionModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<SeccionModel>> getSeccionById(String idSeccion) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<SeccionModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Seccion WHERE idSeccion='$idSeccion'");

      if (maps.isNotEmpty) list = SeccionModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawUpdate("UPDATE Seccion SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
