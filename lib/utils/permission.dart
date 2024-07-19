import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wake_time/main.dart';

getPermission() async {
  var status = await Permission.notification.status;
  if (status.isGranted) {
    debugPrint('허락됨');
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin
        .initialize(initializationSettings)
        .whenComplete(() => debugPrint('FLN Plugin init Complete'));

    debugPrint(DateTime.now().toString());
  } else if (status.isDenied) {
    debugPrint('거부됨, 권한 요청 개시.');
    Permission.notification.request();
  }
}
