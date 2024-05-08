import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digischool/Components/material_button.dart';
import 'package:flutter/material.dart';
import '../../../LandingPage/MeetPages/MeetTabs/Components/classroom_card.dart';
import '../../../LandingPage/MeetPages/MeetTabs/class_page.dart';

class ClassView extends StatefulWidget {
  const ClassView({Key? key}) : super(key: key);

  @override
  _ClassViewState createState() => _ClassViewState();
}

class _ClassViewState extends State<ClassView> {
  bool showAllClassrooms = false;

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
                    .orderBy("timeStamp", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> classrooms = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: showAllClassrooms
                          ? classrooms.length
                          : classrooms.length > 2
                              ? 2
                              : classrooms.length,
                      itemBuilder: (context, index) {
                        final post = classrooms[index];
                        return TeacherCard(
                          subjectName: post['Subject'],
                          teacherName: post['Class Name'],
                          profilePicUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQocCwjCrXOwmiMTSXPvp9q6csXdif-pWqQ4Q&usqp=CAU',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ClassroomPage()),
                  );
                },
                text: 'View More',
                bgColor: Colors.white,
                textColor: Colors.black,
                showBorder: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
