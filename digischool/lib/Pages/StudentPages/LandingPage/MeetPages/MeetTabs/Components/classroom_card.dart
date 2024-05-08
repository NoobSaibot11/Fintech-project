import 'package:digischool/Pages/StudentPages/LandingPage/ClassroomPages/classroom_page.dart';
import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final String subjectName;
  final String teacherName;
  final String profilePicUrl; // Assuming you have a URL for the profile picture

  const TeacherCard({
    Key? key, 
    required this.subjectName,
    required this.teacherName,
    required this.profilePicUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> const ClassPage()));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right:10),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey[400]!), // Light border color
          ),
          margin: const EdgeInsets.all(4.0), // Reduced margin to create a smaller gap between cards
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profilePicUrl),
            ),
            title: Text(
              subjectName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(teacherName),
            trailing: PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: 'option1',
                    child: Text('Focus'),
                  ),
                  const PopupMenuItem(
                    value: 'option2',
                    child: Text('Mute'),
                  ),
                  const PopupMenuItem(
                    value: 'option3',
                    child: Text('Report'),
                  ),
                ];
              },
            ),
          ),
        ),
      ),
    );
  }
}
