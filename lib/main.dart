import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wake_time/helpers/list_box_helper.dart';
import 'package:wake_time/helpers/selected_box_helper.dart';
import 'package:wake_time/models/list_box_model.dart';
import 'package:wake_time/models/selected_model.dart';
import 'package:wake_time/pages/home_screen.dart';
import 'package:wake_time/utils/local_notification.dart' as ln;
import 'package:wake_time/utils/permission.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  await Hive.initFlutter();
  // await BLEHelper().openBox();
  //!SelectModel & Box init
  Hive.registerAdapter(SelectedModelAdapter());
  await SelectedHelper().openBox();
  //!AlarmListModel & Box init
  Hive.registerAdapter(ListBoxModelAdapter());
  await AlarmListHelper().openBox();
  //알림 관련부
  await getPermission();

  await AndroidAlarmManager.initialize();
  await ln.showNotification(
    id: '000',
    title: 'FLN Plugin init',
    body: 'FLN Plugin init Complete!!',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
