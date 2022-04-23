class DetalleCategoriaModel {
  String? idDetalleCategoria;
  String? idCategoria;
  String? subtituloDetalleCategoria;
  String? imageDetalleCategoria;
  String? estadoDetalleCategoria;
  String? detalleCategoriaDetalle;

  DetalleCategoriaModel({
    this.idDetalleCategoria,
    this.idCategoria,
    this.subtituloDetalleCategoria,
    this.imageDetalleCategoria,
    this.estadoDetalleCategoria,
    this.detalleCategoriaDetalle,
  });

  Map<String, dynamic> toJson() => {
        'idDetalleCategoria': idDetalleCategoria,
        'idCategoria': idCategoria,
        'subtituloDetalleCategoria': subtituloDetalleCategoria,
        'imageDetalleCategoria': imageDetalleCategoria,
        'estadoDetalleCategoria': estadoDetalleCategoria,
        'detalleCategoriaDetalle': detalleCategoriaDetalle,
      };

  static List<DetalleCategoriaModel> fromJsonList(List<dynamic> json) => json.map((i) => DetalleCategoriaModel.fromJson(i)).toList();

  factory DetalleCategoriaModel.fromJson(Map<String, dynamic> json) => DetalleCategoriaModel(
        idDetalleCategoria: json["idDetalleCategoria"],
        idCategoria: json["idCategoria"],
        subtituloDetalleCategoria: json["subtituloDetalleCategoria"],
        imageDetalleCategoria: json["imageDetalleCategoria"],
        estadoDetalleCategoria: json["estadoDetalleCategoria"],
        detalleCategoriaDetalle: json["detalleCategoriaDetalle"],
      );
}
