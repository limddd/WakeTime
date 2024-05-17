/*import 'package:flutter/material.dart';
import 'package:wake_time/time_picker.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  TimeOfDay initialTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("돌아가기"),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    '${initialTime.hour}:${initialTime.minute}',
                    style: const TextStyle(fontSize: 40),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context, initialTime: initialTime);
                      if (timeOfDay != null) {
                        setState(() {
                          initialTime = timeOfDay;
                        });
                      }
                    },
                    child: const TimePickerrr(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/