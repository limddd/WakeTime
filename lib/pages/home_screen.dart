import 'package:flutter/material.dart';
import 'package:wake_time/helpers/list_box_helper.dart';
import 'package:wake_time/helpers/selected_box_helper.dart';
import 'package:wake_time/pages/alarm_screen.dart';
import 'package:wake_time/pages/add_alarm_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  handleResetHive() async {
    await SelectedHelper().deleteAll();
    await AlarmListHelper().deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WakeTime'),
        leading: IconButton(
            onPressed: () => handleResetHive(),
            icon: const Icon(Icons.reset_tv)),
        actions: [
          IconButton(
            onPressed: () async {
              var v = await AlarmListHelper().read();
              debugPrint(v.toString());
            },
            icon: const Icon(
              Icons.bluetooth,
              size: 40.0,
            ),
          ),
          GestureDetector(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimePickerrr(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                size: 40.0,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: const AlarmScreen(),
    );
  }
}
