import 'package:flutter/material.dart';
import '../controller/task_controller.dart';
import '../model/task_model.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TaskController _taskController = TaskController();
  final TextEditingController _taskTextController = TextEditingController();

  void _addTask() {
    if (_taskTextController.text.isNotEmpty) {
      setState(() {
        _taskController.addTask(_taskTextController.text);
        _taskTextController.clear();
      });
    }
  }

  void _toggleTask(int index) {
    setState(() {
      _taskController.toggleTaskStatus(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskTextController,
              decoration: const InputDecoration(
                hintText: 'Escreva a Tarefa',
                icon: Icon(Icons.task),
                labelText: 'Tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTask,
              child: const Text('Cadastrar'),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _taskController.tasks.length,
                itemBuilder: (context, index) {
                  Task task = _taskController.tasks[index];
                  return CheckboxListTile(
                    title: Text(task.taskName),
                    value: task.isCompleted,
                    onChanged: (bool? value) {
                      _toggleTask(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
