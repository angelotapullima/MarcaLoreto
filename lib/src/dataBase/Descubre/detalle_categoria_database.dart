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
}
