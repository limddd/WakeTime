import 'package:flutter/material.dart';

class ActiveAlarmScreen extends StatelessWidget {
  const ActiveAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('알람이 울렸습니다.'),
      ),
    );
  }
}
