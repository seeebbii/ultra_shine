class FilmCardModel {

  bool? value;
  String? titleText;
  String? subTitleText;
  List<FilmOptions> filmOptions;
  FilmCardModel({this.value, this.titleText, this.subTitleText, required this.filmOptions});

// ExteriorCardModel.fromJson(Map<String, dynamic> json){
//     this.id = json['id'];
//     this.name = json['name'];
// }
//
// Map<String, dynamic> toJson() => {'id':id, 'name':name };
}

class FilmOptions{
  String? packageName;
  double? price;
  bool? selected;

  FilmOptions({this.packageName, this.price, this.selected});
}