class Assign{
  final String title;
  final DateTime dueTime;
  bool isDone = false;

  Assign({
    required this.title,
    required this.dueTime,
  });
}
List<Assign> recentAssign = [
  Assign(
    dueTime: DateTime.parse("2023-10-12 12:00:00"),
    title: 'Mathematics Exercise 7.1'
  ),
  Assign(
    dueTime: DateTime.parse("2023-11-12 11:00:00"),
    title: 'English Grammer Chapter 3'
  )
];