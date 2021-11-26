class ExteriorCardModel {

  bool? value;
  String? titleText;
  String? subTitleText;
  List<ExteriorOptions> exteriorOptions;
  ExteriorCardModel({this.value, this.titleText, this.subTitleText, required this.exteriorOptions});

  // ExteriorCardModel.fromJson(Map<String, dynamic> json){
  //     this.id = json['id'];
  //     this.name = json['name'];
  // }
  //
  // Map<String, dynamic> toJson() => {'id':id, 'name':name };
}

class ExteriorOptions{
  String? packageName;
  double? price;
  bool? selected;

  ExteriorOptions({this.packageName, this.price, this.selected});
}