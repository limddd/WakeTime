import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

class TimePickerrr extends StatefulWidget {
  const TimePickerrr({super.key});

  @override
  State<TimePickerrr> createState() => _TimePickerrrState();
}

class _TimePickerrrState extends State<TimePickerrr> {
  DateTime dateTime = DateTime.now();
  //var music = ['아기상어', '뽀로', '조희연바보'];
  final List<String> musicList = ['아기상어', '문어의꿈', '티니핑'];
  final List<String> weekList = ['월', '화', '수', '목', '금', '토', '일'];
  String? _selectedMusic;
  String? _selectedDay;

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
                  onPressed: () {
                    void showToast(String message) {
                      Fluttertoast.showToast(
                          msg: message,
                          backgroundColor:
                              const Color.fromARGB(230, 195, 194, 194),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER);
                    }

                    showToast('알람이 설정되었습니다.');
                  },
                  icon: const Icon(
                    Icons.check,
                    size: 36,
                  ),
                ),
              ],
            ),
            TimePickerSpinner(
              locale: const Locale('kr', ''),
              time: dateTime,
              is24HourMode: true,
              isShowSeconds: false,
              itemHeight: 90,
              itemWidth: 60,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('노래선택'),
                    DropdownButton(
                        value: _selectedMusic,
                        menuMaxHeight: 150,
                        items: musicList.map((String itemText) {
                          return DropdownMenuItem<String>(
                            value: itemText,
                            child: SizedBox(child: Text(itemText)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              _selectedMusic = newValue!;
                            },
                          );
                        }),
                  ],
                ),
                Column(
                  children: [
                    const Text('요일선택'),
                    MultiSelectDropdown.simpleList(
                      list: weekList,
                      initiallySelected: const [],
                      onChange: (newList) {},
                      includeSearch: true,
                      includeSelectAll: true,
                      isLarge: true,
                      width: 200,
                      //    boxDecoration: BoxDecoration(borderRadius: ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
