import 'dart:convert';

List<Remarks> remarksFromJson(String str) =>
    List<Remarks>.from(json.decode(str).map((x) => Remarks.fromJson(x)));

String remarksToJson(List<Remarks> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Remarks {
  Remarks({
    required this.remId,
    required this.remarks,
    required this.clinicId,
    required this.clientId,
    required this.createdAt,
    required this.clinicName,
    required this.clinicDentistName,
    required this.clinicEmail,
    required this.clinicContactNo,
  });

  String remId;
  String remarks;
  String clinicId;
  String clientId;
  DateTime createdAt;
  String clinicName;
  String clinicDentistName;
  String clinicEmail;
  String clinicContactNo;

  factory Remarks.fromJson(Map<String, dynamic> json) => Remarks(
        remId: json["rem_id"],
        remarks: json["remarks"],
        clinicId: json["clinic_id"],
        clientId: json["client_id"],
        createdAt: DateTime.parse(json["created_at"]),
        clinicName: json["clinic_name"],
        clinicDentistName: json["clinic_dentist_name"],
        clinicEmail: json["clinic_email"],
        clinicContactNo: json["clinic_contact_no"],
      );

  Map<String, dynamic> toJson() => {
        "rem_id": remId,
        "remarks": remarks,
        "clinic_id": clinicId,
        "client_id": clientId,
        "created_at": createdAt.toIso8601String(),
        "clinic_name": clinicName,
        "clinic_dentist_name": clinicDentistName,
        "clinic_email": clinicEmail,
        "clinic_contact_no": clinicContactNo,
      };
}
