class Task{
  String title;
  String? dueDate;
  bool status;

  Task({
    required this.title,
    required this.status,
    this.dueDate
  });

  void completed(){
    status = !status;
  }
}