import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../TeachersPages/TeachersTab/Tab2/join_class.dart';
import 'Components/classroom_card.dart';

class ClassroomPage extends StatelessWidget {
  const ClassroomPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Classroom")
                      .orderBy("timeStamp", descending: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final post = snapshot.data!.docs[index];
                          return TeacherCard(
                            subjectName: post['Subject'],
                            teacherName: post['Class Name'],
                            profilePicUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQocCwjCrXOwmiMTSXPvp9q6csXdif-pWqQ4Q&usqp=CAU',
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error:${snapshot.error}'),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showClassOptions(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  void _showClassOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Join Class'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>const JoinClass()));
                // Add logic for Join Class
              },
            ),
          ],
        );
      },
    );
  }
}
