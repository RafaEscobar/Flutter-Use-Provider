import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:use_provider/domain/providers/task_provider.dart';
import 'package:use_provider/domain/widgets/checkbox_widget.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context){
    final taskProvider = context.watch<TaskProvider>();
    print(taskProvider.tasks[0].status);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uso de providers'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tareas del día',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskProvider.tasks[index];
                    return CheckboxWidget(task: task,);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}