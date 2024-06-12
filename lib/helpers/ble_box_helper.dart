import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wake_time/models/task.dart';

const String BLE_BOX = 'BLE_BOX';

///BLEHelper
///* Singleton Patten
class BLEHelper {
  static final BLEHelper _singleton = BLEHelper._internal();

  factory BLEHelper() {
    return _singleton;
  }
  BLEHelper._internal();

  Box<Task>? tasksBox;

  Future openBox() async {
    tasksBox = await Hive.openBox(BLE_BOX);
    debugPrint('ble box open state: ${tasksBox!.isOpen ? 'open' : 'close'}');
  }

  // * CURD

  Future create(Task newTask) async {
    return tasksBox!.add(newTask);
  }

  Future<List<Task>> read() async {
    return tasksBox!.values.toList();
  }

  Future update(int index, Task updatedTask) async {
    tasksBox!.putAt(index, updatedTask);
  }

  Future delete(int index) async {
    tasksBox!.deleteAt(index);
  }
}
