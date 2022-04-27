import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Licenciatarios/categorias_negocio_model.dart';
import 'package:sqflite/sqlite_api.dart';

class CategoriasNegocioDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertCategoriaNegocio(CategoriasNegocioModel categoriaModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'CategoriasNegocio',
        categoriaModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<CategoriasNegocioModel>> getCategoriasNegocio() async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<CategoriasNegocioModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM CategoriasNegocio WHERE estadoCategoriaNeg='1'");

      if (maps.isNotEmpty) list = CategoriasNegocioModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<CategoriasNegocioModel>> getCategoriaNegocioById(String idCategoriaNeg) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<CategoriasNegocioModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM CategoriasNegocio WHERE estadoCategoriaNeg='1' AND idCategoriaNeg='$idCategoriaNeg'");

      if (maps.isNotEmpty) list = CategoriasNegocioModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  //Language
  Future<List<CategoriasNegocioModel>> getCategoriaNegocioByIdCategory(String idCategoriaNeg) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<CategoriasNegocioModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM CategoriasNegocio WHERE idCategoriaNeg='$idCategoriaNeg'");

      if (maps.isNotEmpty) list = CategoriasNegocioModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawUpdate("UPDATE CategoriasNegocio SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
