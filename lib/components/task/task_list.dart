import 'package:flutter/material.dart';
import 'package:assistant/models/task/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:assistant/models/task/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.tasks.length,
        itemBuilder: (context, index) {
          final Task task = taskData.tasks[index];
          return TaskTile(
            deadTime: task.deadTime,
            position: index,
            taskName: task.taskName,
            isChecked: task.isDone,
            checkboxCallback: (){
              taskData.updateTask(task);
            },
            onLongPressed: (){
              taskData.removeTask(task);
            },
          );
        },
      );
    });
  }
}
