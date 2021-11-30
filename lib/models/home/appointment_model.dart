class AppointmentModel {

  String? title;
  String? status;
  String? note;
  bool isExpanded;

  AppointmentModel({this.title, this.status, this.note, required this.isExpanded});

// AppointmentModel.fromJson(Map<String, dynamic> json){
  //     this.id = json['id'];
  //     this.name = json['name'];
  // }
  //
  // Map<String, dynamic> toJson() => {'id':id, 'name':name };
}