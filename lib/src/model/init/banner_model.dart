class BannerModel {
  String? idBanner;
  String? nroBanner;
  String? titleBanner;
  String? titleBannerEn;
  String? subtitleBanner;
  String? subtitleBannerEn;
  String? imageBanner;
  String? updateData;
  String? activateEnglish;

  BannerModel({
    this.idBanner,
    this.nroBanner,
    this.titleBanner,
    this.titleBannerEn,
    this.subtitleBanner,
    this.subtitleBannerEn,
    this.imageBanner,
    this.updateData,
    this.activateEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idBanner': idBanner,
        'nroBanner': nroBanner,
        'tituloBanner': titleBanner,
        'titleBannerEn': titleBannerEn,
        'subtituloBanner': subtitleBanner,
        'subtitleBannerEn': subtitleBannerEn,
        'imageBanner': imageBanner,
        'updateData': updateData,
        'activarEnglish': activateEnglish,
      };

  static List<BannerModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => BannerModel.fromJson(i)).toList();

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        idBanner: json["idBanner"],
        nroBanner: json["nroBanner"],
        titleBanner: json["tituloBanner"],
        titleBannerEn: json["titleBannerEn"],
        subtitleBanner: json["subtituloBanner"],
        subtitleBannerEn: json["subtitleBannerEn"],
        imageBanner: json["imageBanner"],
        updateData: json["updateData"],
        activateEnglish: json["activarEnglish"],
      );
}
