import 'package:flutter/material.dart';
import 'package:to_day/widgets/addNewTask.dart';
import 'package:to_day/widgets/complete.dart';
import 'package:to_day/widgets/completedTask.dart';
import 'package:to_day/widgets/pending.dart';

import 'package:to_day/widgets/prog_bar.dart';
import './config/Palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'toDay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Palette.seaSwatch,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> pendingTasks = [
    'Water the plants',
    'Write the book report',
    'Move my bike',
  ];
  List<String> compTasks = [
    'Get groceries',
    'Math Homework',
  ];

  void deletepending(int ind) {
    setState(() {
      pendingTasks.removeAt(ind);
    });
  }

  void deletecomp(int ind) {
    setState(() {
      compTasks.removeAt(ind);
    });
  }

  void moveToComp(int ind) {
    setState(() {
      String temp = pendingTasks[ind];
      pendingTasks.removeAt(ind);
      compTasks.add(temp);
    });
  }

  void moveToPending(int ind) {
    setState(() {
      String temp = compTasks[ind];
      compTasks.removeAt(ind);
      pendingTasks.add(temp);
    });
  }

  void addTask(String task) {
    setState(() {
      pendingTasks.add(task);
    });
  }

  void startNewTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (buildContext) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: AddNewTask(addTask),
        );
      },
    );
  }

  void showConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (bctx) {
        return AlertDialog(
          title: const Text("Are You Sure?"),
          content: const Text(
              "You are about to delete all pending and completed tasks"),
          actions: [
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                setState(() {
                  pendingTasks.clear();
                  compTasks.clear();
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            )
          ],
        );
      },
    );
  }

  double get progRatio {
    int totalSize = (compTasks.length + pendingTasks.length);
    return totalSize == 0 ? 0.0 : (compTasks.length) / totalSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("toDay"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showConfirmation(context);
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          startNewTask(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProgBar(progRatio),
            Pending(pendingTasks, deletepending, moveToComp),
            Complete(compTasks, deletecomp, moveToPending),
          ],
        ),
      ),
    );
  }
}
