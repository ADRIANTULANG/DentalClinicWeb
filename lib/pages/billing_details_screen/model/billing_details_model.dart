import 'dart:convert';

List<ClinicBillingDetails> clinicBillingDetailsFromJson(String str) =>
    List<ClinicBillingDetails>.from(
        json.decode(str).map((x) => ClinicBillingDetails.fromJson(x)));

String clinicBillingDetailsToJson(List<ClinicBillingDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicBillingDetails {
  ClinicBillingDetails({
    required this.subsId,
    required this.subsClinicId,
    required this.subsAmount,
    required this.subsExpirationDate,
    required this.subsPurchasedDate,
    required this.clinicName,
  });

  String subsId;
  String subsClinicId;
  String subsAmount;
  DateTime subsExpirationDate;
  DateTime subsPurchasedDate;
  String clinicName;

  factory ClinicBillingDetails.fromJson(Map<String, dynamic> json) =>
      ClinicBillingDetails(
        subsId: json["subs_id"],
        subsClinicId: json["subs_clinic_id"],
        subsAmount: json["subs_amount"],
        subsExpirationDate: DateTime.parse(json["subs_expiration_date"]),
        subsPurchasedDate: DateTime.parse(json["subs_purchased_date"]),
        clinicName: json["clinic_name"],
      );

  Map<String, dynamic> toJson() => {
        "subs_id": subsId,
        "subs_clinic_id": subsClinicId,
        "subs_amount": subsAmount,
        "subs_expiration_date": subsExpirationDate.toIso8601String(),
        "subs_purchased_date": subsPurchasedDate.toIso8601String(),
        "clinic_name": clinicName,
      };
}
