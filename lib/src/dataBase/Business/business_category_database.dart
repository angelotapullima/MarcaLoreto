import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Licensees/business_category_model.dart';
import 'package:sqflite/sqlite_api.dart';

class BusinessCategoryDatabase {
  final providerDatabase = DatabaseHelper.instance;

  Future<void> insertBusinessCategory(
      BusinessCategoryModel businessCategoryModel) async {
    try {
      final Database db = await providerDatabase.getDatabase();

      await db.insert(
        'CategoriasNegocio',
        businessCategoryModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<BusinessCategoryModel>> getBusinessCategory() async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<BusinessCategoryModel> list = [];
      List<Map> maps = await db.rawQuery(
          "SELECT * FROM CategoriasNegocio WHERE estadoCategoriaNeg='1'");

      if (maps.isNotEmpty) list = BusinessCategoryModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<BusinessCategoryModel>> getBusinessCategoryById(
      String idCategoriaNeg) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<BusinessCategoryModel> list = [];
      List<Map> maps = await db.rawQuery(
          "SELECT * FROM CategoriasNegocio WHERE estadoCategoriaNeg='1' AND idCategoriaNeg='$idCategoriaNeg'");

      if (maps.isNotEmpty) list = BusinessCategoryModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  //Language
  Future<List<BusinessCategoryModel>> getBusinessCategoryByIdCategory(
      String idCategoriaNeg) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<BusinessCategoryModel> list = [];
      List<Map> maps = await db.rawQuery(
          "SELECT * FROM CategoriasNegocio WHERE idCategoriaNeg='$idCategoriaNeg'");

      if (maps.isNotEmpty) list = BusinessCategoryModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await providerDatabase.database;

      final res = await db
          .rawUpdate("UPDATE CategoriasNegocio SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
