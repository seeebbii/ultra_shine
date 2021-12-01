class Polishtypes {
  Polishtypes({
    this.id,
    this.title,
    this.description,
    this.isInterior,
    this.types,
  });

  int? id;
  String? title;
  String? description;
  int? isInterior;
  List<Type>? types;

  factory Polishtypes.fromJson(Map<String, dynamic> json) => Polishtypes(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isInterior: json["is_interior"],
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "is_interior": isInterior,
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
