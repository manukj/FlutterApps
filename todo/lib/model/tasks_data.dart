import 'package:flutter/material.dart';
import 'package:todo/model/Task.dart';
import 'package:todo/widget/task_text_checkbox_item.dart';

class TaskData extends ChangeNotifier {
  List<TaskItem> listOfTask = [];

  void addTask(Task newTask) {
    listOfTask.add(TaskItem(newTask));
    notifyListeners();
  }
}
