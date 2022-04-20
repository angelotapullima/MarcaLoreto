import 'package:marca_loreto/src/coreDataBase/config_db.dart';
import 'package:marca_loreto/src/model/inicio/blog_model.dart';
import 'package:sqflite/sqlite_api.dart';

class BlogDatabase {
  final dbprovider = DatabaseHelper.instance;

  Future<void> insertBlog(BlogModel blogModel) async {
    try {
      final Database db = await dbprovider.getDatabase();

      await db.insert(
        'Blogs',
        blogModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      e;
    }
  }

  Future<List<BlogModel>> getBlogs() async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<BlogModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Blogs WHERE estadoBlog='1' ");

      if (maps.isNotEmpty) list = BlogModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<BlogModel>> getBlogById(String idBlog) async {
    try {
      final Database db = await dbprovider.getDatabase();
      List<BlogModel> list = [];
      List<Map> maps = await db.rawQuery("SELECT * FROM Blogs WHERE idBlog='$idBlog' ");

      if (maps.isNotEmpty) list = BlogModel.fromJsonList(maps);
      return list;
    } catch (e) {
      return [];
    }
  }

  updateLanguage(String value) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawUpdate("UPDATE Blogs SET activarEnglish='$value'");

      return res;
    } catch (exception) {
      return exception;
    }
  }
}
