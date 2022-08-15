import 'package:marca_loreto/src/coreDataBase/category_db.dart';
import 'package:marca_loreto/src/coreDataBase/init_db.dart';
import 'package:marca_loreto/src/coreDataBase/business_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await getDatabase();

  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'marcaLoreto3.db');
    return openDatabase(path, onCreate: (db, version) {
      //Inicio
      db.execute(InitDB.tableBannerSql);
      db.execute(InitDB.tableSeccionSql);
      db.execute(InitDB.tableArchivosSql);
      db.execute(InitDB.tableBlogsSql);
      db.execute(InitDB.tableGaleriaSql);

      //Descubre
      db.execute(CategoryDB.tableCategoriaSql);
      db.execute(CategoryDB.tableDetalleCategoriaSql);

      //Licenciatarios
      db.execute(BusinessDB.tableCategoriasNegocioSql);
      db.execute(BusinessDB.tableNegocioSql);
      db.execute(BusinessDB.tableDocumentSql);
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  }
}
