// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:smiley_foods/model/register_model.dart';

TokemModel welcomeFromJson(String str) => TokemModel.fromJson(json.decode(str));

String welcomeToJson(TokemModel data) => json.encode(data.toJson());

class TokemModel {
  int? code;
  bool? status;
  String? message;
  WelcomeData? data;

  TokemModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory TokemModel.fromJson(Map<String, dynamic> json) => TokemModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : WelcomeData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

// class WelcomeData {
//   String? token;
//   DataData? data;

//   WelcomeData({
//     this.token,
//     this.data,
//   });

//   factory WelcomeData.fromJson(Map<String, dynamic> json) => WelcomeData(
//         token: json["token"],
//         data: json["data"] == null ? null : DataData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "token": token,
//         "data": data?.toJson(),
//       };
// }

// class DataData {
//   String? userName;
//   String? email;
//   String? userId;
//   String? mobileNo;
//   String? uuid;

//   DataData({
//     this.userName,
//     this.email,
//     this.userId,
//     this.mobileNo,
//     this.uuid,
//   });

//   factory DataData.fromJson(Map<String, dynamic> json) => DataData(
//         userName: json["userName"],
//         email: json["email"],
//         userId: json["userId"],
//         mobileNo: json["mobileNo"],
//         uuid: json["uuid"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userName": userName,
//         "email": email,
//         "userId": userId,
//         "mobileNo": mobileNo,
//         "uuid": uuid,
//       };
// }

// RegisterModel registerModelFromJson(String str) =>
//     RegisterModel.fromJson(json.decode(str));

// String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

// class RegisterModel {
//   bool? status;
//   String? message;
//   RegisterData? data;

//   RegisterModel({this.status, this.message, this.data});

//   factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] != null ? RegisterData.fromJson(json["data"]) : null,
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data?.toJson(),
//       };
// }

// class RegisterData {
//   String? userId;
//   String? userName;
//   String? email;
//   String? mobileNo;
//   String? token;

//   RegisterData({
//     this.userId,
//     this.userName,
//     this.email,
//     this.mobileNo,
//     this.token,
//   });

//   factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
//         userId: json["userId"],
//         userName: json["userName"],
//         email: json["email"],
//         mobileNo: json["mobileNo"],
//         token: json["token"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "userName": userName,
//         "email": email,
//         "mobileNo": mobileNo,
//         "token": token,
//       };
// }
