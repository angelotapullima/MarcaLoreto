class ProductosModel {
  String? idProducto;

  ProductosModel({
    this.idProducto,
  });

  Map<String, dynamic> toJson() => {
        'idProducto': idProducto,
      };

  static List<ProductosModel> fromJsonList(List<dynamic> json) => json.map((i) => ProductosModel.fromJson(i)).toList();

  factory ProductosModel.fromJson(Map<String, dynamic> json) => ProductosModel(
        idProducto: json["idProducto"],
      );
}
