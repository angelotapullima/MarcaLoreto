class NegocioDB {
  static const String tableCategoriasNegocioSql = 'CREATE TABLE CategoriasNegocio('
      ' idCategoriaNeg TEXT PRIMARY KEY,'
      ' nombreCategoriaNeg TEXT,'
      ' activarEnglish TEXT,'
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
      ' activarEnglish TEXT,'
      ' estadoNegocio TEXT)';

  static const String tableDocumentSql = 'CREATE TABLE Document('
      ' idDocument TEXT PRIMARY KEY,'
      ' documentTitulo TEXT,'
      ' documentFile TEXT,'
      ' documentUrlInterno TEXT,'
      ' documentEstado TEXT)';
}
