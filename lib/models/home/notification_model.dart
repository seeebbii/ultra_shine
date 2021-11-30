class NotificationModel {
  String? imagePath;
  String? title;
  String? subtitle;
  DateTime? notificationTime;

  NotificationModel(
      {this.imagePath, this.title, this.subtitle, this.notificationTime});

// NotificationModel.fromJson(Map<String, dynamic> json){
//     this.id = json['id'];
//     this.name = json['name'];
// }
//
// Map<String, dynamic> toJson() => {'id':id, 'name':name };
}
