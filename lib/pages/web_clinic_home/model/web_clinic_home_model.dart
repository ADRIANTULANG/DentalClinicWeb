import 'dart:convert';

import 'package:get/get.dart';

List<ApprovedList> approvedListFromJson(String str) => List<ApprovedList>.from(
    json.decode(str).map((x) => ApprovedList.fromJson(x)));

String approvedListToJson(List<ApprovedList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApprovedList {
  ApprovedList({
    this.resId,
    this.resServiceName,
    this.resClinicId,
    this.resServicePrice,
    this.resFee,
    this.resTotalAmount,
    required this.resSchedule,
    this.resScheduleTime,
    this.resPaymentGateway,
    this.resClientId,
    this.resStatus,
    this.resRemarks,
  });

  String? resId;
  String? resServiceName;
  String? resClinicId;
  String? resServicePrice;
  String? resFee;
  String? resTotalAmount;
  DateTime resSchedule;
  String? resScheduleTime;
  String? resPaymentGateway;
  String? resClientId;
  String? resStatus;
  String? resRemarks;

  factory ApprovedList.fromJson(Map<String, dynamic> json) => ApprovedList(
        resId: json["res_id"] ?? "",
        resServiceName: json["res_service_name"] ?? "",
        resClinicId: json["res_clinic_id"] ?? "",
        resServicePrice: json["res_service_price"] ?? "",
        resFee: json["res_fee"] ?? "",
        resTotalAmount: json["res_total_amount"] ?? "",
        resSchedule: DateTime.parse(json["res_schedule"]),
        resScheduleTime: json["res_schedule_time"] ?? "",
        resPaymentGateway: json["res_payment_gateway"] ?? "",
        resClientId: json["res_client_id"] ?? "",
        resStatus: json["res_status"] ?? "",
        resRemarks: json["res_remarks"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "res_id": resId,
        "res_service_name": resServiceName,
        "res_clinic_id": resClinicId,
        "res_service_price": resServicePrice,
        "res_fee": resFee,
        "res_total_amount": resTotalAmount,
        "res_schedule": resSchedule.toIso8601String(),
        "res_schedule_time": resScheduleTime,
        "res_payment_gateway": resPaymentGateway,
        "res_client_id": resClientId,
        "res_status": resStatus,
        "res_remarks": resRemarks,
      };
}

List<ServicesList> servicesListFromJson(String str) => List<ServicesList>.from(
    json.decode(str).map((x) => ServicesList.fromJson(x)));

String servicesListToJson(List<ServicesList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesList {
  ServicesList({
    required this.servicesId,
    required this.servicesName,
    required this.servicesClinicId,
    required this.servicesPrice,
    required this.servicesDescription,
    required this.servicesStatus,
  });

  String servicesId;
  RxString servicesName;
  String servicesClinicId;
  String servicesPrice;
  String servicesDescription;
  String servicesStatus;

  factory ServicesList.fromJson(Map<String, dynamic> json) => ServicesList(
        servicesId: json["services_id"],
        servicesName: json["services_name"].toString().obs,
        servicesClinicId: json["services_clinic_id"],
        servicesPrice: json["services_price"],
        servicesDescription: json["services_description"],
        servicesStatus: json["services_status"],
      );

  Map<String, dynamic> toJson() => {
        "services_id": servicesId,
        "services_name": servicesName,
        "services_clinic_id": servicesClinicId,
        "services_price": servicesPrice,
        "services_description": servicesDescription,
        "services_status": servicesStatus,
      };
}

List<DentistList> dentistListFromJson(String str) => List<DentistList>.from(
    json.decode(str).map((x) => DentistList.fromJson(x)));

String dentistListToJson(List<DentistList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DentistList {
  DentistList({
    required this.dentistPosition,
    required this.dentistId,
    required this.dentistClinicId,
    required this.dentistName,
    required this.dentistContact,
    required this.dentistEmail,
    required this.status,
  });
  String dentistPosition;
  String dentistId;
  String dentistClinicId;
  String dentistName;
  String dentistContact;
  String dentistEmail;
  String status;

  factory DentistList.fromJson(Map<String, dynamic> json) => DentistList(
        dentistPosition: json["dentist_position"],
        dentistId: json["dentist_id"],
        dentistClinicId: json["dentist_clinic_id"],
        dentistName: json["dentist_name"],
        dentistContact: json["dentist_contact"],
        dentistEmail: json["dentist_email"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "dentist_position": dentistPosition,
        "dentist_id": dentistId,
        "dentist_clinic_id": dentistClinicId,
        "dentist_name": dentistName,
        "dentist_contact": dentistContact,
        "dentist_email": dentistEmail,
        "status": status,
      };
}

List<AppointmentList> appointmentListFromJson(String str) =>
    List<AppointmentList>.from(
        json.decode(str).map((x) => AppointmentList.fromJson(x)));

String appointmentListToJson(List<AppointmentList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentList {
  AppointmentList({
    this.resId,
    this.resServiceName,
    this.resClinicId,
    this.resServicePrice,
    this.resFee,
    this.resTotalAmount,
    required this.resSchedule,
    this.resScheduleTime,
    this.resPaymentGateway,
    this.resClientId,
    this.resStatus,
    this.resRemarks,
    this.clientName,
    this.fcmToken,
    this.resWalkinName,
    this.resType,
  });

  String? resWalkinName;
  String? resType;
  String? resId;
  String? resServiceName;
  String? resClinicId;
  String? resServicePrice;
  String? resFee;
  String? resTotalAmount;
  DateTime resSchedule;
  String? resScheduleTime;
  String? resPaymentGateway;
  String? resClientId;
  String? resStatus;
  String? resRemarks;
  String? clientName;
  String? fcmToken;

  factory AppointmentList.fromJson(Map<String, dynamic> json) =>
      AppointmentList(
        resId: json["res_id"] ?? "",
        resServiceName: json["res_service_name"] ?? "",
        resClinicId: json["res_clinic_id"] ?? "",
        resServicePrice: json["res_service_price"] ?? "",
        resFee: json["res_fee"] ?? "",
        resTotalAmount: json["res_total_amount"] ?? "",
        resSchedule: DateTime.parse(json["res_schedule"]),
        resScheduleTime: json["res_schedule_time"] ?? "",
        resPaymentGateway: json["res_payment_gateway"] ?? "",
        resClientId: json["res_client_id"] ?? "",
        resStatus: json["res_status"] ?? "",
        resRemarks: json["res_remarks"] ?? "",
        clientName: json["client_name"] ?? "",
        fcmToken: json["fcmToken"] ?? "",
        resWalkinName: json["res_walkin_client_name"] ?? "",
        resType: json["res_type"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "res_walkin_client_name": resWalkinName,
        "resType": resType,
        "res_id": resId,
        "res_service_name": resServiceName,
        "res_clinic_id": resClinicId,
        "res_service_price": resServicePrice,
        "res_fee": resFee,
        "res_total_amount": resTotalAmount,
        "res_schedule": resSchedule.toIso8601String(),
        "res_schedule_time": resScheduleTime,
        "res_payment_gateway": resPaymentGateway,
        "res_client_id": resClientId,
        "res_status": resStatus,
        "res_remarks": resRemarks,
        "client_name": clientName,
        "fcmToken": fcmToken,
      };
}

List<WalkinList> walkinListFromJson(String str) =>
    List<WalkinList>.from(json.decode(str).map((x) => WalkinList.fromJson(x)));

String walkinListToJson(List<WalkinList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WalkinList {
  WalkinList({
    required this.walkInId,
    required this.patientName,
    required this.serviceName,
    required this.servicePrice,
    required this.clinicId,
    required this.clinicName,
    required this.time,
    required this.contactno,
    required this.email,
    required this.address,
    required this.date,
  });

  String walkInId;
  String patientName;
  String serviceName;
  String servicePrice;
  String clinicId;
  String clinicName;
  String time;
  String contactno;
  String email;
  String address;
  DateTime date;

  factory WalkinList.fromJson(Map<String, dynamic> json) => WalkinList(
        walkInId: json["walk_in_id"],
        patientName: json["patient_name"],
        serviceName: json["service_name"],
        servicePrice: json["service_price"],
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        time: json["time"],
        contactno: json["contactno"],
        email: json["email"],
        address: json["address"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "walk_in_id": walkInId,
        "patient_name": patientName,
        "service_name": serviceName,
        "service_price": servicePrice,
        "clinic_id": clinicId,
        "clinic_name": clinicName,
        "time": time,
        "contactno": contactno,
        "email": email,
        "address": address,
        "date": date.toIso8601String(),
      };
}

List<RemarksList> remarksListFromJson(String str) => List<RemarksList>.from(
    json.decode(str).map((x) => RemarksList.fromJson(x)));

String remarksListToJson(List<RemarksList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RemarksList {
  RemarksList({
    required this.remId,
    required this.remarks,
    required this.clinicId,
    required this.clientId,
    required this.remarksPermission,
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
  String remarksPermission;
  DateTime createdAt;
  String clinicName;
  String clinicDentistName;
  String clinicEmail;
  String clinicContactNo;

  factory RemarksList.fromJson(Map<String, dynamic> json) => RemarksList(
        remId: json["rem_id"],
        remarks: json["remarks"],
        clinicId: json["clinic_id"],
        clientId: json["client_id"],
        remarksPermission: json["remarks_permission"],
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
        "remarks_permission": remarksPermission,
        "created_at": createdAt.toIso8601String(),
        "clinic_name": clinicName,
        "clinic_dentist_name": clinicDentistName,
        "clinic_email": clinicEmail,
        "clinic_contact_no": clinicContactNo,
      };
}

List<AccessLogModel> accessLogModelFromJson(String str) =>
    List<AccessLogModel>.from(
        json.decode(str).map((x) => AccessLogModel.fromJson(x)));

String accessLogModelToJson(List<AccessLogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AccessLogModel {
  AccessLogModel({
    this.clientId,
    this.clientName,
    this.clientAddress,
    this.clientEmail,
    this.clientContactNo,
    this.fcmToken,
  });

  String? clientId;
  String? clientName;
  String? clientAddress;
  String? clientEmail;
  String? clientContactNo;
  String? fcmToken;

  factory AccessLogModel.fromJson(Map<String, dynamic> json) => AccessLogModel(
        clientId: json["client_id"] ?? "",
        clientName: json["client_name"] ?? "",
        clientAddress: json["client_address"] ?? "",
        clientEmail: json["client_email"] ?? "",
        clientContactNo: json["client_contact_no"] ?? "",
        fcmToken: json["fcmToken"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_name": clientName,
        "client_address": clientAddress,
        "client_email": clientEmail,
        "client_contact_no": clientContactNo,
        "fcmToken": fcmToken,
      };
}

List<NotificationSchedule> notificationScheduleFromJson(String str) =>
    List<NotificationSchedule>.from(
        json.decode(str).map((x) => NotificationSchedule.fromJson(x)));

String notificationScheduleToJson(List<NotificationSchedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationSchedule {
  NotificationSchedule({
    required this.notifId,
    required this.clientName,
    required this.clientId,
    required this.clinicId,
    required this.clinicName,
    required this.notifSchedule,
    required this.isNotified,
    required this.fcmToken,
  });

  String notifId;
  String clientName;
  String clientId;
  String clinicId;
  String clinicName;
  DateTime notifSchedule;
  String isNotified;
  String fcmToken;

  factory NotificationSchedule.fromJson(Map<String, dynamic> json) =>
      NotificationSchedule(
        notifId: json["notif_id"],
        clientName: json["client_name"],
        clientId: json["client_id"],
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        notifSchedule: DateTime.parse(json["notif_schedule"]),
        isNotified: json["isNotified"],
        fcmToken: json["fcmToken"],
      );

  Map<String, dynamic> toJson() => {
        "notif_id": notifId,
        "client_name": clientName,
        "client_id": clientId,
        "clinic_id": clinicId,
        "clinic_name": clinicName,
        "notif_schedule": notifSchedule.toIso8601String(),
        "isNotified": isNotified,
        "fcmToken": fcmToken,
      };
}
