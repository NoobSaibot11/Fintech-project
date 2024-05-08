class Classes{
  final String subject;
  final String type;
  final String teacherName;
  final DateTime time;
  Classes({
    required this.subject,
    required this.type,
    required this.teacherName,
    required this.time,
  });
}
List<Classes> classes=[
  Classes(
    subject: 'Mathematics', 
    type: 'Online', 
    teacherName: 'Sir Agorkar', 
    time: DateTime.parse("2023-01-12 08:30:00"),
  ),
  Classes(
    subject: 'Science', 
    type: 'Online', 
    teacherName: 'Sir Anand Hiran', 
    time: DateTime.parse("2023-01-12 08:30:00"),
  ),
  Classes(
    subject: 'Histroy', 
    type: 'Online', 
    teacherName: 'Sir Vijay Dange', 
    time: DateTime.parse("2023-01-12 08:30:00"),
  ),
];