import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:wake_time/helpers/list_box_helper.dart';
import 'package:wake_time/models/list_box_model.dart';
import 'package:wake_time/pages/alarm_screen.dart';
import 'package:wake_time/pages/home_screen.dart';
import 'package:wake_time/utils/time_picker.dart';

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
  List<dynamic>? _selectedDay;
  final TextEditingController _controller = TextEditingController(text: '알람');
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: const Color.fromARGB(230, 195, 194, 194),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  onPressed: () async {
                    if (_selectedDay == null || _selectedDay!.isEmpty) {
                      showToast('알람을 듣고자 하는 요일을 선택해주세요.');
                      return;
                    } else if (_selectedMusic == null) {
                      showToast('알람으로 듣고자 하는 노래를 선택해주세요.');
                      return;
                    } else {
                      debugPrint(
                          '${dateTime.hour}, ${dateTime.minute}, $_selectedMusic, $_selectedDay, ${_controller.text.isEmpty ? '알람' : _controller.text}');
                      AlarmListHelper()
                          .create(ListBoxModel(
                        const Uuid().v4(),
                        _controller.text.isEmpty ? '알람' : _controller.text,
                        dateTime.hour.toDouble(),
                        dateTime.minute.toDouble(),
                        _selectedMusic!,
                        _selectedDay!,
                        false,
                      ))
                          .then((value) {
                        showToast('알람이 설정되었습니다.');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      });
                    }
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
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Flexible(flex: 1, child: Text('레이블')),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '알람',
                          ),
                          controller: _controller,
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                  const Divider(),
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
                            whenEmpty: '요일을 선택해주세요',
                            initiallySelected: const [],
                            onChange: (newList) {
                              _selectedDay = newList;
                            },
                            includeSearch: false,
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
            )
          ],
        ),
      ),
    );
  }
}
