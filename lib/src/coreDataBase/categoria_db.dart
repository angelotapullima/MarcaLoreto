class CategoriaDB {
  static const String tableCategoriaSql = 'CREATE TABLE Categoria('
      ' idCategoria TEXT PRIMARY KEY,'
      ' tipoCategoria TEXT,'
      ' nombreCategoria TEXT,'
      ' imageCategoria TEXT,'
      ' estadoCategoria TEXT)';

  static const String tableDetalleCategoriaSql = 'CREATE TABLE DetalleCategoria('
      ' idDetalleCategoria TEXT PRIMARY KEY,'
      ' idCategoria TEXT,'
      ' subtituloDetalleCategoria TEXT,'
      ' imageDetalleCategoria TEXT,'
      ' estadoDetalleCategoria TEXT,'
      ' detalleCategoriaDetalle TEXT)';
}
