class CategoriasNegocioModel {
  String? idCategoriaNeg;
  String? nombreCategoriaNeg;
  String? estadoCategoriaNeg;

  CategoriasNegocioModel({
    this.idCategoriaNeg,
    this.nombreCategoriaNeg,
    this.estadoCategoriaNeg,
  });

  Map<String, dynamic> toJson() => {
        'idCategoriaNeg': idCategoriaNeg,
        'nombreCategoriaNeg': nombreCategoriaNeg,
        'estadoCategoriaNeg': estadoCategoriaNeg,
      };

  static List<CategoriasNegocioModel> fromJsonList(List<dynamic> json) => json.map((i) => CategoriasNegocioModel.fromJson(i)).toList();

  factory CategoriasNegocioModel.fromJson(Map<String, dynamic> json) => CategoriasNegocioModel(
        idCategoriaNeg: json["idCategoriaNeg"],
        nombreCategoriaNeg: json["nombreCategoriaNeg"],
        estadoCategoriaNeg: json["estadoCategoriaNeg"],
      );
}
