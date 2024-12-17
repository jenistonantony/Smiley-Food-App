import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? code;
  bool? status;
  String? message;
  LoginModelData? data;

  LoginModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: LoginModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class LoginModelData {
  String? token;
  DataData? data;

  LoginModelData({
    this.token,
    this.data,
  });

  factory LoginModelData.fromJson(Map<String, dynamic> json) => LoginModelData(
        token: json["token"],
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "data": data!.toJson(),
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
