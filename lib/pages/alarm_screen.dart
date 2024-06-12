import 'package:flutter/material.dart';
import 'package:wake_time/helpers/list_box_helper.dart';
import 'package:wake_time/models/list_box_model.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _TestListState();
}

class _TestListState extends State<AlarmScreen> {
  List<String> dataList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          Expanded(
            child: FutureBuilder(
              future: AlarmListHelper().read(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        '데이터가 없습니다.\n알람을 추가해주세요.',
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return ListView.separated(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return Dismissible(
                          key: ValueKey(snapshot.data![index].key),
                          background: Container(
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Text(
                                '삭제',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(
                              () {
                                if (direction == DismissDirection.endToStart) {
                                  AlarmListHelper().delete(index);
                                }
                              },
                            );
                          },
                          child: SwitchListTile(
                              key: ValueKey(index),
                              title: Text(
                                  style: const TextStyle(fontSize: 30),
                                  '${snapshot.data![index].hour.round()} : ${snapshot.data![index].minute.round()}'),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data![index].name),
                                  const SizedBox(width: 10),
                                  Row(
                                    children: [
                                      for (int i = 0;
                                          i < snapshot.data![index].days.length;
                                          i++)
                                        Text(
                                            '${snapshot.data![index].days[i]} '),
                                    ],
                                  )
                                ],
                              ),
                              value: snapshot.data![index].checked,
                              onChanged: (bool value) async {
                                debugPrint('clicked $index');
                                setState(() {
                                  snapshot.data![index].checked = value;
                                });
                                // 데이터 읽기
                                await AlarmListHelper().update(
                                    index,
                                    ListBoxModel(
                                        snapshot.data![index].key,
                                        snapshot.data![index].name,
                                        snapshot.data![index].hour,
                                        snapshot.data![index].minute,
                                        snapshot.data![index].song,
                                        snapshot.data![index].days,
                                        snapshot.data![index].checked));
                                debugPrint(
                                    '업데이트 완료 ${snapshot.data![index].key}, ${snapshot.data![index].checked}');
                              }),
                        );
                      }),
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                      ),
                    );
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
