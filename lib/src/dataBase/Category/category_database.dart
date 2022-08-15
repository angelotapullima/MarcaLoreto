import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Category/category_model.dart';
import 'package:sqflite/sqlite_api.dart';

class CategoryDatabase {
  final providerDatabase = DatabaseHelper.instance;

  Future<void> insertCategory(CategoryModel categoryModel) async {
    try {
      final Database db = await providerDatabase.getDatabase();

      await db.insert(
        'Categoria',
        categoryModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<CategoryModel>> getCategoryByType(String type) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<CategoryModel> list = [];
      List<Map> maps = await db.rawQuery(
          "SELECT * FROM Categoria WHERE estadoCategoria='1' AND tipoCategoria='$type' ");

      if (maps.isNotEmpty) list = CategoryModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  //Language

  Future<List<CategoryModel>> getCategoryByIdCategory(String idCategory) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<CategoryModel> list = [];
      List<Map> maps = await db
          .rawQuery("SELECT * FROM Categoria WHERE idCategoria='$idCategory' ");

      if (maps.isNotEmpty) list = CategoryModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await providerDatabase.database;

      final res =
          await db.rawUpdate("UPDATE Categoria SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
