import 'package:flutter/material.dart';
import 'package:to_do/TodoTile.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List todos = [
    ['tutorial', false],
    ['Cricket', true],
  ];
  void onChange(int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Todo App'),
          backgroundColor: Colors.yellow,
          elevation: 2,
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Todotile(
              valueOfCheck: todos[index][1],
              change: (value) => onChange(index),
              toDoName: todos[index][0],
            );
          },
        ),
      ),
    );
  }
}
