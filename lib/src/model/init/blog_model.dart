class BlogModel {
  String? idBlog;
  String? idUses;
  String? shortCodeBlog;
  String? titleBlog;
  String? titleBlogEn;
  String? subtitleBlog;
  String? subtitleBlogEn;
  String? descriptionBlog;
  String? descriptionBlogEn;
  String? imageBlog;
  String? sourceBlog;
  String? colorBlog;
  String? dateTimeBlog;
  String? vistasBlog;
  String? stateBlog;
  String? activateEnglish;

  BlogModel({
    this.idBlog,
    this.idUses,
    this.shortCodeBlog,
    this.titleBlog,
    this.titleBlogEn,
    this.subtitleBlog,
    this.subtitleBlogEn,
    this.descriptionBlog,
    this.descriptionBlogEn,
    this.imageBlog,
    this.sourceBlog,
    this.colorBlog,
    this.dateTimeBlog,
    this.vistasBlog,
    this.stateBlog,
    this.activateEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idBlog': idBlog,
        'idUsuario': idUses,
        'shortCodeBlog': shortCodeBlog,
        'tituloBlog': titleBlog,
        'titleBlogEn': titleBlogEn,
        'subtituloBlog': subtitleBlog,
        'subtitleBlogEn': subtitleBlogEn,
        'descripcionBlog': descriptionBlog,
        'descriptionBlogEn': descriptionBlogEn,
        'imageBlog': imageBlog,
        'fuenteBlog': sourceBlog,
        'colorBlog': colorBlog,
        'dateTimeBlog': dateTimeBlog,
        'vistasBlog': vistasBlog,
        'estadoBlog': stateBlog,
        'activarEnglish': activateEnglish,
      };

  static List<BlogModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => BlogModel.fromJson(i)).toList();

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        idBlog: json["idBlog"],
        idUses: json["idUsuario"],
        shortCodeBlog: json["shortCodeBlog"],
        titleBlog: json["tituloBlog"],
        titleBlogEn: json["titleBlogEn"],
        subtitleBlog: json["subtituloBlog"],
        subtitleBlogEn: json["subtitleBlogEn"],
        descriptionBlog: json["descripcionBlog"],
        descriptionBlogEn: json["descriptionBlogEn"],
        imageBlog: json["imageBlog"],
        sourceBlog: json["fuenteBlog"],
        colorBlog: json["colorBlog"],
        dateTimeBlog: json["dateTimeBlog"],
        vistasBlog: json["vistasBlog"],
        stateBlog: json["estadoBlog"],
        activateEnglish: json["activarEnglish"],
      );
}
