import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wake_time/helpers/list_box_helper.dart';
import 'package:wake_time/helpers/selected_box_helper.dart';
import 'package:wake_time/models/list_box_model.dart';
import 'package:wake_time/models/selected_model.dart';
import 'package:wake_time/pages/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  // await BLEHelper().openBox();
  //!SelectModel & Box init
  Hive.registerAdapter(SelectedModelAdapter());
  await SelectedHelper().openBox();
  //!AlarmListModel & Box init
  Hive.registerAdapter(ListBoxModelAdapter());
  await AlarmListHelper().openBox();
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
