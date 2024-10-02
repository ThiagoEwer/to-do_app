import '../model/task_model.dart';

class TaskController {
  List<Task> tasks = [];

  void addTask(String taskName) {
    tasks.insert(0, Task(taskName: taskName));
  }

  void toggleTaskStatus(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;

    if (tasks[index].isCompleted) {
      var completedTask = tasks.removeAt(index);
      tasks.add(completedTask);
    } else {
      var uncompletedTask = tasks.removeAt(index);
      tasks.insert(0, uncompletedTask);
    }
  }
}
