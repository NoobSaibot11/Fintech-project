import 'package:digischool/Components/notify_page.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/ClassroomPages/Tabs/CR_Page_02/class_details_page.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/ClassroomPages/Tabs/CR_Page_03/progress_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'Tabs/exam_page.dart';
class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  int _selectedIndex=0;
  final List<Widget> _pages= [
    const ClassDetailsPage(),
    const ExamPage(),
    const ProgressPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Classroom",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_active_outlined),
              onPressed: () {
                // Add your QR scanner logic here
                // For example, you can navigate to a QR scanner page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
              },
            ),
          ],
        ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        animationDuration: const Duration(milliseconds: 500),
        onDestinationSelected: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.assignment_rounded),
            label: "Task",
          ),
          const NavigationDestination(
            icon: Icon(Icons.architecture),
            label: "Exams",
          ),
          NavigationDestination(
            icon: badges.Badge(
              badgeContent: const Text(
                "3",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.amber,
              ),
              position: badges.BadgePosition.topEnd(top: -14),
              child: const Icon(
                Icons.assessment_rounded,
                ),
              ),
            label: "Assessment",
          ),  
      ],
      ),

    );
  }
}