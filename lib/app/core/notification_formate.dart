import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'notification_service.dart';

class NotificationsFormate {
  static startup() {
    _notifyOnListening();
    // _showLocalNotification(
    //     0, "Welcome", "Test notification", () {});
    _onOpenAppListen();
  }

  static _showLocalNotification(
      int id, String title, String description, VoidCallback ontap) {
    NotificationInitilization.flutterLocalNotificationsPlugin!.show(
        id,
        title,
        description,
        NotificationDetails(
            android: AndroidNotificationDetails(
                NotificationInitilization.channel!.id,
                NotificationInitilization.channel!.name,
                subText: NotificationInitilization.channel!.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher'
              // icon: 'assets/icons/logo.png'

            )), payload: "TESTTT");
  }

  static _notifyOnListening() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      String id = message.data['id'];
      debugPrint("Notify on listening" + id);

      if (notification != null && android != null) {
        NotificationInitilization.flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                NotificationInitilization.channel!.id,
                NotificationInitilization.channel!.name,
                subText: NotificationInitilization.channel!.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });
  }

  static _onOpenAppListen() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      String id = message.data['id'];
      String otp = message.data['otp'];
      debugPrint("On Open App Listen" + id);
      debugPrint('A new onMessageOpenedApp event was published!');

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        NotificationInitilization.flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                NotificationInitilization.channel!.id,
                NotificationInitilization.channel!.name,
                subText: NotificationInitilization.channel!.description,
                color: Colors.blue,
                playSound: true,
                // icon: 'assets/icons/logo.png'
                icon: '@mipmap/ic_launcher',
              ),
            ));
        payload: id;
      }
    });
  }

  Future onSelectNotification(String payload) async {
    debugPrint(payload);
  }
}