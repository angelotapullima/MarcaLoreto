class ArchivosModel {
  String? idArchivo;
  String? nombreArchivo;
  String? nombreArchivoEn;
  String? linkArchivo;
  String? estadoArchivo;
  String? activarEnglish;

  ArchivosModel({
    this.idArchivo,
    this.nombreArchivo,
    this.nombreArchivoEn,
    this.linkArchivo,
    this.estadoArchivo,
    this.activarEnglish,
  });

  static List<ArchivosModel> fromJsonList(List<dynamic> json) => json.map((i) => ArchivosModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        'idArchivo': idArchivo,
        'nombreArchivo': nombreArchivo,
        'nombreArchivoEn': nombreArchivoEn,
        'linkArchivo': linkArchivo,
        'estadoArchivo': estadoArchivo,
        'activarEnglish': activarEnglish,
      };

  factory ArchivosModel.fromJson(Map<String, dynamic> json) => ArchivosModel(
        idArchivo: json["idArchivo"],
        nombreArchivo: json["nombreArchivo"],
        nombreArchivoEn: json["nombreArchivoEn"],
        linkArchivo: json["linkArchivo"],
        estadoArchivo: json["estadoArchivo"],
        activarEnglish: json["activarEnglish"],
      );
}
