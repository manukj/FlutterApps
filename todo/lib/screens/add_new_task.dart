import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task.dart';
import 'package:todo/model/tasks_data.dart';

class AddNewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String toDoString;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add New Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
              onChanged: (newText) {
                toDoString = newText;
              },
            ),
            FlatButton(
              child: Text("Add"),
              color: Colors.lightBlue,
              onPressed: () {
                Provider.of<TaskData>(context,listen: false).addTask(Task(toDoString));
                Navigator.pop(context);
              },
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
