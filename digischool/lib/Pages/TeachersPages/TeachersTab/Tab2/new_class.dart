import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digischool/Components/material_button.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/ClassroomPages/classroom_page.dart';
import 'package:flutter/material.dart';

class NewClass extends StatefulWidget {
  const NewClass({super.key});

  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  // Controllers for text fields
  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  void showerrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        });
  }

  Future _createClass() async {
    if (_classNameController.text.trim().isEmpty) {
      // Show an error message if class name is empty
      showerrorMessage('Class Name cannot be empty');
      return;
    }
    try {
      // Add user details
      await addDetails(
        _classNameController.text.trim(),
        _sectionController.text.trim(),
        _roomController.text.trim(),
        _subjectController.text.trim(),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const ClassPage();
      }));
    } catch (e) {
      // Handle exceptions and display a suitable message
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to create class: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future addDetails(
    String className,
    String sectionNo,
    String roomNo,
    String subject,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('Classroom').add({
        'Class Name': className,
        'Section': sectionNo,
        'Room': roomNo,
        'Subject': subject,
        'timeStamp': DateTime.now(),
      });
    } catch (e) {
      // Throw the exception again to propagate it to the caller
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Class'),
        actions: [
          MyButton(
              onTap: _createClass,
              text: 'Create',
              bgColor: Colors.white,
              textColor: Colors.black,
              showBorder: true),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Add logic for more options
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Add logic to close and navigate back
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Class Name
            TextField(
              controller: _classNameController,
              decoration: const InputDecoration(
                labelText: 'Class Name (required)',
                filled: true,
                fillColor: Colors.grey,
              ),
            ),

// Section
            TextField(
              controller: _sectionController,
              decoration: const InputDecoration(
                labelText: 'Section',
                filled: true,
                fillColor: Colors.grey,
              ),
            ),

// Room
            TextField(
              controller: _roomController,
              decoration: const InputDecoration(
                labelText: 'Room',
                filled: true,
                fillColor: Colors.grey,
              ),
            ),

// Subject
            TextField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
                filled: true,
                fillColor: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _classNameController.dispose();
    _sectionController.dispose();
    _roomController.dispose();
    _subjectController.dispose();
    super.dispose();
  }
}
