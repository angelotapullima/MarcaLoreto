import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Init/archive_model.dart';
import 'package:sqflite/sqlite_api.dart';

class ArchiveDatabase {
  final providerDatabase = DatabaseHelper.instance;

  Future<void> insertArchive(ArchiveModel archivoModel) async {
    try {
      final Database db = await providerDatabase.getDatabase();

      await db.insert(
        'Archivos',
        archivoModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<ArchiveModel>> getArchives() async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<ArchiveModel> list = [];
      List<Map> maps =
          await db.rawQuery("SELECT * FROM Archivos WHERE estadoArchivo='1'");

      if (maps.isNotEmpty) list = ArchiveModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<ArchiveModel>> getArchiveById(String idArchive) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<ArchiveModel> list = [];
      List<Map> maps = await db
          .rawQuery("SELECT * FROM Archivos WHERE idArchivo='$idArchive' ");

      if (maps.isNotEmpty) list = ArchiveModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await providerDatabase.database;

      final res =
          await db.rawUpdate("UPDATE Archivos SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
