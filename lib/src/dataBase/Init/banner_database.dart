import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Init/banner_model.dart';
import 'package:sqflite/sqlite_api.dart';

class BannerDatabase {
  final providerDatabase = DatabaseHelper.instance;

  Future<void> insertBanner(BannerModel bannerModel) async {
    try {
      final Database db = await providerDatabase.getDatabase();

      await db.insert(
        'Banner',
        bannerModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<BannerModel>> getBanners() async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<BannerModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Banner");

      if (maps.isNotEmpty) list = BannerModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<BannerModel>> getBannerById(String idBanner) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<BannerModel> list = [];
      List<Map> maps =
          await db.rawQuery("SELECT * FROM Banner WHERE IdBanner='$idBanner'");

      if (maps.isNotEmpty) list = BannerModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await providerDatabase.database;

      final res =
          await db.rawUpdate("UPDATE Banner SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
