import 'dart:convert';

ResigterModel welcomeFromJson(String str) => ResigterModel.fromJson(json.decode(str));

String welcomeToJson(ResigterModel data) => json.encode(data.toJson());

class ResigterModel {
  int? code;
  bool? status;
  String? message;
  WelcomeData? data;

  ResigterModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory ResigterModel.fromJson(Map<String, dynamic> json) => ResigterModel(
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
  dynamic uuid;
  String? role;

  DataData({
    this.userName,
    this.email,
    this.userId,
    this.mobileNo,
    this.uuid,
    this.role,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        userName: json["userName"],
        email: json["email"],
        userId: json["userId"],
        mobileNo: json["mobileNo"],
        uuid: json["uuid"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "userId": userId,
        "mobileNo": mobileNo,
        "uuid": uuid,
        "role": role,
      };
}
