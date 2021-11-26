class MaintenanceKitModel {

  bool? value;
  String? titleText;
  String? subTitleText;
  List<KitFeatures> kitFeatures;
  MaintenanceKitModel({this.value, this.titleText, this.subTitleText, required this.kitFeatures});
  //
  // MaintenanceKitModel.fromJson(Map<String, dynamic> json){
  //     this.id = json['id'];
  //     this.name = json['name'];
  // }
  //
  // Map<String, dynamic> toJson() => {'id':id, 'name':name };
}

class KitFeatures{
  String? packageName;

  KitFeatures({this.packageName,});
}