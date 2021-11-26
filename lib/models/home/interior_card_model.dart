class InteriorCardModel {

  bool? value;
  String? titleText;
  String? subTitleText;
  List<InteriorOptions> interiorOptions;
  InteriorCardModel({this.value, this.titleText, this.subTitleText, required this.interiorOptions});

// ExteriorCardModel.fromJson(Map<String, dynamic> json){
//     this.id = json['id'];
//     this.name = json['name'];
// }
//
// Map<String, dynamic> toJson() => {'id':id, 'name':name };
}

class InteriorOptions{
  String? packageName;
  double? price;
  bool? selected;

  InteriorOptions({this.packageName, this.price, this.selected});
}