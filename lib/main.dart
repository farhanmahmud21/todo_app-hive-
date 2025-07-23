import 'package:flutter/material.dart';
import 'package:to_do/TodoTile.dart';
import 'package:to_do/utils/dialog_box.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ToDoApp()));
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  TextEditingController taskName = TextEditingController();

  List todos = [
    ['tutorial', false],
    ['Cricket', true],
  ];
  void onChange(int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  void saveTask() {
    setState(() {
      todos.add([taskName.text, false]);
      taskName.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void createTodo() {
    print('alert dialog show now');
    ;
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(save: saveTask, controller: taskName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo App'),
        backgroundColor: Colors.yellow,
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton.small(
        shape: OvalBorder(side: BorderSide(color: Colors.yellow)),
        backgroundColor: Colors.yellow,
        elevation: 2,
        onPressed: createTodo,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Todotile(
            delete: (value) => deleteTask(index),
            valueOfCheck: todos[index][1],
            change: (value) => onChange(index),
            toDoName: todos[index][0],
          );
        },
      ),
    );
  }
}
