import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Category/detail_category_model.dart';
import 'package:sqflite/sqlite_api.dart';

class DetailCategoryDatabase {
  final providerDatabase = DatabaseHelper.instance;

  Future<void> insertDetalle(DetailCategoryModel detalleModel) async {
    try {
      final Database db = await providerDatabase.getDatabase();

      await db.insert(
        'DetalleCategoria',
        detalleModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<DetailCategoryModel>> getDetailByIdCategory(
      String idCategoria) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<DetailCategoryModel> list = [];
      List<Map> maps = await db.rawQuery(
          "SELECT * FROM DetalleCategoria WHERE idCategoria='$idCategoria' ");

      if (maps.isNotEmpty) list = DetailCategoryModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  //Language

  Future<List<DetailCategoryModel>> getDetalleByIdDetalleCategoria(
      String idDetalleCategoria) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<DetailCategoryModel> list = [];
      List<Map> maps = await db.rawQuery(
          "SELECT * FROM DetalleCategoria WHERE idDetalleCategoria='$idDetalleCategoria' ");

      if (maps.isNotEmpty) list = DetailCategoryModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await providerDatabase.database;

      final res = await db
          .rawUpdate("UPDATE DetalleCategoria SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
