import 'package:digischool/Components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onClassTap;
  /* final void Function()? onLectureTap;
  final void Function()? onDiscussTap; */
  final void Function()? onMeetTap;
  final void Function()? onPayTap;
  final void Function()? onAboutTap;
  final void Function()? onSignoutTap;
  const MyDrawer(
      {super.key,
      required this.onProfileTap,
      required this.onClassTap,
      /* required this.onLectureTap,
      required this.onDiscussTap, */
      required this.onMeetTap,
      required this.onPayTap,
      required this.onAboutTap,
      required this.onSignoutTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/digiAppIcons/onlearn.png',
                color: Theme.of(context).colorScheme.primary,
                height: 96,
                width: 96,
              ),
            ),
            //Profile
            MyListTile(
              icon: Icons.system_security_update_good_outlined,
              text: 'Extra-Curricular',
              onTap: onProfileTap,
            ),

            //Classroom
            MyListTile(
              icon: Icons.class_,
              text: 'PYQs',
              onTap: onClassTap,
            ),

            //Meetings
            MyListTile(
              icon: Icons.live_tv,
              text: 'Doubt Sessions',
              onTap: onMeetTap,
            ),

            //Discussion Room
            /* MyListTile(
              icon: Icons.group,
              text: 'Discussion Room',
              onTap: onDiscussTap,
            ), */
            //Pay
            MyListTile(
              icon: Icons.monetization_on, 
              text: 'Paid Courses', 
              onTap: onPayTap
            ),

            //About
            MyListTile(
              icon: Icons.info,
              text: 'About',
              onTap: onAboutTap,
            ),
          ],
        ),

        //Logout
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: MyListTile(
            icon: Icons.logout,
            text: 'Logout',
            onTap: onSignoutTap,
          ),
        ),
      ]),
    );
  }
}
