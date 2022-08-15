import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Licensees/business_model.dart';
import 'package:sqflite/sqlite_api.dart';

class BusinessDatabase {
  final providerDatabase = DatabaseHelper.instance;

  Future<void> insertBusiness(BusinessModel businessModel) async {
    try {
      final Database db = await providerDatabase.getDatabase();

      await db.insert(
        'Negocio',
        businessModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<BusinessModel>> getBusinessByIdCategory(
      String idCategoriaNeg) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<BusinessModel> list = [];
      List<Map> maps = await db.rawQuery(
          "SELECT * FROM Negocio WHERE idCategoriaNeg='$idCategoriaNeg' ");

      if (maps.isNotEmpty) list = BusinessModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<BusinessModel>> getBusinessByIdBusiness(String isBusiness) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<BusinessModel> list = [];
      List<Map> maps = await db
          .rawQuery("SELECT * FROM Negocio WHERE idNegocio='$isBusiness' ");

      if (maps.isNotEmpty) list = BusinessModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  //Language

  updateLanguage(String value) async {
    try {
      final db = await providerDatabase.database;

      final res =
          await db.rawUpdate("UPDATE Negocio SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
