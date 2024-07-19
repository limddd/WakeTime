import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:wake_time/main.dart';

Future<void> showNotification({
  required String id,
  required String title,
  required String body,
}) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    id,
    'sampleChannnel',
    channelDescription: 'description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      int.parse(id), title, body, platformChannelSpecifics,
      payload: 'item x');
}
