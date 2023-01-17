import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // print("fcm:MessagingBackground:${message.data.toString()}");
  await Firebase.initializeApp();
  pushCustomNotification(message);
  // print("Handling a background message: ${message.messageId}");
}

pushCustomNotification(RemoteMessage message) async {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: int.parse(message.data['id']),
        channelKey: 'Erfan',
        title: message.data['title'],
        body: message.data['body'],
        bigPicture: message.data['image'] ?? "",
        notificationLayout: message.data['image'] != null
            ? NotificationLayout.BigPicture
            : NotificationLayout.BigText,
        payload: {"data": json.encode(message.data)}),
  );
}

pushProgressNotificationForUploadingFile(int id, int progress) {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id,
          channelKey: 'carpi_notification',
          title: "",
          body: "Loading",
          notificationLayout: NotificationLayout.ProgressBar,
          progress: progress,
          locked: false,
          autoDismissible: true));
}

deleteNotification(int id) {
  AwesomeNotifications().dismiss(id);
}

class FCMService {
  startFCM({required bool authenticated}) async {
    try {
      //Init firebase carpi_notification
      await Firebase.initializeApp();

      FirebaseMessaging messaging = FirebaseMessaging.instance;
      print(FirebaseMessaging.instance.getToken());

      // Update token when user login
      FirebaseMessaging.instance.onTokenRefresh.listen((String token) async {});
      String? token = await FirebaseMessaging.instance.getToken();
      // if (await SecureStorageManager()
      //     .isContainsKey(SecureStorageKeys.accountData)) {
      //   AdminNotificationsController().updateFCMToken(token!);
      // }

      try {
        NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
      } catch (e) {
        throw Exception(e.toString());
      }

      AwesomeNotifications().initialize(null, [
        NotificationChannel(
            channelKey: 'Erfan',
            channelName: 'Erfan',
            channelDescription:
                'Erfan channel get you all news/notification in Erfan App',
            defaultColor: Colors.blue,
            channelShowBadge: true,
            ledColor: Colors.white)
      ]);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        print("fcm:onMessage:${message.data}");
        pushCustomNotification(message);
      });

      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);

      AwesomeNotifications().actionStream.listen((receivedNotification) async {
        Map<String, dynamic> bodydata =
            json.decode(receivedNotification.payload!['data'].toString());

        print("fcm:click:${receivedNotification.payload}");
      }, onDone: () {});

      await FirebaseMessaging.instance.subscribeToTopic('All');
      if (authenticated) {
        await FirebaseMessaging.instance.subscribeToTopic("Authenticated");
      }
      if (!authenticated) {
        await FirebaseMessaging.instance.subscribeToTopic("Unauthenticated");
      }
      if (kDebugMode) {
        await FirebaseMessaging.instance.subscribeToTopic('Testing');
      }
    } catch (e) {}
  }
}
