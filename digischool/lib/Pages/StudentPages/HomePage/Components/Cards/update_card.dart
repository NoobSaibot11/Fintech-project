import 'package:flutter/material.dart';
import '../../../Attendance/Components/bar_graph_weekly.dart';

class DailyUpdateCard extends StatelessWidget {
  final String title;
  final bool isSubmissionOnTime;
  final bool isScoreImproved;
  final double percentageChange;

  const DailyUpdateCard({
    Key? key,
    required this.title,
    required this.isSubmissionOnTime,
    required this.isScoreImproved,
    required this.percentageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.teal; // Default color for on-time submission and score improvement

    if (!isSubmissionOnTime || !isScoreImproved) {
      textColor = Colors.redAccent; // Change color for late submission or score deduction
    }

    return Card(
      color: Colors.grey[200],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isSubmissionOnTime
                          ? '${percentageChange.toStringAsFixed(2)}% added to your credits'
                          : '${percentageChange.toStringAsFixed(2)}% deducted from your credits',
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: WeeklyAttendanceBarChart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}