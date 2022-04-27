class CategoriasNegocioModel {
  String? idCategoriaNeg;
  String? nombreCategoriaNeg;
  String? nameCategoriaNegEn;
  String? estadoCategoriaNeg;
  String? activarEnglish;

  CategoriasNegocioModel({
    this.idCategoriaNeg,
    this.nombreCategoriaNeg,
    this.nameCategoriaNegEn,
    this.estadoCategoriaNeg,
    this.activarEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idCategoriaNeg': idCategoriaNeg,
        'nombreCategoriaNeg': nombreCategoriaNeg,
        'nameCategoriaNegEn': nameCategoriaNegEn,
        'estadoCategoriaNeg': estadoCategoriaNeg,
        'activarEnglish': activarEnglish,
      };

  static List<CategoriasNegocioModel> fromJsonList(List<dynamic> json) => json.map((i) => CategoriasNegocioModel.fromJson(i)).toList();

  factory CategoriasNegocioModel.fromJson(Map<String, dynamic> json) => CategoriasNegocioModel(
        idCategoriaNeg: json["idCategoriaNeg"],
        nombreCategoriaNeg: json["nombreCategoriaNeg"],
        nameCategoriaNegEn: json["nameCategoriaNegEn"],
        estadoCategoriaNeg: json["estadoCategoriaNeg"],
        activarEnglish: json["activarEnglish"],
      );
}
