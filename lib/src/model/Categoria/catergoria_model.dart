class CategoriaModel {
  String? idCategoria;
  String? tipoCategoria;
  String? nombreCategoria;
  String? nameCategoriaEn;
  String? imageCategoria;
  String? estadoCategoria;
  String? activarEnglish;

  CategoriaModel({
    this.idCategoria,
    this.tipoCategoria,
    this.nombreCategoria,
    this.nameCategoriaEn,
    this.imageCategoria,
    this.estadoCategoria,
    this.activarEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idCategoria': idCategoria,
        'tipoCategoria': tipoCategoria,
        'nombreCategoria': nombreCategoria,
        'nameCategoriaEn': nameCategoriaEn,
        'imageCategoria': imageCategoria,
        'estadoCategoria': estadoCategoria,
        'activarEnglish': activarEnglish,
      };

  static List<CategoriaModel> fromJsonList(List<dynamic> json) => json.map((i) => CategoriaModel.fromJson(i)).toList();

  factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
        idCategoria: json["idCategoria"],
        tipoCategoria: json["tipoCategoria"],
        nombreCategoria: json["nombreCategoria"],
        nameCategoriaEn: json["nameCategoriaEn"],
        imageCategoria: json["imageCategoria"],
        estadoCategoria: json["estadoCategoria"],
        activarEnglish: json["activarEnglish"],
      );
}
