// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class CompletedTask extends StatelessWidget {
  final String taskTitle;
  final VoidCallback buttonHandler;
  final VoidCallback moveButtonHandler;
  CompletedTask(this.taskTitle, this.buttonHandler, this.moveButtonHandler);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Card(
          elevation: 6,
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: IconButton(
                icon: Icon(
                  Icons.timer,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: moveButtonHandler,
              ),
            ),
            title: Text(
              taskTitle,
              style: TextStyle(
                fontFamily: 'QuickSand',
                fontSize: 18,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: buttonHandler,
            ),
          )),
    );
  }
}
