// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

LoginModel loginModelFromMap(String str) =>
    LoginModel.fromMap(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
  String phoneNumber;
  String authToken;
  String refToken;
  String id;
  String status;
  String name;
  bool admin;
  String isLinkedTo;

  LoginModel({
    required this.phoneNumber,
    required this.authToken,
    required this.refToken,
    required this.id,
    required this.status,
    required this.name,
    required this.admin,
    required this.isLinkedTo,
  });

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        phoneNumber: json["phoneNumber"],
        authToken: json["authToken"],
        refToken: json["refToken"],
        id: json["id"],
        status: json["status"],
        name: json["name"],
        admin: json["admin"],
        isLinkedTo: json["isLinkedTo"],
      );

  Map<String, dynamic> toMap() => {
        "phoneNumber": phoneNumber,
        "authToken": authToken,
        "refToken": refToken,
        "id": id,
        "status": status,
        "name": name,
        "admin": admin,
        "isLinkedTo": isLinkedTo,
      };
}
