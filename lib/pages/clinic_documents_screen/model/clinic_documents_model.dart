import 'dart:convert';

List<ClinicDocuments> clinicDocumentsFromJson(String str) =>
    List<ClinicDocuments>.from(
        json.decode(str).map((x) => ClinicDocuments.fromJson(x)));

String clinicDocumentsToJson(List<ClinicDocuments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicDocuments {
  ClinicDocuments({
    required this.docId,
    required this.clinicId,
    required this.clinicImgDocument,
    required this.clinicDocDescription,
  });

  String docId;
  String clinicId;
  String clinicImgDocument;
  String clinicDocDescription;

  factory ClinicDocuments.fromJson(Map<String, dynamic> json) =>
      ClinicDocuments(
        docId: json["doc_id"],
        clinicId: json["clinic_id"],
        clinicImgDocument: json["clinic_img_document"],
        clinicDocDescription: json["clinic_doc_description"],
      );

  Map<String, dynamic> toJson() => {
        "doc_id": docId,
        "clinic_id": clinicId,
        "clinic_img_document": clinicImgDocument,
        "clinic_doc_description": clinicDocDescription,
      };
}
