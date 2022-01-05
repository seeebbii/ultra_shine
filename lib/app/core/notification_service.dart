import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'notification_formate.dart';

class NotificationInitilization {
  static FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  static AndroidNotificationChannel? channel;

  static initilaizedPushNotifications() async{
    channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        // description: 'This channel is used for important notifications.',
        importance: Importance.high,
        playSound: true);
    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const IOSInitializationSettings();
    var initializationSettings =  InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin?.initialize(initializationSettings,
        onSelectNotification: (payLoad){
          print("TEST");
          print(payLoad);
        });
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _fireBaseInitilized();
    NotificationsFormate.startup();
  }



  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    debugPrint('A bg message just showed up :  ${message.messageId}');
    String id = message.data['id'];
    String otp = message.data['otp'];
    print("OTP received for ID: ${message.data['id']}, OTP: " + message.data['otp']);

  }

  static Future<void> _fireBaseInitilized() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(
        NotificationInitilization.firebaseMessagingBackgroundHandler);

    await NotificationInitilization.flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // CacheData.uniqueToken = (await FirebaseMessaging.instance.getToken())!;
    // print("Token = =  ///=> ${CacheData.uniqueToken}");
  }
}