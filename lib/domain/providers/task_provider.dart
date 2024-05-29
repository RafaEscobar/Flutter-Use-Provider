import 'package:flutter/material.dart';
import 'package:use_provider/domain/models/task.dart';

class TaskProvider extends ChangeNotifier {

  final List<Task> _tasks = [
    Task(title: 'Inicio', status: false, dueDate: '10/10/2002')
  ];

  //! Obtener la lista
  List<Task> get tasks => _tasks;

  //! Agregar una nueva tarea
  void addTask(
    String title,
    bool status,
    String dueDate
  ) {
    _tasks.add(Task(title: title, status: status, dueDate: dueDate));
    notifyListeners();
  }

  //! Elimianar la tarea
  void removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  //! Marcar o desmarcar la tarea segun corresponda
  void completeTask(Task task){
    task.completed();
    notifyListeners();
  }


}