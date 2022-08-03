import 'package:flutter/material.dart';
import 'package:to_day/widgets/pendingTask.dart';

class Pending extends StatelessWidget {
  final List<String> pendingTasks;
  final Function deletePending;
  final Function moveToComp;
  Pending(this.pendingTasks, this.deletePending, this.moveToComp);

  List<Widget> get pendingWidget {
    List<Widget> temp = [];
    for (int i = 0; i < pendingTasks.length; i++) {
      temp.add(PendingTask(
        pendingTasks[i],
        () {
          deletePending(i);
        },
        () {
          moveToComp(i);
        },
      ));
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColorLight,
      padding: EdgeInsets.only(
        bottom: 15,
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            child: const Icon(
              Icons.timer,
              color: Colors.white,
              size: 35,
            ),
          ),
          ...pendingWidget,
        ],
      ),
    );
  }
}
