import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/tasks_data.dart';

class TaskTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(
                Icons.list,
                size: 30,
                color: Colors.lightBlue,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "Todoey",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 50),
          ),
          Text(
            '${Provider.of<TaskData>(context).listOfTask.length} Tasks',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          )
        ],
      ),
    );
  }
}
