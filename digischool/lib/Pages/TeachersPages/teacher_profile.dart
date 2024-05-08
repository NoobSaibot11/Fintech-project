import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digischool/Components/drawer.dart';
import 'package:digischool/Components/material_button.dart';
import 'package:digischool/Components/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'Edit $field',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        content: TextField(
                    autofocus: true,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter new $field",
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onChanged: (value) {
                      newValue = value;
                    },
                  ),
        actions: [
          //Cancel
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

          //Save
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: Text(
              'Save',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
    if (newValue.trim().isNotEmpty) {
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }


  void save() {}

  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.menu,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: MyDrawer(
        onAboutTap: () {},
        onClassTap: () {},
        onMeetTap: () {},
        onPayTap: () {},
        onProfileTap: () {},
        onSignoutTap: signOut,
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Teachers")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //get User Data
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //Profile Pic
                  const Icon(
                    Icons.person,
                    size: 72,
                  ),
                  //Email Id
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'My Details',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),

                  MyTextBox(
                    text: userData['username'],
                    sectionName: 'Username',
                    onPressed: () => editField('username'),
                  ),

                  //Bio
                  MyTextBox(
                    text: userData['Employee ID'],
                    sectionName: 'UID',
                    onPressed: () => editField('UID'),
                  ),

                  MyTextBox(
                    text: userData['Full Name'],
                    sectionName: 'Name',
                    onPressed: () => editField('Full Name'),
                  ),

                  // Date of Birth
                  MyTextBox(
                    text: userData['Date of Birth'],
                    sectionName: 'Date of Birth',
                    onPressed: () => editField('Date of Birth'),
                  ),

                  // Mobile No.
                  MyTextBox(
                    text: userData['Mobile No.'],
                    sectionName: 'Mobile No.',
                    onPressed: () => editField('Mobile No.'),
                  ),

                  //Save Button
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MyButton(
                      onTap: signOut,
                      text: 'Logout',
                      bgColor: Colors.black,
                      textColor: Colors.white,
                      showBorder: true,
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
