import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Init/section_model.dart';
import 'package:sqflite/sqlite_api.dart';

class SectionDatabase {
  final providerDatabase = DatabaseHelper.instance;

  Future<void> insertSection(SectionModel sectionModel) async {
    try {
      final Database db = await providerDatabase.getDatabase();

      await db.insert(
        'Seccion',
        sectionModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<SectionModel>> getSections() async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<SectionModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Seccion");

      if (maps.isNotEmpty) list = SectionModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<SectionModel>> getSectionById(String idSection) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<SectionModel> list = [];
      List<Map> maps = await db
          .rawQuery("SELECT * FROM Seccion WHERE idSeccion='$idSection'");

      if (maps.isNotEmpty) list = SectionModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await providerDatabase.database;

      final res =
          await db.rawUpdate("UPDATE Seccion SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
