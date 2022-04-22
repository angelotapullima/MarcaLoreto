class DescubreDB {
  static const String tableCategoriaDescubreSql = 'CREATE TABLE CategoriaDescubre('
      ' idCategoriaDescubre TEXT PRIMARY KEY,'
      ' tipoCategoriaDescubre TEXT,'
      ' nombreCategoriaDescubre TEXT,'
      ' imageCategoriaDescubre TEXT,'
      ' estadoCategoriaDescubre TEXT)';

  static const String tableDetalleDescubreSql = 'CREATE TABLE DetalleDescubre('
      ' idDetalleDescubre TEXT PRIMARY KEY,'
      ' idCategoriaDescubre TEXT,'
      ' subtituloDetalleDescubre TEXT,'
      ' imageDetalleDescubre TEXT,'
      ' estadoDetalleDescubre TEXT,'
      ' destallesDetalleDescubre TEXT)';
}
