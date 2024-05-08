import 'package:digischool/Components/material_button.dart';
import 'package:digischool/Components/query_dropdown_menu.dart';
import 'package:flutter/material.dart';

import 'query_submission.dart';

class QueryResolutionPage extends StatefulWidget {
  const QueryResolutionPage({Key? key}) : super(key: key);

  @override
  State<QueryResolutionPage> createState() => _QueryResolutionPageState();
}

class _QueryResolutionPageState extends State<QueryResolutionPage> {
  String? selectedQueryType;
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void goToQuerySub() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QSubPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Query",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Option Panel
                const MyDropdownMenu(),
                // Text Box for Issue Description
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: descriptionController,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Describe your issue...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Image related to the problem
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Column(
                    children: [
                      Text('Attach Image (Optional)'),
                      SizedBox(height: 8.0),
                      // Add your image upload widget here
                      // Example: Image.network('your_image_url'),
                    ],
                  ),
                ),
                // Submit Button
                MyButton(
                  onTap: goToQuerySub,
                  text: "Submit",
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  showBorder: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }
}
