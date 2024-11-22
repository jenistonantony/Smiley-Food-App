// import 'dart:convert';

// LoginModel loginModelFromJson(String str) =>
//     LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

// class LoginModel {
//   int? code;
//   bool? status;
//   String? message;
//   WelcomeData? data;

//   LoginModel({this.code, this.status, this.message, this.data});

//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         code: json["code"],
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] == null ? null : WelcomeData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "status": status,
//         "message": message,
//         "data": data?.toJson(),
//       };
// }

// class WelcomeData {
//   String? token;
//   DataDetails? data;

//   WelcomeData({this.token, this.data});

//   factory WelcomeData.fromJson(Map<String, dynamic> json) => WelcomeData(
//         token: json["token"],
//         data: json["data"] == null ? null : DataDetails.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "token": token,
//         "data": data?.toJson(),
//       };
// }

// class DataDetails {
//   String? mobileNo;
//   String? uuid;
//   String? role;

//   DataDetails({this.mobileNo, this.uuid, this.role});

//   factory DataDetails.fromJson(Map<String, dynamic> json) => DataDetails(
//         mobileNo: json["mobileNo"],
//         uuid: json["uuid"],
//         role: json["role"],
//       );

//   Map<String, dynamic> toJson() => {
//         "mobileNo": mobileNo,
//         "uuid": uuid,
//         "role": role,
//       };
// }
