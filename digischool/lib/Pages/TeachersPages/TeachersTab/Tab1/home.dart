import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digischool/Components/app_search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../StudentPages/LandingPage/MeetPages/MeetTabs/Components/classroom_card.dart';
import '../Tab2/join_class.dart';
import '../Tab2/new_class.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final List<String> photos = ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQocCwjCrXOwmiMTSXPvp9q6csXdif-pWqQ4Q&usqp=CAU'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
            const AppSearchBar(),
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
      ),
    );
  }

  void _showClassOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height*.15,
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.create),
                title: const Text('Create Class'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>const NewClass())
                    );
                  // Add logic for Create Class
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Join Class'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const JoinClass()));
                  // Add logic for Join Class
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
