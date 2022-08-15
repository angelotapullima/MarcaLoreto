class SectionModel {
  String? idSection;
  String? titleSection;
  String? titleSectionEn;
  String? subtitle1Section;
  String? subtitle1SectionEn;
  String? subtitle2Section;
  String? subtitle2SectionEn;
  String? imageSection;
  String? updateData;
  String? activateEnglish;

  SectionModel({
    this.idSection,
    this.titleSection,
    this.titleSectionEn,
    this.subtitle1Section,
    this.subtitle1SectionEn,
    this.subtitle2Section,
    this.subtitle2SectionEn,
    this.imageSection,
    this.updateData,
    this.activateEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idSeccion': idSection,
        'tituloSeccion': titleSection,
        'titleSeccionEn': titleSectionEn,
        'subtitulo1Seccion': subtitle1Section,
        'subtitle1SeccionEn': subtitle1SectionEn,
        'subtitulo2Seccion': subtitle2Section,
        'subtitle2SeccionEn': subtitle2SectionEn,
        'imageSeccion': imageSection,
        'updateData': updateData,
        'activarEnglish': activateEnglish,
      };

  static List<SectionModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => SectionModel.fromJson(i)).toList();

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        idSection: json["idSeccion"],
        titleSection: json["tituloSeccion"],
        titleSectionEn: json["titleSeccionEn"],
        subtitle1Section: json["subtitulo1Seccion"],
        subtitle1SectionEn: json["subtitle1SeccionEn"],
        subtitle2Section: json["subtitulo2Seccion"],
        subtitle2SectionEn: json["subtitle2SeccionEn"],
        imageSection: json["imageSeccion"],
        updateData: json["updateData"],
        activateEnglish: json["activarEnglish"],
      );
}
