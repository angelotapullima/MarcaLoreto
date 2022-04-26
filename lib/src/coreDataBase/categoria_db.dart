class CategoriaDB {
  static const String tableCategoriaSql = 'CREATE TABLE Categoria('
      ' idCategoria TEXT PRIMARY KEY,'
      ' tipoCategoria TEXT,'
      ' nombreCategoria TEXT,'
      ' nameCategoriaEn TEXT,'
      ' imageCategoria TEXT,'
      ' activarEnglish TEXT,'
      ' estadoCategoria TEXT)';

  static const String tableDetalleCategoriaSql = 'CREATE TABLE DetalleCategoria('
      ' idDetalleCategoria TEXT PRIMARY KEY,'
      ' idCategoria TEXT,'
      ' subtituloDetalleCategoria TEXT,'
      ' subtitleDetalleCategoriaEn TEXT,'
      ' imageDetalleCategoria TEXT,'
      ' estadoDetalleCategoria TEXT,'
      ' activarEnglish TEXT,'
      ' detailCategoriaDetalleEn TEXT,'
      ' detalleCategoriaDetalle TEXT)';
}
