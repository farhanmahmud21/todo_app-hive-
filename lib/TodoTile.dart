import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  final bool valueOfCheck;
  final Function(bool?) change;
  final String toDoName;
  const Todotile({
    super.key,
    required this.valueOfCheck,
    required this.change,
    required this.toDoName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          children: [
            Checkbox(value: valueOfCheck, onChanged: change),
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
    );
  }
}
