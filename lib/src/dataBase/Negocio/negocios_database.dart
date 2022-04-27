import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Licenciatarios/negocio_model.dart';
import 'package:sqflite/sqlite_api.dart';

class NegociosDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertNegocio(NegocioModel negocioModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'Negocio',
        negocioModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<NegocioModel>> getNegocioByIdCategoria(String idCategoriaNeg) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<NegocioModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Negocio WHERE idCategoriaNeg='$idCategoriaNeg' ");

      if (maps.isNotEmpty) list = NegocioModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<NegocioModel>> getNegocioByIdNegocio(String idNegocio) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<NegocioModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Negocio WHERE idNegocio='$idNegocio' ");

      if (maps.isNotEmpty) list = NegocioModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  //Language

  updateLanguage(String value) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawUpdate("UPDATE Negocio SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
