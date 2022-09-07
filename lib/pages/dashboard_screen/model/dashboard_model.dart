import 'dart:convert';

List<DentalPending> dentalPendingFromJson(String str) =>
    List<DentalPending>.from(
        json.decode(str).map((x) => DentalPending.fromJson(x)));

String dentalPendingToJson(List<DentalPending> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DentalPending {
  DentalPending({
    required this.clinicId,
    required this.clinicName,
    required this.clinicUsername,
    required this.clinicPassword,
    required this.clinicAddress,
    required this.clinicLat,
    required this.clinicLong,
    required this.clinicImage,
    required this.clinicDentistName,
    required this.clinicEmail,
    required this.clinicContactNo,
    required this.clinicStatus,
  });

  String clinicId;
  String clinicName;
  String clinicUsername;
  String clinicPassword;
  String clinicAddress;
  String clinicLat;
  String clinicLong;
  String clinicImage;
  String clinicDentistName;
  String clinicEmail;
  String clinicContactNo;
  String clinicStatus;

  factory DentalPending.fromJson(Map<String, dynamic> json) => DentalPending(
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        clinicUsername: json["clinic_username"],
        clinicPassword: json["clinic_password"],
        clinicAddress: json["clinic_address"],
        clinicLat: json["clinic_lat"],
        clinicLong: json["clinic_long"],
        clinicImage: json["clinic_image"],
        clinicDentistName: json["clinic_dentist_name"],
        clinicEmail: json["clinic_email"],
        clinicContactNo: json["clinic_contact_no"],
        clinicStatus: json["clinic_status"],
      );

  Map<String, dynamic> toJson() => {
        "clinic_id": clinicId,
        "clinic_name": clinicName,
        "clinic_username": clinicUsername,
        "clinic_password": clinicPassword,
        "clinic_address": clinicAddress,
        "clinic_lat": clinicLat,
        "clinic_long": clinicLong,
        "clinic_image": clinicImage,
        "clinic_dentist_name": clinicDentistName,
        "clinic_email": clinicEmail,
        "clinic_contact_no": clinicContactNo,
        "clinic_status": clinicStatus,
      };
}

List<DentalApproved> dentalApprovedFromJson(String str) =>
    List<DentalApproved>.from(
        json.decode(str).map((x) => DentalApproved.fromJson(x)));

String dentalApprovedToJson(List<DentalApproved> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DentalApproved {
  DentalApproved({
    required this.clinicId,
    required this.clinicName,
    required this.clinicUsername,
    required this.clinicPassword,
    required this.clinicAddress,
    required this.clinicLat,
    required this.clinicLong,
    required this.clinicImage,
    required this.clinicDentistName,
    required this.clinicEmail,
    required this.clinicContactNo,
    required this.clinicStatus,
  });

  String clinicId;
  String clinicName;
  String clinicUsername;
  String clinicPassword;
  String clinicAddress;
  String clinicLat;
  String clinicLong;
  String clinicImage;
  String clinicDentistName;
  String clinicEmail;
  String clinicContactNo;
  String clinicStatus;

  factory DentalApproved.fromJson(Map<String, dynamic> json) => DentalApproved(
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        clinicUsername: json["clinic_username"],
        clinicPassword: json["clinic_password"],
        clinicAddress: json["clinic_address"],
        clinicLat: json["clinic_lat"],
        clinicLong: json["clinic_long"],
        clinicImage: json["clinic_image"],
        clinicDentistName: json["clinic_dentist_name"],
        clinicEmail: json["clinic_email"],
        clinicContactNo: json["clinic_contact_no"],
        clinicStatus: json["clinic_status"],
      );

  Map<String, dynamic> toJson() => {
        "clinic_id": clinicId,
        "clinic_name": clinicName,
        "clinic_username": clinicUsername,
        "clinic_password": clinicPassword,
        "clinic_address": clinicAddress,
        "clinic_lat": clinicLat,
        "clinic_long": clinicLong,
        "clinic_image": clinicImage,
        "clinic_dentist_name": clinicDentistName,
        "clinic_email": clinicEmail,
        "clinic_contact_no": clinicContactNo,
        "clinic_status": clinicStatus,
      };
}

List<ClientsModel> clientsModelFromJson(String str) => List<ClientsModel>.from(
    json.decode(str).map((x) => ClientsModel.fromJson(x)));

String clientsModelToJson(List<ClientsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientsModel {
  ClientsModel({
    required this.clientId,
    required this.clientName,
    required this.clientUsername,
    required this.clientPassword,
    required this.clientAddress,
    required this.clientContactNo,
    required this.clientEmail,
  });

  String clientId;
  String clientName;
  String clientUsername;
  String clientPassword;
  String clientAddress;
  String clientContactNo;
  String clientEmail;

  factory ClientsModel.fromJson(Map<String, dynamic> json) => ClientsModel(
        clientId: json["client_id"],
        clientName: json["client_name"],
        clientUsername: json["client_username"],
        clientPassword: json["client_password"],
        clientAddress: json["client_address"],
        clientContactNo: json["client_contact_no"],
        clientEmail: json["client_email"],
      );

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_name": clientName,
        "client_username": clientUsername,
        "client_password": clientPassword,
        "client_address": clientAddress,
        "client_contact_no": clientContactNo,
        "client_email": clientEmail,
      };
}

List<ClinicSubscribedModel> clinicSubscribedModelFromJson(String str) =>
    List<ClinicSubscribedModel>.from(
        json.decode(str).map((x) => ClinicSubscribedModel.fromJson(x)));

String clinicSubscribedModelToJson(List<ClinicSubscribedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicSubscribedModel {
  ClinicSubscribedModel({
    required this.clinicId,
    required this.clinicName,
    required this.clinicUsername,
    required this.clinicPassword,
    required this.clinicAddress,
    required this.clinicLat,
    required this.clinicLong,
    required this.clinicImage,
    required this.clinicDentistName,
    required this.clinicEmail,
    required this.clinicContactNo,
    required this.fcmToken,
    required this.clinicStatus,
    required this.subscriptionStatus,
    required this.subscriptionAmount,
  });

  String clinicId;
  String clinicName;
  String clinicUsername;
  String clinicPassword;
  String clinicAddress;
  String clinicLat;
  String clinicLong;
  String clinicImage;
  String clinicDentistName;
  String clinicEmail;
  String clinicContactNo;
  String fcmToken;
  String clinicStatus;
  String subscriptionStatus;
  String subscriptionAmount;

  factory ClinicSubscribedModel.fromJson(Map<String, dynamic> json) =>
      ClinicSubscribedModel(
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        clinicUsername: json["clinic_username"],
        clinicPassword: json["clinic_password"],
        clinicAddress: json["clinic_address"],
        clinicLat: json["clinic_lat"],
        clinicLong: json["clinic_long"],
        clinicImage: json["clinic_image"],
        clinicDentistName: json["clinic_dentist_name"],
        clinicEmail: json["clinic_email"],
        clinicContactNo: json["clinic_contact_no"],
        fcmToken: json["fcmToken"],
        clinicStatus: json["clinic_status"],
        subscriptionStatus: json["subscription_status"],
        subscriptionAmount: json["subscription_amount"],
      );

  Map<String, dynamic> toJson() => {
        "clinic_id": clinicId,
        "clinic_name": clinicName,
        "clinic_username": clinicUsername,
        "clinic_password": clinicPassword,
        "clinic_address": clinicAddress,
        "clinic_lat": clinicLat,
        "clinic_long": clinicLong,
        "clinic_image": clinicImage,
        "clinic_dentist_name": clinicDentistName,
        "clinic_email": clinicEmail,
        "clinic_contact_no": clinicContactNo,
        "fcmToken": fcmToken,
        "clinic_status": clinicStatus,
        "subscription_status": subscriptionStatus,
        "subscription_amount": subscriptionAmount,
      };
}
