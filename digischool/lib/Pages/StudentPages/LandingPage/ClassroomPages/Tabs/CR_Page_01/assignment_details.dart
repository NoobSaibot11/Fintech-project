import 'package:flutter/material.dart';
class AssignmentDetailsPage extends StatelessWidget {
  final String assignmentTitle;
  final bool isSubmitted;
  final DateTime postedTime;
  final bool isEdited;
  final String comment;

  const AssignmentDetailsPage({
    Key? key,
    required this.assignmentTitle,
    required this.isSubmitted,
    required this.postedTime,
    required this.isEdited,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Assignment Title: $assignmentTitle'),
            Text('Submitted: $isSubmitted'),
            Text('Posted Time: $postedTime'),
            Text('Edited: $isEdited'),
            Text('Comment: $comment'),
          ],
        ),
      ),
    );
  }
}