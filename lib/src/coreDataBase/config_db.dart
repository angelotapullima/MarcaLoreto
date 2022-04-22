import 'package:marca_loreto/src/coreDataBase/descubre_db.dart';
import 'package:marca_loreto/src/coreDataBase/inicio_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await getDatabase();

  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'marcaLoreto4.db');
    return openDatabase(path, onCreate: (db, version) {
      //Inicio
      db.execute(InicioDB.tableBannerSql);
      db.execute(InicioDB.tableSeccionSql);
      db.execute(InicioDB.tableBlogsSql);
      db.execute(InicioDB.tableGaleriaSql);

      //Descubre
      db.execute(DescubreDB.tableCategoriaDescubreSql);
      db.execute(DescubreDB.tableDetalleDescubreSql);
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  }
}
