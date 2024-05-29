class Task{
  String title;
  String dueDate;
  bool status;

  Task({
    required this.title,
    required this.status,
    required this.dueDate
  });

  void completed(){
    status = !status;
  }
}