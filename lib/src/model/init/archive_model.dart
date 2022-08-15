class ArchiveModel {
  String? idArchive;
  String? nameArchive;
  String? nameArchiveEn;
  String? linkArchive;
  String? estateArchive;
  String? activateEnglish;

  ArchiveModel({
    this.idArchive,
    this.nameArchive,
    this.nameArchiveEn,
    this.linkArchive,
    this.estateArchive,
    this.activateEnglish,
  });

  static List<ArchiveModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => ArchiveModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        'idArchivo': idArchive,
        'nombreArchivo': nameArchive,
        'nombreArchivoEn': nameArchiveEn,
        'linkArchivo': linkArchive,
        'estadoArchivo': estateArchive,
        'activarEnglish': activateEnglish,
      };

  factory ArchiveModel.fromJson(Map<String, dynamic> json) => ArchiveModel(
        idArchive: json["idArchivo"],
        nameArchive: json["nombreArchivo"],
        nameArchiveEn: json["nombreArchivoEn"],
        linkArchive: json["linkArchivo"],
        estateArchive: json["estadoArchivo"],
        activateEnglish: json["activarEnglish"],
      );
}
