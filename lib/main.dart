import 'package:flutter/material.dart';
import 'view/todo_list_page.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
       // useMaterial3: true,
      ),
      home: TodoListPage(),
    );
  }
}
