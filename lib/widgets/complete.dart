import 'package:flutter/material.dart';
import 'package:to_day/widgets/pendingTask.dart';

import 'completedTask.dart';

class Complete extends StatelessWidget {
  final List<String> compTasks;
  final Function deleteComp;
  final Function moveToPending;
  Complete(this.compTasks, this.deleteComp, this.moveToPending);

  List<Widget> get compWidget {
    List<Widget> temp = [];
    for (int i = 0; i < compTasks.length; i++) {
      temp.add(CompletedTask(
        compTasks[i],
        () {
          deleteComp(i);
        },
        () {
          moveToPending(i);
        },
      ));
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(
        bottom: 15,
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            child: const Icon(
              Icons.check,
              size: 35,
            ),
          ),
          ...compWidget,
        ],
      ),
    );
  }
}
