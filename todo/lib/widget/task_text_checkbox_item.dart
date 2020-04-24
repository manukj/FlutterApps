import 'package:flutter/material.dart';
import 'package:todo/model/Task.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  TaskItem(this.task);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task.toDoString,
        style: TextStyle(
          decoration: widget.task.isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        isChecked: widget.task.isChecked,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function toggleCheckBox;

  TaskCheckBox({this.isChecked, this.toggleCheckBox});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlue,
      value: isChecked,
      onChanged: toggleCheckBox,
    );
  }
}
