class DetalleCategoriaModel {
  String? idDetalleCategoria;
  String? idCategoria;
  String? subtituloDetalleCategoria;
  String? subtitleDetalleCategoriaEn;
  String? imageDetalleCategoria;
  String? estadoDetalleCategoria;
  String? detalleCategoriaDetalle;
  String? detailCategoriaDetalleEn;
  String? activarEnglish;

  DetalleCategoriaModel({
    this.idDetalleCategoria,
    this.idCategoria,
    this.subtituloDetalleCategoria,
    this.subtitleDetalleCategoriaEn,
    this.imageDetalleCategoria,
    this.estadoDetalleCategoria,
    this.detalleCategoriaDetalle,
    this.detailCategoriaDetalleEn,
    this.activarEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idDetalleCategoria': idDetalleCategoria,
        'idCategoria': idCategoria,
        'subtituloDetalleCategoria': subtituloDetalleCategoria,
        'subtitleDetalleCategoriaEn': subtitleDetalleCategoriaEn,
        'imageDetalleCategoria': imageDetalleCategoria,
        'estadoDetalleCategoria': estadoDetalleCategoria,
        'detalleCategoriaDetalle': detalleCategoriaDetalle,
        'detailCategoriaDetalleEn': detailCategoriaDetalleEn,
        'activarEnglish': activarEnglish,
      };

  static List<DetalleCategoriaModel> fromJsonList(List<dynamic> json) => json.map((i) => DetalleCategoriaModel.fromJson(i)).toList();

  factory DetalleCategoriaModel.fromJson(Map<String, dynamic> json) => DetalleCategoriaModel(
        idDetalleCategoria: json["idDetalleCategoria"],
        idCategoria: json["idCategoria"],
        subtituloDetalleCategoria: json["subtituloDetalleCategoria"],
        subtitleDetalleCategoriaEn: json["subtitleDetalleCategoriaEn"],
        imageDetalleCategoria: json["imageDetalleCategoria"],
        estadoDetalleCategoria: json["estadoDetalleCategoria"],
        detalleCategoriaDetalle: json["detalleCategoriaDetalle"],
        detailCategoriaDetalleEn: json["detailCategoriaDetalleEn"],
        activarEnglish: json["activarEnglish"],
      );
}
