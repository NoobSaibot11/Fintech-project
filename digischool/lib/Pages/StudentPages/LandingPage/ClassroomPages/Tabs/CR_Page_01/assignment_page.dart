import 'package:digischool/Components/material_button.dart';
import 'package:flutter/material.dart';

import 'custom_assign_card.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({Key? key}) : super(key: key);

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final bool _isGradesSwitched = false;
  final bool _isDueDateSwitched = false;
  String _selectedGrade = 'A'; // Default grade
  DateTime _selectedDueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // New Assign button
          MyButton(
            text: 'Assign',
            bgColor: Colors.blue,
            textColor: Colors.white,
            showBorder: false,
            onTap: () {
              // Add logic for assignment submission
            },
          ),
          // Existing more_vert icon
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Add logic for more options
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInputField(
                controller: _titleController,
                hintText: 'Assignment Title',
                icon: Icons.assignment,
              ),
              CustomInputField(
                controller: _descriptionController,
                hintText: 'Description',
                icon: Icons.description,
              ),
              CustomInputField(
                controller: null, // or pass null explicitly
                hintText: 'Attachment',
                icon: Icons.attachment_outlined,
                onActionPressed: () {
                  // Add logic for handling attachment
                },
                enabled: false, // Disable user input
              ),
              CustomInputField(
                controller: null,
                hintText: 'Grades',
                icon: Icons.grade,
                enabled: false,
                onActionPressed: _showGradesDialog,
              ),
              CustomInputField(
                controller: null,
                hintText: 'Due Date',
                icon: Icons.calendar_today,
                onActionPressed: _showDueDateDialog,
                enabled: false,
              )
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to show a dialog for selecting grades
  Future<void> _showGradesDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Grade'),
          content: DropdownButton<String>(
            value: _selectedGrade,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedGrade = newValue;
                });
              }
            },
            items: <String>['A', 'B', 'C', 'D', 'F']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Helper method to show a dialog for selecting due date
  Future<void> _showDueDateDialog() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDueDate) {
      setState(() {
        _selectedDueDate = pickedDate;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
