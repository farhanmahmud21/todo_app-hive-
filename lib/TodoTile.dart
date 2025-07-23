import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final bool valueOfCheck;
  final Function(bool?) change;
  final String toDoName;
  final Function(BuildContext) delete;
  const Todotile({
    super.key,
    required this.valueOfCheck,
    required this.change,
    required this.toDoName,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),

          children: [
            SlidableAction(
              onPressed: delete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Row(
            children: [
              Checkbox(
                value: valueOfCheck,
                onChanged: (value) => change(value),
              ),
              Text(
                toDoName,
                style: TextStyle(
                  decoration: valueOfCheck
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
