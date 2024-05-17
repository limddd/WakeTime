import 'package:flutter/material.dart';

class TestList extends StatefulWidget {
  const TestList({super.key});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  final List<String> testList =
      List.generate(10, (index) => "조희연바보 ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('조희연짱바보'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: testList.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Dismissible(
                  key: ValueKey(testList[index]),
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                        '진짜바보',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(
                      () {
                        if (direction == DismissDirection.endToStart) {
                          testList.removeAt(index);
                        }
                      },
                    );
                  },
                  child: SwitchListTile(
                    title: (Text(
                      testList[index],
                    )),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                );
              }),
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
