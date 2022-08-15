class BusinessCategoryModel {
  String? idBusinessCategory;
  String? nameBusinessCategory;
  String? nameBusinessCategoryEn;
  String? stateBusinessCategory;
  String? activateEnglish;

  BusinessCategoryModel({
    this.idBusinessCategory,
    this.nameBusinessCategory,
    this.nameBusinessCategoryEn,
    this.stateBusinessCategory,
    this.activateEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idCategoriaNeg': idBusinessCategory,
        'nombreCategoriaNeg': nameBusinessCategory,
        'nameCategoriaNegEn': nameBusinessCategoryEn,
        'estadoCategoriaNeg': stateBusinessCategory,
        'activarEnglish': activateEnglish,
      };

  static List<BusinessCategoryModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => BusinessCategoryModel.fromJson(i)).toList();

  factory BusinessCategoryModel.fromJson(Map<String, dynamic> json) =>
      BusinessCategoryModel(
        idBusinessCategory: json["idCategoriaNeg"],
        nameBusinessCategory: json["nombreCategoriaNeg"],
        nameBusinessCategoryEn: json["nameCategoriaNegEn"],
        stateBusinessCategory: json["estadoCategoriaNeg"],
        activateEnglish: json["activarEnglish"],
      );
}
