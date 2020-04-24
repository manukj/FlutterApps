import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/Task.dart';
import 'package:todo/model/tasks_data.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  String toDoString;
  @override
  Widget build(BuildContext context) {

    print("in build");
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
                print(toDoString);
                print(this.hashCode);
                toDoString = newText;
                print(toDoString);
              },
            ),
            FlatButton(
              child: Text("Add"),
              color: Colors.lightBlue,
              onPressed: () {
                print(this.hashCode);
                print("task $toDoString");
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
