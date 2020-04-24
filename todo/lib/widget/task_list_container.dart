import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/tasks_data.dart';

class TaskListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TaskData>(
        builder: (context, data, _) {
          return Container(
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
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    data.gettask(index).toDoString,
                    style: TextStyle(
                        decoration: data.gettask(index).isChecked
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  trailing: Checkbox(
                    activeColor: Colors.lightBlue,
                    value: data.gettask(index).isChecked,
                    onChanged: (newState) {
                      data.changeTaskState(index,newState);
                    },
                  ),
                );
              },
              itemCount: data.lengthOfTask,
            ),
          );
        },
      ),
    );
  }
}
