import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/descubre/catergoria_descubre_model.dart';
import 'package:sqflite/sqlite_api.dart';

class CategoriaDescubreDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertCategoria(CategoriaDescubreModel categoriaModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'CategoriaDescubre',
        categoriaModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<CategoriaDescubreModel>> getCatDescubre() async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<CategoriaDescubreModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM CategoriaDescubre WHERE estadoCategoriaDescubre='1' ");

      if (maps.isNotEmpty) list = CategoriaDescubreModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<CategoriaDescubreModel>> getCatDescubreById(String idCategoriaDescubre) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<CategoriaDescubreModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM CategoriaDescubre WHERE idCategoriaDescubre='$idCategoriaDescubre' ");

      if (maps.isNotEmpty) list = CategoriaDescubreModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }
}
