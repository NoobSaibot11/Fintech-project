import 'package:flutter/material.dart';
class JoinClass extends StatefulWidget {
  const JoinClass({Key? key}) : super(key: key);

  @override
  State<JoinClass> createState() => _JoinClassState();
}

class _JoinClassState extends State<JoinClass> {
  late TextEditingController _joinCodeController;
  @override
  void initState() {
    super.initState();
    _joinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _joinCodeController.dispose();
    super.dispose();
  }

  void joinClass() {
    // Add your logic to handle joining the class with the entered code
    String joinCode = _joinCodeController.text.trim();

    // Validate the join code
    if (joinCode.isNotEmpty && RegExp(r'^[a-zA-Z0-9]{1,5}$').hasMatch(joinCode)) {
      // Valid join code, implement the logic to join the class
      // You can use the 'joinCode' variable here
    } else {
      // Invalid join code, show an error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invalid Join Code'),
            content: const Text(
              'Please enter a valid join code with up to 5 alphanumeric characters.',
            ),
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

  void contactTeacher() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Class'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _joinCodeController,
              decoration: const InputDecoration(
                labelText: 'Classroom Join Code',
                hintText: 'Enter the join code',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: joinClass,
              child: const Text('Join Class'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: contactTeacher,
              child: const Text('Contact Class Teacher'),
            ),
          ],
        ),
      ),
    );
  }
}
