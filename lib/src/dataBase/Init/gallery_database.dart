import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/Init/gallery_model.dart';
import 'package:sqflite/sqlite_api.dart';

class GalleryDatabase {
  final providerDatabase = DatabaseHelper.instance;

  Future<void> insertGallery(GalleryModel galleryModel) async {
    try {
      final Database db = await providerDatabase.getDatabase();

      await db.insert(
        'Galeria',
        galleryModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<GalleryModel>> getGallery() async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<GalleryModel> list = [];
      List<Map> maps =
          await db.rawQuery("SELECT * FROM Galeria WHERE estadoGaleria='1' ");

      if (maps.isNotEmpty) list = GalleryModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<GalleryModel>> getGalleryById(String idGallery) async {
    try {
      final Database db = await providerDatabase.getDatabase();
      List<GalleryModel> list = [];
      List<Map> maps = await db
          .rawQuery("SELECT * FROM Galeria WHERE idGaleria='$idGallery' ");

      if (maps.isNotEmpty) list = GalleryModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await providerDatabase.database;

      final res =
          await db.rawUpdate("UPDATE Galeria SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
