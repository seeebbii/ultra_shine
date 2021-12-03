// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

class ProductsModel {
  ProductsModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.quantity,
      this.image,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.categoryTitle,
      this.isSelected});

  int? id;
  String? name;
  String? description;
  double? price;
  int? quantity;
  String? image;
  int? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? categoryTitle;
  bool? isSelected;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: double.parse(json["price"].toString()),
        quantity: json["quantity"],
        image: json["image"],
        categoryId: json["category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryTitle: json["category_title"],
        isSelected: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "image": image,
        "category_id": categoryId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category_title": categoryTitle,
        "isSelected": isSelected,
      };
}
