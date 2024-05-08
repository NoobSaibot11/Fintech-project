import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digischool/Components/drawer.dart';
import 'package:digischool/Components/material_button.dart';
import 'package:digischool/Components/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    Navigator.pop(context);
    FirebaseAuth.instance.signOut();
  }

  Future<String> uploadImageToStorage(File imageFile) async {
  try {
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('profile_photos/${currentUser.uid}');
    final UploadTask uploadTask = storageRef.putFile(imageFile);

    // Wait for the upload to complete
    await uploadTask.whenComplete(() => print('Image uploaded'));

    // Get the download URL
    final String downloadURL = await storageRef.getDownloadURL();
    return downloadURL;
  } catch (e) {
    print('Error uploading image: $e');
    return '';
  }
}
Future updateProfilePhoto(String photoURL) async {
  await usersCollection.doc(currentUser.email).update({'photoURL': photoURL});
}
Future editProfilePhoto() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    final String downloadURL = await uploadImageToStorage(File(pickedFile.path));
    if (downloadURL.isNotEmpty) {
      await updateProfilePhoto(downloadURL);
    }
  }
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
              .collection("Users")
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
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: editProfilePhoto,
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
                    text: userData['About'],
                    sectionName: 'About',
                    onPressed: () => editField('About'),
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
