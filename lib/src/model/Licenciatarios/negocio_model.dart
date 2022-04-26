class NegocioModel {
  String? idNegocio;
  String? idCategoriaNeg;
  String? nombreNegocio;
  String? imageNegocio;
  String? detalleNegocio;
  String? urlNegocio;
  String? facebookNegocio;
  String? catalogoNegocio;
  String? dateTimeNegocio;
  String? estadoNegocio;
  String? activarEnglish;

  //No en base de datos
  String? nombreCategoria;

  NegocioModel({
    this.idNegocio,
    this.idCategoriaNeg,
    this.nombreNegocio,
    this.imageNegocio,
    this.detalleNegocio,
    this.urlNegocio,
    this.facebookNegocio,
    this.catalogoNegocio,
    this.dateTimeNegocio,
    this.estadoNegocio,
    this.nombreCategoria,
    this.activarEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idNegocio': idNegocio,
        'idCategoriaNeg': idCategoriaNeg,
        'nombreNegocio': nombreNegocio,
        'imageNegocio': imageNegocio,
        'detalleNegocio': detalleNegocio,
        'urlNegocio': urlNegocio,
        'facebookNegocio': facebookNegocio,
        'catalogoNegocio': catalogoNegocio,
        'dateTimeNegocio': dateTimeNegocio,
        'estadoNegocio': estadoNegocio,
        'activarEnglish': activarEnglish,
      };

  static List<NegocioModel> fromJsonList(List<dynamic> json) => json.map((i) => NegocioModel.fromJson(i)).toList();

  factory NegocioModel.fromJson(Map<String, dynamic> json) => NegocioModel(
        idNegocio: json["idNegocio"],
        idCategoriaNeg: json["idCategoriaNeg"],
        nombreNegocio: json["nombreNegocio"],
        imageNegocio: json["imageNegocio"],
        detalleNegocio: json["detalleNegocio"],
        urlNegocio: json["urlNegocio"],
        facebookNegocio: json["facebookNegocio"],
        catalogoNegocio: json["catalogoNegocio"],
        dateTimeNegocio: json["dateTimeNegocio"],
        estadoNegocio: json["estadoNegocio"],
        activarEnglish: json["activarEnglish"],
      );
}
