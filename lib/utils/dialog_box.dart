import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback save;
  final TextEditingController controller;

  const DialogBox({super.key, required this.save, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add new Task'),
      backgroundColor: Colors.yellow[200],

      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(controller: controller),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    save();
                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  child: Text('Save'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
