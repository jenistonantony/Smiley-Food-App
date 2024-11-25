// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

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

class WelcomeData {
  String? token;
  DataData? data;

  WelcomeData({
    this.token,
    this.data,
  });

  factory WelcomeData.fromJson(Map<String, dynamic> json) => WelcomeData(
        token: json["token"],
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "data": data?.toJson(),
      };
}

class DataData {
  String? userName;
  String? email;
  String? userId;
  String? mobileNo;
  String? uuid;

  DataData({
    this.userName,
    this.email,
    this.userId,
    this.mobileNo,
    this.uuid,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        userName: json["userName"],
        email: json["email"],
        userId: json["userId"],
        mobileNo: json["mobileNo"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "userId": userId,
        "mobileNo": mobileNo,
        "uuid": uuid,
      };
}
