// To parse this JSON data, do
//
//     final filmsModel = filmsModelFromJson(jsonString);

import 'dart:convert';

FilmsModel filmsModelFromJson(String str) =>
    FilmsModel.fromJson(json.decode(str));

String filmsModelToJson(FilmsModel data) => json.encode(data.toJson());

class FilmsModel {
  FilmsModel({
    this.code,
    this.data,
    this.message,
  });

  int? code;
  List<Datum>? data;
  String? message;

  factory FilmsModel.fromJson(Map<String, dynamic> json) => FilmsModel(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.description,
    this.types,
  });

  int? id;
  String? title;
  String? description;
  List<Type>? types;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
      };
}

class Type {
  Type({
    this.id,
    this.name,
    this.price,
  });

  dynamic id;
  dynamic name;
  dynamic price;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
      };
}
