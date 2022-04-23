class CategoriaModel {
  String? idCategoria;
  String? tipoCategoria;
  String? nombreCategoria;
  String? imageCategoria;
  String? estadoCategoria;

  CategoriaModel({
    this.idCategoria,
    this.tipoCategoria,
    this.nombreCategoria,
    this.imageCategoria,
    this.estadoCategoria,
  });

  Map<String, dynamic> toJson() => {
        'idCategoria': idCategoria,
        'tipoCategoria': tipoCategoria,
        'nombreCategoria': nombreCategoria,
        'imageCategoria': imageCategoria,
        'estadoCategoria': estadoCategoria,
      };

  static List<CategoriaModel> fromJsonList(List<dynamic> json) => json.map((i) => CategoriaModel.fromJson(i)).toList();

  factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
        idCategoria: json["idCategoria"],
        tipoCategoria: json["tipoCategoria"],
        nombreCategoria: json["nombreCategoria"],
        imageCategoria: json["imageCategoria"],
        estadoCategoria: json["estadoCategoria"],
      );
}
