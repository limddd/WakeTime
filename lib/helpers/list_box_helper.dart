import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wake_time/models/list_box_model.dart';

const String ALARM_LIST_BOX = 'ALARM_LIST_BOX';

///AlarmListHelper
///* Singleton Patten
class AlarmListHelper {
  static final AlarmListHelper _singleton = AlarmListHelper._internal();

  factory AlarmListHelper() {
    return _singleton;
  }
  AlarmListHelper._internal();

  Box<ListBoxModel>? tasksBox;

  Future openBox() async {
    tasksBox = await Hive.openBox(ALARM_LIST_BOX);
    debugPrint('list box open state: ${tasksBox!.isOpen ? 'open' : 'close'}');
  }

  // * CURD

  Future create(ListBoxModel newTask) async {
    return tasksBox!.add(newTask);
  }

  Future<List<ListBoxModel>> read() async {
    return tasksBox!.values.toList();
  }

  Future update(int index, ListBoxModel updatedTask) async {
    tasksBox!.putAt(index, updatedTask);
  }

  Future delete(int index) async {
    tasksBox!.deleteAt(index);
  }

  Future deleteAll() async {
    tasksBox!.deleteFromDisk();
  }
}
