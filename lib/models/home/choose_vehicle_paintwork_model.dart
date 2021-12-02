class ChooseVehiclePaintworkModel {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  bool? value;

  ChooseVehiclePaintworkModel(
      {this.id, this.name, this.image, this.createdAt, this.updatedAt, this.value});

  ChooseVehiclePaintworkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    value = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
