class Polishtypes {
  int? id;
  String? title;
  bool? isSelected;
  String? description;
  int? isInterior;
  List<Type>? types;

  Polishtypes({
    this.id,
    this.title,
    this.isSelected,
    this.description,
    this.isInterior,
    this.types,
  });

  Polishtypes.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    isSelected = false;
    description = json["description"];
    isInterior = json["is_interior"];
    types = List<Type>.from(json["types"].map((x) => Type.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "isSelected": false,
        "description": description,
        "is_interior": isInterior,
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
      };
}

class Type {
  int? id;
  String? name;
  int? price;
  bool? selected;
  Type({this.id, this.name, this.price, this.selected});

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        selected: false,
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "price": price, "selected": false};
}
