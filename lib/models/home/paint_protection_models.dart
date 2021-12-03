class PaintProtectionModel {
  PaintProtectionModel(
      {this.id,
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
      this.value});

  int? id;
  String? title;
  String? description;
  String? image;
  int? durability;
  int? easeOfApplication;
  int? slickness;
  int? gloss;
  double? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? value;

  factory PaintProtectionModel.fromJson(Map<String, dynamic> json) =>
      PaintProtectionModel(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          image: json["image"],
          durability: json["durability"],
          easeOfApplication: json["ease_of_application"],
          slickness: json["slickness"],
          gloss: json["gloss"],
          price: double.parse(json["price"].toString()),
          createdAt: DateTime.parse(json["created_at"]),
          updatedAt: DateTime.parse(json["updated_at"]),
          value: false);

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
        "updated_at": updatedAt?.toIso8601String(),
        "value": value,
      };
}
