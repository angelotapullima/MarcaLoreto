class DetalleDescubreModel {
  String? idDetalleDescubre;
  String? idCategoriaDescubre;
  String? subtituloDetalleDescubre;
  String? imageDetalleDescubre;
  String? estadoDetalleDescubre;
  String? detallesDetalleDescubre;

  DetalleDescubreModel({
    this.idDetalleDescubre,
    this.idCategoriaDescubre,
    this.subtituloDetalleDescubre,
    this.imageDetalleDescubre,
    this.estadoDetalleDescubre,
    this.detallesDetalleDescubre,
  });

  Map<String, dynamic> toJson() => {
        'idDetalleDescubre': idDetalleDescubre,
        'idCategoriaDescubre': idCategoriaDescubre,
        'subtituloDetalleDescubre': subtituloDetalleDescubre,
        'imageDetalleDescubre': imageDetalleDescubre,
        'estadoDetalleDescubre': estadoDetalleDescubre,
        'detallesDetalleDescubre': detallesDetalleDescubre,
      };

  static List<DetalleDescubreModel> fromJsonList(List<dynamic> json) => json.map((i) => DetalleDescubreModel.fromJson(i)).toList();

  factory DetalleDescubreModel.fromJson(Map<String, dynamic> json) => DetalleDescubreModel(
        idDetalleDescubre: json["idDetalleDescubre"],
        idCategoriaDescubre: json["idCategoriaDescubre"],
        subtituloDetalleDescubre: json["subtituloDetalleDescubre"],
        imageDetalleDescubre: json["imageDetalleDescubre"],
        estadoDetalleDescubre: json["estadoDetalleDescubre"],
        detallesDetalleDescubre: json["detallesDetalleDescubre"],
      );
}
