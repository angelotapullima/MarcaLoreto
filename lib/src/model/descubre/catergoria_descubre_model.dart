class CategoriaDescubreModel {
  String? idCategoriaDescubre;
  String? tipoCategoriaDescubre;
  String? nombreCategoriaDescubre;
  String? imageCategoriaDescubre;
  String? estadoCategoriaDescubre;

  CategoriaDescubreModel({
    this.idCategoriaDescubre,
    this.tipoCategoriaDescubre,
    this.nombreCategoriaDescubre,
    this.imageCategoriaDescubre,
    this.estadoCategoriaDescubre,
  });

  Map<String, dynamic> toJson() => {
        'idCategoriaDescubre': idCategoriaDescubre,
        'tipoCategoriaDescubre': tipoCategoriaDescubre,
        'nombreCategoriaDescubre': nombreCategoriaDescubre,
        'imageCategoriaDescubre': imageCategoriaDescubre,
        'estadoCategoriaDescubre': estadoCategoriaDescubre,
      };

  static List<CategoriaDescubreModel> fromJsonList(List<dynamic> json) => json.map((i) => CategoriaDescubreModel.fromJson(i)).toList();

  factory CategoriaDescubreModel.fromJson(Map<String, dynamic> json) => CategoriaDescubreModel(
        idCategoriaDescubre: json["idCategoriaDescubre"],
        tipoCategoriaDescubre: json["tipoCategoriaDescubre"],
        nombreCategoriaDescubre: json["nombreCategoriaDescubre"],
        imageCategoriaDescubre: json["imageCategoriaDescubre"],
        estadoCategoriaDescubre: json["estadoCategoriaDescubre"],
      );
}
