class Alert{
  final String title;
  final String subject;
  final DateTime time;
  Alert({
    required this.title,required this.subject,required this.time
  });
}
List<Alert> recentAlerts = [
    Alert(
      title: 'Math Test',
      subject: 'Algebra',
      time: DateTime.parse("2023-07-17 14:30:00"),
    ),
    Alert(
      title: 'Gravitation Lecture',
      subject: 'Science',
      time: DateTime.parse("2023-07-17 13:00:00"),
    )
  ];