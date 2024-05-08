import 'package:digischool/Pages/TeachersPages/TeachersTab/Tab1/home.dart';
import 'package:digischool/Pages/TeachersPages/TeachersTab/Tab2/class.dart';
import 'package:digischool/Pages/TeachersPages/TeachersTab/Tab3/salary.dart';
import 'package:digischool/Pages/TeachersPages/TeachersTab/Tab4/settings.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;


class TeachersEntry extends StatefulWidget {
  const TeachersEntry({Key? key}) : super(key: key);

  @override
  State<TeachersEntry> createState() => _TeachersEntryState();
}

class _TeachersEntryState extends State<TeachersEntry> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const TeacherHome(),
    const TeachersClass(),
    const TeachersSalary(),
    const TeachersSetting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar:NavigationBar(
        surfaceTintColor: Colors.white,
        selectedIndex: _selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Colors.white, // Set to transparent as the color is applied to the container
        animationDuration: const Duration(milliseconds: 500),
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          const NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: "Classroom",
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
                Icons.currency_rupee,
              ),
            ),
            label: "Accounts",
          ),
          const NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
