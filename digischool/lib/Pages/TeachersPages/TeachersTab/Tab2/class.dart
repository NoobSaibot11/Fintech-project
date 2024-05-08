import 'package:digischool/Components/app_search_bar.dart';
import 'package:flutter/material.dart';
import '../../../StudentPages/LandingPage/ClassroomPages/Tabs/CR_Page_01/assignment_page.dart';
import 'quiz_page.dart';
class TeachersClass extends StatefulWidget {
  const TeachersClass({super.key});

  @override
  State<TeachersClass> createState() => _TeachersClassState();
}

class _TeachersClassState extends State<TeachersClass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Column(
          children: [
            AppSearchBar()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showClassOptions(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  void _showClassOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(bottom:10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.assignment),
                title: const Text('Assignment'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AssignmentPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.quiz),
                title: const Text('Quiz'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuizPage()));
                  // Add logic for creating a Quiz
                },
              ),
              ListTile(
                leading: const Icon(Icons.question_answer),
                title: const Text('Question'),
                onTap: () {
                  Navigator.pop(context);
                  // Add logic for creating a Question
                },
              ),
              ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text('Material'),
                onTap: () {
                  Navigator.pop(context);
                  // Add logic for creating a Material
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.repeat),
                title: const Text('Reuse post'),
                onTap: () {
                  Navigator.pop(context);
                  // Add logic for reusing a post
                },
              ),
              ListTile(
                leading: const Icon(Icons.topic),
                title: const Text('Topic'),
                onTap: () {
                  Navigator.pop(context);
                  // Add logic for creating a Topic
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

}
