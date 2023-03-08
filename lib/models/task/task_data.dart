import 'package:flutter/material.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskName: 'taskTitle', deadTime: 'deadTime'),
    Task(taskName: 'taskTitle', deadTime: 'deadTime'),
    Task(taskName: 'taskTitle', deadTime: 'deadTime'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String taskTitle, String deadTime) {
    _tasks.add(Task(taskName: taskTitle, deadTime: deadTime));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
