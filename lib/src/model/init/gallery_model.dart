class GalleryModel {
  String? idGallery;
  String? titleGallery;
  String? titleGalleryEn;
  String? imageGallery;
  String? linkGallery;
  String? estateGallery;
  String? activateEnglish;

  GalleryModel({
    this.idGallery,
    this.titleGallery,
    this.titleGalleryEn,
    this.imageGallery,
    this.linkGallery,
    this.estateGallery,
    this.activateEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idGaleria': idGallery,
        'tituloGaleria': titleGallery,
        'titleGaleriaEn': titleGalleryEn,
        'imageGaleria': imageGallery,
        'linkGaleria': linkGallery,
        'estadoGaleria': estateGallery,
        'activarEnglish': activateEnglish,
      };

  static List<GalleryModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => GalleryModel.fromJson(i)).toList();

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        idGallery: json["idGaleria"],
        titleGallery: json["tituloGaleria"],
        titleGalleryEn: json["titleGaleriaEn"],
        imageGallery: json["imageGaleria"],
        linkGallery: json["linkGaleria"],
        estateGallery: json["estadoGaleria"],
        activateEnglish: json["activarEnglish"],
      );
}
