import 'dart:convert';

List<LoginModel> loginModelFromJson(String str) =>
    List<LoginModel>.from(json.decode(str).map((x) => LoginModel.fromJson(x)));

String loginModelToJson(List<LoginModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginModel {
  LoginModel({
    required this.empId,
    required this.empName,
    required this.empUsername,
    required this.empPass,
    required this.empPosition,
  });

  String empId;
  String empName;
  String empUsername;
  String empPass;
  String empPosition;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        empId: json["emp_id"],
        empName: json["emp_name"],
        empUsername: json["emp_username"],
        empPass: json["emp_pass"],
        empPosition: json["emp_position"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "emp_name": empName,
        "emp_username": empUsername,
        "emp_pass": empPass,
        "emp_position": empPosition,
      };
}

List<LoginClinicModel> loginClinicModelFromJson(String str) =>
    List<LoginClinicModel>.from(
        json.decode(str).map((x) => LoginClinicModel.fromJson(x)));

String loginClinicModelToJson(List<LoginClinicModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginClinicModel {
  LoginClinicModel({
    required this.accountId,
    required this.username,
    required this.password,
    required this.userId,
    required this.userType,
  });

  String accountId;
  String username;
  String password;
  String userId;
  String userType;

  factory LoginClinicModel.fromJson(Map<String, dynamic> json) =>
      LoginClinicModel(
        accountId: json["account_id"],
        username: json["username"],
        password: json["password"],
        userId: json["user_id"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "username": username,
        "password": password,
        "user_id": userId,
        "user_type": userType,
      };
}

List<ClinicDetails> clinicDetailsFromJson(String str) =>
    List<ClinicDetails>.from(
        json.decode(str).map((x) => ClinicDetails.fromJson(x)));

String clinicDetailsToJson(List<ClinicDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicDetails {
  ClinicDetails({
    required this.clinicId,
    required this.clinicName,
    required this.clinicAddress,
    required this.clinicLat,
    required this.clinicLong,
    required this.clinicImage,
    required this.clinicEmail,
    required this.clinicContactNo,
    required this.fcmToken,
    required this.clinicStatus,
    required this.subscriptionStatus,
    required this.subscriptionAmount,
  });

  String clinicId;
  String clinicName;
  String clinicAddress;
  String clinicLat;
  String clinicLong;
  String clinicImage;
  String clinicEmail;
  String clinicContactNo;
  String fcmToken;
  String clinicStatus;
  String subscriptionStatus;
  String subscriptionAmount;

  factory ClinicDetails.fromJson(Map<String, dynamic> json) => ClinicDetails(
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        clinicAddress: json["clinic_address"],
        clinicLat: json["clinic_lat"],
        clinicLong: json["clinic_long"],
        clinicImage: json["clinic_image"],
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
        "clinic_address": clinicAddress,
        "clinic_lat": clinicLat,
        "clinic_long": clinicLong,
        "clinic_image": clinicImage,
        "clinic_email": clinicEmail,
        "clinic_contact_no": clinicContactNo,
        "fcmToken": fcmToken,
        "clinic_status": clinicStatus,
        "subscription_status": subscriptionStatus,
        "subscription_amount": subscriptionAmount,
      };
}
