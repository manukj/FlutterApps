import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/tasks_data.dart';
import 'package:todo/widget/add_new_task.dart';
import 'package:todo/widget/task_list_container.dart';
import 'package:todo/widget/task_top.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddNewTask());
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: ChangeNotifierProvider<TaskData>(
          create: (context) => TaskData(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TaskTop(),
              TaskListContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
