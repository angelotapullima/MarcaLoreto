class SeccionModel {
  String? idSeccion;
  String? tituloSeccion;
  String? titleSeccionEn;
  String? subtitulo1Seccion;
  String? subtitle1SeccionEn;
  String? subtitulo2Seccion;
  String? subtitle2SeccionEn;
  String? imageSeccion;
  String? updateData;
  String? activarEnglish;

  SeccionModel({
    this.idSeccion,
    this.tituloSeccion,
    this.titleSeccionEn,
    this.subtitulo1Seccion,
    this.subtitle1SeccionEn,
    this.subtitulo2Seccion,
    this.subtitle2SeccionEn,
    this.imageSeccion,
    this.updateData,
    this.activarEnglish,
  });

  Map<String, dynamic> toJson() => {
        'idSeccion': idSeccion,
        'tituloSeccion': tituloSeccion,
        'titleSeccionEn': titleSeccionEn,
        'subtitulo1Seccion': subtitulo1Seccion,
        'subtitle1SeccionEn': subtitle1SeccionEn,
        'subtitulo2Seccion': subtitulo2Seccion,
        'subtitle2SeccionEn': subtitle2SeccionEn,
        'imageSeccion': imageSeccion,
        'updateData': updateData,
        'activarEnglish': activarEnglish,
      };

  static List<SeccionModel> fromJsonList(List<dynamic> json) => json.map((i) => SeccionModel.fromJson(i)).toList();

  factory SeccionModel.fromJson(Map<String, dynamic> json) => SeccionModel(
        idSeccion: json["idSeccion"],
        tituloSeccion: json["tituloSeccion"],
        titleSeccionEn: json["titleSeccionEn"],
        subtitulo1Seccion: json["subtitulo1Seccion"],
        subtitle1SeccionEn: json["subtitle1SeccionEn"],
        subtitulo2Seccion: json["subtitulo2Seccion"],
        subtitle2SeccionEn: json["subtitle2SeccionEn"],
        imageSeccion: json["imageSeccion"],
        updateData: json["updateData"],
        activarEnglish: json["activarEnglish"],
      );
}
