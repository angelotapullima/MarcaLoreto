class BusinessModel {
  String? idBusiness;
  String? idBusinessCategory;
  String? nameBusiness;
  String? imageBusiness;
  String? detailBusiness;
  String? detailBusinessEn;
  String? urlBusiness;
  String? facebookBusiness;
  String? catalogueBusiness;
  String? dateTimeBusiness;
  String? stateBusiness;
  String? activateEnglish;

  //No en base de datos
  String? nameCategory;
  String? nameCategoryEn;

  BusinessModel({
    this.idBusiness,
    this.idBusinessCategory,
    this.nameBusiness,
    this.imageBusiness,
    this.detailBusiness,
    this.detailBusinessEn,
    this.urlBusiness,
    this.facebookBusiness,
    this.catalogueBusiness,
    this.dateTimeBusiness,
    this.stateBusiness,
    this.nameCategory,
    this.nameCategoryEn,
    this.activateEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idNegocio': idBusiness,
        'idCategoriaNeg': idBusinessCategory,
        'nombreNegocio': nameBusiness,
        'imageNegocio': imageBusiness,
        'detalleNegocio': detailBusiness,
        'detailNegocioEn': detailBusinessEn,
        'urlNegocio': urlBusiness,
        'facebookNegocio': facebookBusiness,
        'catalogoNegocio': catalogueBusiness,
        'dateTimeNegocio': dateTimeBusiness,
        'estadoNegocio': stateBusiness,
        'activarEnglish': activateEnglish,
      };

  static List<BusinessModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => BusinessModel.fromJson(i)).toList();

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        idBusiness: json["idNegocio"],
        idBusinessCategory: json["idCategoriaNeg"],
        nameBusiness: json["nombreNegocio"],
        imageBusiness: json["imageNegocio"],
        detailBusiness: json["detalleNegocio"],
        detailBusinessEn: json["detailNegocioEn"],
        urlBusiness: json["urlNegocio"],
        facebookBusiness: json["facebookNegocio"],
        catalogueBusiness: json["catalogoNegocio"],
        dateTimeBusiness: json["dateTimeNegocio"],
        stateBusiness: json["estadoNegocio"],
        activateEnglish: json["activarEnglish"],
      );
}
