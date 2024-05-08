import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/ClassroomPages/Tabs/CR_Page_01/assignment_card.dart';
import 'package:digischool/Pages/TeachersPages/TeachersTab/Tab2/class_code_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class ClassDetailsPage extends StatelessWidget {
  const ClassDetailsPage({Key? key}) : super(key: key);

  // Function to handle the invite button tap
  void _inviteButtonPressed(BuildContext context) async {
  try {
    // Generate the sharable link with your classroom code
    String classroomCode = ClassroomCodeGenerator.generateCode(); // Replace with your logic to get the classroom code
    String inviteLink = "https://example.com/classroom/$classroomCode";
    // Share the invite link
    await Share.share(inviteLink);
  } on PlatformException catch (e) {
    // Handle PlatformException (share_plus plugin not available)
    if (e.toString().contains('MissingPluginException')) {
      _showErrorDialog(context, 'Share functionality is not available on this platform.');
    } else {
      _showErrorDialog(context, 'Error sharing invite link: ${e.message}');
    }
  } catch (e) {
    // Handle other exceptions
    _showErrorDialog(context, 'Error sharing invite link: $e');
  }
}


  // Function to display an error dialog
  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _inviteButtonPressed(context),
                child: const Text('Invite'),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>( // Use QuerySnapshot for type safety
                stream: FirebaseFirestore.instance
                    .collection("Assignment")
                    .orderBy("timeStamp")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data!.docs[index];
                        return AssignmentCard(
                          assignmentTitle: post['AssignTitle'].toString(),
                          isSubmitted: post['isSubmitted'],
                          isEdited: post['isEdited'],
                          postedTime: post['postedTime'],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
