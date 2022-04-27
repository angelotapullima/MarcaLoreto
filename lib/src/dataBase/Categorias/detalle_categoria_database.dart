import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Categoria/detalle_categoria_model.dart';
import 'package:sqflite/sqlite_api.dart';

class DetalleCategoriaDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertDetalle(DetalleCategoriaModel detalleModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'DetalleCategoria',
        detalleModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<DetalleCategoriaModel>> getDetalleByIdCategoria(String idCategoria) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<DetalleCategoriaModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM DetalleCategoria WHERE idCategoria='$idCategoria' ");

      if (maps.isNotEmpty) list = DetalleCategoriaModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  //Language

  Future<List<DetalleCategoriaModel>> getDetalleByIdDetalleCategoria(String idDetalleCategoria) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<DetalleCategoriaModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM DetalleCategoria WHERE idDetalleCategoria='$idDetalleCategoria' ");

      if (maps.isNotEmpty) list = DetalleCategoriaModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawUpdate("UPDATE DetalleCategoria SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
