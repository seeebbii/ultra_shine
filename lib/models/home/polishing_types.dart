class Polishtypes {
  int? id;
  String? title;
  String? description;
  String? image;
  int? durability;
  int? easeOfApplication;
  int? slickness;
  int? gloss;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  // int? id;
  // String? title;
  bool? isSelected;
  // String? description;
  // int? isInterior;
  // List<Type>? types;

  Polishtypes({
    this.id,
    this.title,
    this.description,
    this.image,
    this.durability,
    this.easeOfApplication,
    this.slickness,
    this.gloss,
    this.price,
    this.createdAt,
    this.updatedAt,
    // this.id,
    // this.title,
    this.isSelected,
    // this.description,
    // this.isInterior,
    // this.types,
  });

  Polishtypes.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    image = json["image"];
    durability = json["durability"];
    easeOfApplication = json["ease_of_application"];
    slickness = json["slickness"];
    gloss = json["gloss"];
    price = json["price"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);

    // id = json["id"];
    // title = json["title"];
    isSelected = false;
    // description = json["description"];
    // isInterior = json["is_interior"];
    // types = List<Type>.from(json["types"].map((x) => Type.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "durability": durability,
        "ease_of_application": easeOfApplication,
        "slickness": slickness,
        "gloss": gloss,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        // "id": id,
        // "title": title,
        "isSelected": false,
        // "description": description,
        // "is_interior": isInterior,
        // "types": List<dynamic>.from(types!.map((x) => x.toJson())),
      };
}

// class Type {
//   int? id;
//   String? name;
//   double? price;
//   bool? selected;
//   Type({this.id, this.name, this.price, this.selected});

//   factory Type.fromJson(Map<String, dynamic> json) => Type(
//         id: json["id"],
//         name: json["name"],
//         price: double.parse(json["price"].toString()),
//         selected: false,
//       );

//   Map<String, dynamic> toJson() =>
//       {"id": id, "name": name, "price": price, "selected": false};
// }
