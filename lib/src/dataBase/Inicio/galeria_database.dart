import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/inicio/galeria_model.dart';
import 'package:sqflite/sqlite_api.dart';

class GaleriaDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertGaleria(GaleriaModel galeriaModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'Galeria',
        galeriaModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<GaleriaModel>> getGaleria() async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<GaleriaModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Galeria WHERE estadoGaleria='1' ");

      if (maps.isNotEmpty) list = GaleriaModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<GaleriaModel>> getGaleriaById(String idGaleria) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<GaleriaModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Galeria WHERE idGaleria='$idGaleria' ");

      if (maps.isNotEmpty) list = GaleriaModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawUpdate("UPDATE Galeria SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
