import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:use_provider/domain/models/task.dart';
import 'package:use_provider/domain/providers/task_provider.dart';

class CheckboxWidget extends StatelessWidget {
  final Task task;

  const CheckboxWidget({
    required this.task,
    super.key
  });

  @override
  Widget build(BuildContext context){
    final taskProvider = context.watch<TaskProvider>();
    return ListTile(
        leading: Checkbox(
          value: task.status,
          onChanged: (bool? value) {
            taskProvider.completeTask(task);
          },
        ),
        title: Text(task.title),
    );
  }
}