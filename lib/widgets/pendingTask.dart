import 'package:flutter/material.dart';

class PendingTask extends StatelessWidget {
  final String taskTitle;
  final VoidCallback buttonHandler;
  final VoidCallback moveButtonHandler;
  PendingTask(
    this.taskTitle,
    this.buttonHandler,
    this.moveButtonHandler,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Card(
          elevation: 6,
          color: Colors.white,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ),
          child: ListTile(
            leading: CircleAvatar(
                radius: 20,
                child: IconButton(
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  onPressed: moveButtonHandler,
                )),
            title: Text(
              taskTitle,
              style: const TextStyle(
                fontFamily: 'QuickSand',
                fontSize: 18,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: buttonHandler,
            ),
          )),
    );
  }
}
