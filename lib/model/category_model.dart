import 'dart:convert';

CategoryModel welcomeFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String welcomeToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  int? code;
  bool? status;
  String? message;
  List<Datum>? data;

  CategoryModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? categoryName;
  String? imgUrl;
  String? status;
  List<dynamic>? pinCode;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.categoryName,
    this.imgUrl,
    this.status,
    this.pinCode,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        categoryName: json["categoryName"],
        imgUrl: json["imgUrl"],
        status: json["status"],
        pinCode: json["pinCode"] == null
            ? []
            : List<dynamic>.from(json["pinCode"]!.map((x) => x)),
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
        "categoryName": categoryName,
        "imgUrl": imgUrl,
        "status": status,
        "pinCode":
            pinCode == null ? [] : List<dynamic>.from(pinCode!.map((x) => x)),
        "deleted": deleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
