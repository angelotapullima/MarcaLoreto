class DocumentModel {
  String? idDocument;
  String? documentTitulo;
  String? documentFile;
  String? documentUrlInterno;
  String? documentEstado;

  DocumentModel({
    this.idDocument,
    this.documentTitulo,
    this.documentFile,
    this.documentUrlInterno,
    this.documentEstado,
  });

  static List<DocumentModel> fromJsonList(List<dynamic> json) => json.map((i) => DocumentModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        'idDocument': idDocument,
        'documentTitulo': documentTitulo,
        'documentFile': documentFile,
        'documentUrlInterno': documentUrlInterno,
        'documentEstado': documentEstado,
      };

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
        idDocument: json["idDocument"],
        documentTitulo: json["documentTitulo"],
        documentFile: json["documentFile"],
        documentUrlInterno: json["documentUrlInterno"],
        documentEstado: json["documentEstado"],
      );
}
