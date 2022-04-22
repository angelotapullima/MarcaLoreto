import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/descubre/detalle_descubre_model.dart';
import 'package:sqflite/sqlite_api.dart';

class DetalleDescubreDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertDetalle(DetalleDescubreModel detalleModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'DetalleDescubre',
        detalleModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<DetalleDescubreModel>> getDetalleDescubre() async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<DetalleDescubreModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM DetalleDescubre WHERE estadoDetalleDescubre='1' ");

      if (maps.isNotEmpty) list = DetalleDescubreModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<DetalleDescubreModel>> getDetalleDescubreById(String idDetalleDescubre) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<DetalleDescubreModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM DetalleDescubre WHERE idDetalleDescubre='$idDetalleDescubre' ");

      if (maps.isNotEmpty) list = DetalleDescubreModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }
}
