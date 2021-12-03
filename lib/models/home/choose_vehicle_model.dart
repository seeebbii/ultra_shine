class ChooseVehicleModel {
  int? id;
  bool? isSelected;
  String? carText;
  String? imagePath;
  String? description;
  String? createdAt;
  String? updatedAt;

  ChooseVehicleModel(
      {this.isSelected,
      this.carText,
      this.imagePath,
      this.id,
      this.description,
      this.createdAt,
      this.updatedAt});

  ChooseVehicleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carText = json['name'];
    description = json['description'];
    isSelected = false;
    imagePath = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': carText,
        'description': description,
        'isSelected': isSelected,
        'image': imagePath,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
