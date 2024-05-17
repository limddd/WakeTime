import 'package:flutter/material.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class TimePickerrr extends StatefulWidget {
  const TimePickerrr({super.key});

  @override
  State<TimePickerrr> createState() => _TimePickerrrState();
}

class _TimePickerrrState extends State<TimePickerrr> {
  DateTime dateTime = DateTime.now();
  var music = ['아기상어', '뽀로로', '조희연바보'];
  final List<String> musicList =
      List.generate(10, (index) => "조희연바보 ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check,
                    size: 36,
                  ),
                ),
              ],
            ),
            TimePickerSpinner(
              locale: const Locale('en', ''),
              time: dateTime,
              is24HourMode: true,
              isShowSeconds: false,
              itemHeight: 90,
              normalTextStyle:
                  const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              highlightedTextStyle: const TextStyle(
                  fontSize: 36,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
              isForce2Digits: false,
              onTimeChange: (time) {
                setState(
                  () {
                    dateTime = time;
                  },
                );
              },
            ),
            const Divider(),
            Text(
              '${dateTime.hour}:${dateTime.minute}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    ListView(
                      scrollDirection: axisDirectionToAxis(AxisDirection.down),
                    );
                  },
                  child: const Text('사운드'),
                ),
                const Text('반복')
              ],
            )
          ],
        ),
      ),
    );
  }
}
