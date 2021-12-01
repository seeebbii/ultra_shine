class FilmsModel {
  FilmsModel({
    this.id,
    this.title,
    this.description,
    this.types,
  });

  int? id;
  String? title;
  String? description;
  List<Type>? types;

  factory FilmsModel.fromJson(Map<String, dynamic> json) => FilmsModel(
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
