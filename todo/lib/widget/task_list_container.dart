import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/tasks_data.dart';
import 'package:todo/widget/task_text_checkbox_item.dart';

class TaskListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(top: 10),
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            children: Provider.of<TaskData>(context).listOfTask,
          )),
    );
  }

}
