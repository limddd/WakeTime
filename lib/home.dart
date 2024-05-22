import 'package:flutter/material.dart';
import 'package:wake_time/alarm_screen.dart';
import 'package:wake_time/time_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TestList(),
      appBar: AppBar(
        actions: [
          const IconButton(
            onPressed: null,
            icon: Icon(
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
    );
  }
}
