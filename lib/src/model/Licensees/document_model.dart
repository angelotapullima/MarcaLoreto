class DocumentModel {
  String? idDocument;
  String? documentTitle;
  String? documentFile;
  String? documentUrlIntern;
  String? stateDocument;

  DocumentModel({
    this.idDocument,
    this.documentTitle,
    this.documentFile,
    this.documentUrlIntern,
    this.stateDocument,
  });

  static List<DocumentModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => DocumentModel.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
        'idDocument': idDocument,
        'documentTitulo': documentTitle,
        'documentFile': documentFile,
        'documentUrlInterno': documentUrlIntern,
        'documentEstado': stateDocument,
      };

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
        idDocument: json["idDocument"],
        documentTitle: json["documentTitulo"],
        documentFile: json["documentFile"],
        documentUrlIntern: json["documentUrlInterno"],
        stateDocument: json["documentEstado"],
      );
}
