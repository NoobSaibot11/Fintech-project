import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/meet_page.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/MorePages/more_page.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/PaymentPages/fees_page.dart';
import 'package:digischool/Pages/StudentPages/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const MeetPage(),
    const FeesPayment(),
    const MorePage(),
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
            icon: Icon(Icons.more_horiz_outlined),
            label: "More",
          ),
        ],
      ),
    );
  }
}
