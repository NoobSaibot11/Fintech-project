import 'package:flutter/material.dart';

import 'assignment_details.dart';

class AssignmentCard extends StatefulWidget {
  final String assignmentTitle;
  final bool isSubmitted;
  final DateTime postedTime;
  final bool isEdited;

  const AssignmentCard({
    Key? key,
    required this.assignmentTitle,
    required this.isSubmitted,
    required this.postedTime,
    required this.isEdited,
  }) : super(key: key);

  @override
  _AssignmentCardState createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color statusColor = widget.isSubmitted ? Colors.grey : Colors.blue;
    String timeText =
        '${_formatTime(widget.postedTime)}${widget.isEdited ? ' (Edited)' : ''}';

    return GestureDetector(
      onTap: () {
        // Navigate to Assignment Details Page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssignmentDetailsPage(
              assignmentTitle: widget.assignmentTitle,
              postedTime: widget.postedTime,
              isEdited: widget.isEdited,
              isSubmitted: widget.isSubmitted,
              comment: _commentController.text,
            ),
          ),
        );
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.grey[300]!),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: statusColor,
            ),
            child: const Icon(
              Icons.assignment_outlined,
              color: Colors.white,
            ),
          ),
          title: Text(
            widget.assignmentTitle,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(timeText),
              const SizedBox(height: 8,),
              TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  labelText: 'Add your comment here',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    // Format time as HH:mm with leading zeros
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    return '${twoDigits(dateTime.hour)}:${twoDigits(dateTime.minute)}';
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}