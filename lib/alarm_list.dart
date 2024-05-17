/*import 'package:flutter/material.dart';

class AlaramView extends StatefulWidget {
  const AlaramView({super.key});

  @override
  State<AlaramView> createState() => _AlaramViewState();
}

class _AlaramViewState extends State<AlaramView> {
  final  items = L ist<String>.generate(6, (i) => "알람 ${i + 1}");

  bool isSelected = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        debugPrint('key is $item');
        return Dismissible(
          background: Container(
            padding: const EdgeInsets.only(right: 30),
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: const Text(
              '삭제',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(
              () {
                if (direction == DismissDirection.endToStart) {
                  items.removeAt(index);
                }
              },
            );
          },
          key: Key(item),
          child: ListTile(
            title: Text(item),
          ),
        );
      },
    );
  }
}
*/