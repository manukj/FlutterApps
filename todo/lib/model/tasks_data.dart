import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _listOfTask = [Task("task 1"), Task("task 2")];

  int get lengthOfTask {
    return _listOfTask.length;
  }

  Task gettask(int index) {
    return _listOfTask[index];
  }

  void addTask(Task newTask) {
    _listOfTask.add(newTask);
    print("added ${newTask.toDoString} task");
    notifyListeners();
  }

  void changeTaskState(int index, bool newState) {
    _listOfTask[index].isChecked = newState;
    notifyListeners();
  }
}
