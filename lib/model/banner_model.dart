// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BannerModel welcomeFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String welcomeToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  int? code;
  bool? status;
  String? message;
  Data? data;

  BannerModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<Datum>? data;
  int? totalCount;

  Data({
    this.data,
    this.totalCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalCount": totalCount,
      };
}

class Datum {
  String? id;
  String? name;
  String? imageUrl;
  String? status;
  String? type;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.name,
    this.imageUrl,
    this.status,
    this.type,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        status: json["status"],
        type: json["type"],
        deleted: json["deleted"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "imageUrl": imageUrl,
        "status": status,
        "type": type,
        "deleted": deleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
