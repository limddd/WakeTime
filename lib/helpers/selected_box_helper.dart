import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wake_time/models/selected_model.dart';

const String SELECTED_BOX = 'SELECTED_BOX';

///SelectedHelper
///* Singleton Patten
class SelectedHelper {
  static final SelectedHelper _singleton = SelectedHelper._internal();

  factory SelectedHelper() {
    return _singleton;
  }
  SelectedHelper._internal();

  Box<SelectedModel>? tasksBox;

  Future openBox() async {
    tasksBox = await Hive.openBox(SELECTED_BOX);
    debugPrint(
        'selected box open state: ${tasksBox!.isOpen ? 'open' : 'close'}');
  }

  // * CURD

  Future create(SelectedModel newTask) async {
    return tasksBox!.add(newTask);
  }

  Future<List<SelectedModel>> read() async {
    return tasksBox!.values.toList();
  }

  Future update(int index, SelectedModel updatedTask) async {
    tasksBox!.putAt(index, updatedTask);
  }

  Future delete(int index) async {
    tasksBox!.deleteAt(index);
  }

  Future deleteAll() async {
    tasksBox!.deleteFromDisk();
  }
}
