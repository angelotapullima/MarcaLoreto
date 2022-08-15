class CategoryModel {
  String? idCategory;
  String? typeCategory;
  String? nameCategory;
  String? nameCategoryEn;
  String? imageCategory;
  String? estateCategory;
  String? activateEnglish;

  CategoryModel({
    this.idCategory,
    this.typeCategory,
    this.nameCategory,
    this.nameCategoryEn,
    this.imageCategory,
    this.estateCategory,
    this.activateEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idCategoria': idCategory,
        'tipoCategoria': typeCategory,
        'nombreCategoria': nameCategory,
        'nameCategoriaEn': nameCategoryEn,
        'imageCategoria': imageCategory,
        'estadoCategoria': estateCategory,
        'activarEnglish': activateEnglish,
      };

  static List<CategoryModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => CategoryModel.fromJson(i)).toList();

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        idCategory: json["idCategoria"],
        typeCategory: json["tipoCategoria"],
        nameCategory: json["nombreCategoria"],
        nameCategoryEn: json["nameCategoriaEn"],
        imageCategory: json["imageCategoria"],
        estateCategory: json["estadoCategoria"],
        activateEnglish: json["activarEnglish"],
      );
}
