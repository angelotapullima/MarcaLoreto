class GaleriaModel {
  String? idGaleria;
  String? tituloGaleria;
  String? titleGaleriaEn;
  String? imageGaleria;
  String? linkGaleria;
  String? estadoGaleria;
  String? activarEnglish;

  GaleriaModel({
    this.idGaleria,
    this.tituloGaleria,
    this.titleGaleriaEn,
    this.imageGaleria,
    this.linkGaleria,
    this.estadoGaleria,
    this.activarEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idGaleria': idGaleria,
        'tituloGaleria': tituloGaleria,
        'titleGaleriaEn': titleGaleriaEn,
        'imageGaleria': imageGaleria,
        'linkGaleria': linkGaleria,
        'estadoGaleria': estadoGaleria,
        'activarEnglish': activarEnglish,
      };

  static List<GaleriaModel> fromJsonList(List<dynamic> json) => json.map((i) => GaleriaModel.fromJson(i)).toList();

  factory GaleriaModel.fromJson(Map<String, dynamic> json) => GaleriaModel(
        idGaleria: json["idGaleria"],
        tituloGaleria: json["tituloGaleria"],
        titleGaleriaEn: json["titleGaleriaEn"],
        imageGaleria: json["imageGaleria"],
        linkGaleria: json["linkGaleria"],
        estadoGaleria: json["estadoGaleria"],
        activarEnglish: json["activarEnglish"],
      );
}
