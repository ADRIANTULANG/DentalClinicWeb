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
