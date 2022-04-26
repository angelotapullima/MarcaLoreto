class CategoriasNegocioModel {
  String? idCategoriaNeg;
  String? nombreCategoriaNeg;
  String? estadoCategoriaNeg;
  String? activarEnglish;

  CategoriasNegocioModel({
    this.idCategoriaNeg,
    this.nombreCategoriaNeg,
    this.estadoCategoriaNeg,
    this.activarEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idCategoriaNeg': idCategoriaNeg,
        'nombreCategoriaNeg': nombreCategoriaNeg,
        'estadoCategoriaNeg': estadoCategoriaNeg,
        'activarEnglish': activarEnglish,
      };

  static List<CategoriasNegocioModel> fromJsonList(List<dynamic> json) => json.map((i) => CategoriasNegocioModel.fromJson(i)).toList();

  factory CategoriasNegocioModel.fromJson(Map<String, dynamic> json) => CategoriasNegocioModel(
        idCategoriaNeg: json["idCategoriaNeg"],
        nombreCategoriaNeg: json["nombreCategoriaNeg"],
        estadoCategoriaNeg: json["estadoCategoriaNeg"],
        activarEnglish: json["activarEnglish"],
      );
}
