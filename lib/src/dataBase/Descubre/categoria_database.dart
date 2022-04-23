import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Categoria/catergoria_model.dart';
import 'package:sqflite/sqlite_api.dart';

class CategoriaDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertCategoria(CategoriaModel categoriaModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'Categoria',
        categoriaModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<CategoriaModel>> getCategoriaByTipo(String tipo) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<CategoriaModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Categoria WHERE estadoCategoria='1' AND tipoCategoria='$tipo' ");

      if (maps.isNotEmpty) list = CategoriaModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }
}
