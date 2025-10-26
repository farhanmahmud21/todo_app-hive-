import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/TodoTile.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/utils/dialog_box.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ToDoApp()));
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  void initState() {
    super.initState();
    if (_mybox.get('TODOLIST') == null) {
      db.createIntialData();
    } else {
      db.loadData();
    }
  }

  TextEditingController taskName = TextEditingController();
  var _mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  void onChange(int index) {
    setState(() {
      db.todos[index][1] = !db.todos[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.todos.add([taskName.text, false]);
      taskName.clear();
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.todos.removeAt(index);
    });
    db.updateData();
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
        itemCount: db.todos.length,
        itemBuilder: (context, index) {
          return Todotile(
            delete: (value) => deleteTask(index),
            valueOfCheck: db.todos[index][1],
            change: (value) => onChange(index),
            toDoName: db.todos[index][0],
          );
        },
      ),
    );
  }
}
