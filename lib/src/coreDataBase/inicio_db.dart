class InicioDB {
  static const String tableBannerSql = 'CREATE TABLE Banner('
      ' idBanner TEXT PRIMARY KEY,'
      ' nroBanner TEXT,'
      ' tituloBanner TEXT,'
      ' titleBannerEn TEXT,'
      ' subtituloBanner TEXT,'
      ' subtitleBannerEn TEXT,'
      ' imageBanner TEXT,'
      ' activarEnglish TEXT,'
      ' updateData TEXT)';

  static const String tableSeccionSql = 'CREATE TABLE Seccion('
      ' idSeccion TEXT PRIMARY KEY,'
      ' tituloSeccion TEXT,'
      ' titleSeccionEn TEXT,'
      ' subtitulo1Seccion TEXT,'
      ' subtitle1SeccionEn TEXT,'
      ' subtitulo2Seccion TEXT,'
      ' subtitle2SeccionEn TEXT,'
      ' imageSeccion TEXT,'
      ' activarEnglish TEXT,'
      ' updateData TEXT)';

  static const String tableBlogsSql = 'CREATE TABLE Blogs('
      ' idBlog TEXT PRIMARY KEY,'
      ' idUsuario TEXT,'
      ' shortCodeBlog TEXT,'
      ' tituloBlog TEXT,'
      ' titleBlogEn TEXT,'
      ' subtituloBlog TEXT,'
      ' subtitleBlogEn TEXT,'
      ' descripcionBlog TEXT,'
      ' descriptionBlogEn TEXT,'
      ' imageBlog TEXT,'
      ' fuenteBlog TEXT,'
      ' colorBlog TEXT,'
      ' dateTimeBlog TEXT,'
      ' vistasBlog TEXT,'
      ' activarEnglish TEXT,'
      ' estadoBlog TEXT)';
}