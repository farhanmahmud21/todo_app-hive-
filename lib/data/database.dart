import 'package:hive_flutter/hive_flutter.dart' show Hive;

class ToDoDatabase {
  List todos = [];
  final _mybox = Hive.box('mybox');
  void createIntialData() {
    todos = [
      ['tutorial', false],
      ['Cricket', true],
    ];
  }

  void loadData() {
    todos = _mybox.get('TODOLIST');
  }

  void updateData() {
    _mybox.put('TODOLIST', todos);
  }
}
