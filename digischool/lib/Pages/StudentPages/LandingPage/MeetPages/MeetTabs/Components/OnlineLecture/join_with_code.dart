import 'package:digischool/Components/material_button.dart';
import 'package:flutter/material.dart';

class JoinWithCodePage extends StatefulWidget {
  const JoinWithCodePage({Key? key}) : super(key: key);

  @override
  _JoinWithCodePageState createState() => _JoinWithCodePageState();
}

class _JoinWithCodePageState extends State<JoinWithCodePage> {
  TextEditingController _codeController = TextEditingController();
  bool _isJoinButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join with a Code'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          MyButton(
            onTap: _isJoinButtonEnabled
                ? () {
                    // Add your logic to join the meeting with the provided code
                  }
                : null,
            text: 'Join',
            bgColor: Colors.transparent,
            textColor: _isJoinButtonEnabled ? Colors.blue : Colors.grey,
            showBorder: false,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Enter the code provided by the meeting organiser',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _codeController,
              onChanged: (value) {
                setState(() {
                  _isJoinButtonEnabled = value.length > 5;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Example: abc-lmn-xyz',
                border: UnderlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
}
