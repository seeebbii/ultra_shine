class FilmsModel {
  FilmsModel(
      {this.id, this.title, this.description, required this.types, this.value});

  int? id;
  String? title;
  String? description;
  List<Type> types;
  bool? value;

  factory FilmsModel.fromJson(Map<String, dynamic> json) => FilmsModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      value: false);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        'value': value,
      };
}

class Type {
  Type({this.id, this.name, this.price, this.selected});

  int? id;
  String? name;
  String? price;
  bool? selected;
  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        price:json["price"], //double.parse((json["price"].toString()).replaceAll(",", ".")),
        selected: false,
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "price": price, "selected": selected};
}
