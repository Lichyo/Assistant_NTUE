class Task {
  String taskName;
  String deadTime;
  bool isDone;

  Task({required this.taskName, required this.deadTime, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}