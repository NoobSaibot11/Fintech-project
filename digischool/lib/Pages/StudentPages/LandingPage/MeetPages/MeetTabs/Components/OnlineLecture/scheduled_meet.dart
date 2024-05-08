import 'package:flutter/material.dart';

class MeetingSchedulerPage extends StatefulWidget {
  const MeetingSchedulerPage({Key? key}) : super(key: key);

  @override
  _MeetingSchedulerPageState createState() => _MeetingSchedulerPageState();
}

class _MeetingSchedulerPageState extends State<MeetingSchedulerPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule a Meet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedDate != null
                  ? "Selected Date: ${selectedDate!.toLocal()}".split(' ')[0]
                  : "Select a date",
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text("Select Date"),
            ),
            const SizedBox(height: 16.0),
            Text(
              selectedTime != null
                  ? "Selected Time: ${selectedTime!.format(context)}"
                  : "Select a time",
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text("Select Time"),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle scheduling logic here
                if (selectedDate != null && selectedTime != null) {
                  final scheduledDateTime = DateTime(
                    selectedDate!.year,
                    selectedDate!.month,
                    selectedDate!.day,
                    selectedTime!.hour,
                    selectedTime!.minute,
                  );

                  // Use `scheduledDateTime` for scheduling the meeting
                  print("Scheduled meeting for: $scheduledDateTime");
                }

                Navigator.pop(context);
              },
              child: const Text("Schedule Meet"),
            ),
          ],
        ),
      ),
    );
  }
}
