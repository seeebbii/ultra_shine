class PaintProtectionModel {

  bool? value;
  String? titleText;
  String? subTitleText;
  List<RatingTile> ratingTile;
  PaintProtectionModel({this.value, this.titleText, this.subTitleText, required this.ratingTile});

// ExteriorCardModel.fromJson(Map<String, dynamic> json){
//     this.id = json['id'];
//     this.name = json['name'];
// }
//
// Map<String, dynamic> toJson() => {'id':id, 'name':name };
}

class RatingTile{
  String? packageName;
  double? value;

  RatingTile({this.packageName,this.value});
}