class AssignTile{
  final String assignTitle;
  final String assignImage;
  final DateTime assignTime;

  AssignTile({
    required this.assignTitle,
    required this.assignImage,
    required this.assignTime
  });
}

List<AssignTile> assignment=[
  AssignTile(assignTitle: "Assignment 1", assignImage: "", assignTime: DateTime.parse(""))
];