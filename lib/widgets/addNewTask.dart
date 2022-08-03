import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  final Function buttonHandler;
  AddNewTask(this.buttonHandler);
  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final taskNameController = TextEditingController();

  void submitData() {
    final enteredTask = taskNameController.text;
    if (enteredTask.isEmpty) return;
    widget.buttonHandler(enteredTask);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 6,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: taskNameController,
                onSubmitted: (_) {
                  submitData();
                },
                decoration: const InputDecoration(
                  labelText: "Task",
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: submitData,
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
