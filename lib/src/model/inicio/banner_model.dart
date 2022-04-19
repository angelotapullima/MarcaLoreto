class BannerModel {
  String? idBanner;
  String? nroBanner;
  String? tituloBanner;
  String? titleBannerEn;
  String? subtituloBanner;
  String? subtitleBannerEn;
  String? imageBanner;
  String? updateData;

  BannerModel({
    this.idBanner,
    this.nroBanner,
    this.tituloBanner,
    this.titleBannerEn,
    this.subtituloBanner,
    this.subtitleBannerEn,
    this.imageBanner,
    this.updateData,
  });

  Map<String, dynamic> toJson() => {
        'idBanner': idBanner,
        'nroBanner': nroBanner,
        'tituloBanner': tituloBanner,
        'titleBannerEn': titleBannerEn,
        'subtituloBanner': subtituloBanner,
        'subtitleBannerEn': subtitleBannerEn,
        'imageBanner': imageBanner,
        'updateData': updateData,
      };

  static List<BannerModel> fromJsonList(List<dynamic> json) => json.map((i) => BannerModel.fromJson(i)).toList();

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        idBanner: json["idBanner"],
        nroBanner: json["nroBanner"],
        tituloBanner: json["tituloBanner"],
        titleBannerEn: json["titleBannerEn"],
        subtituloBanner: json["subtituloBanner"],
        subtitleBannerEn: json["subtitleBannerEn"],
        imageBanner: json["imageBanner"],
        updateData: json["updateData"],
      );
}
