class NegocioDB {
  static const String tableCategoriasNegocioSql = 'CREATE TABLE CategoriasNegocio('
      ' idCategoriaNeg TEXT PRIMARY KEY,'
      ' nombreCategoriaNeg TEXT,'
      ' estadoCategoriaNeg TEXT)';

  static const String tableNegocioSql = 'CREATE TABLE Negocio('
      ' idNegocio TEXT PRIMARY KEY,'
      ' idCategoriaNeg TEXT,'
      ' nombreNegocio TEXT,'
      ' imageNegocio TEXT,'
      ' detalleNegocio TEXT,'
      ' urlNegocio TEXT,'
      ' facebookNegocio TEXT,'
      ' catalogoNegocio TEXT,'
      ' dateTimeNegocio TEXT,'
      ' estadoNegocio TEXT)';
}
