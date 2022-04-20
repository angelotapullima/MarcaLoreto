class BlogModel {
  String? idBlog;
  String? idUsuario;
  String? shortCodeBlog;
  String? tituloBlog;
  String? titleBlogEn;
  String? subtituloBlog;
  String? subtitleBlogEn;
  String? descripcionBlog;
  String? descriptionBlogEn;
  String? imageBlog;
  String? fuenteBlog;
  String? colorBlog;
  String? dateTimeBlog;
  String? vistasBlog;
  String? estadoBlog;
  String? activarEnglish;

  BlogModel({
    this.idBlog,
    this.idUsuario,
    this.shortCodeBlog,
    this.tituloBlog,
    this.titleBlogEn,
    this.subtituloBlog,
    this.subtitleBlogEn,
    this.descripcionBlog,
    this.descriptionBlogEn,
    this.imageBlog,
    this.fuenteBlog,
    this.colorBlog,
    this.dateTimeBlog,
    this.vistasBlog,
    this.estadoBlog,
    this.activarEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idBlog': idBlog,
        'idUsuario': idUsuario,
        'shortCodeBlog': shortCodeBlog,
        'tituloBlog': tituloBlog,
        'titleBlogEn': titleBlogEn,
        'subtituloBlog': subtituloBlog,
        'subtitleBlogEn': subtitleBlogEn,
        'descripcionBlog': descripcionBlog,
        'descriptionBlogEn': descriptionBlogEn,
        'imageBlog': imageBlog,
        'fuenteBlog': fuenteBlog,
        'colorBlog': colorBlog,
        'dateTimeBlog': dateTimeBlog,
        'vistasBlog': vistasBlog,
        'estadoBlog': estadoBlog,
        'activarEnglish': activarEnglish,
      };

  static List<BlogModel> fromJsonList(List<dynamic> json) => json.map((i) => BlogModel.fromJson(i)).toList();

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        idBlog: json["idBlog"],
        idUsuario: json["idUsuario"],
        shortCodeBlog: json["shortCodeBlog"],
        tituloBlog: json["tituloBlog"],
        titleBlogEn: json["titleBlogEn"],
        subtituloBlog: json["subtituloBlog"],
        subtitleBlogEn: json["subtitleBlogEn"],
        descripcionBlog: json["descripcionBlog"],
        descriptionBlogEn: json["descriptionBlogEn"],
        imageBlog: json["imageBlog"],
        fuenteBlog: json["fuenteBlog"],
        colorBlog: json["colorBlog"],
        dateTimeBlog: json["dateTimeBlog"],
        vistasBlog: json["vistasBlog"],
        estadoBlog: json["estadoBlog"],
        activarEnglish: json["activarEnglish"],
      );
}
