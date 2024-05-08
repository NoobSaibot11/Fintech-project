//import 'package:digischool/Components/bottom_navbar.dart';
import 'package:digischool/Components/app_search_bar.dart';
import 'package:digischool/Pages/StudentPages/Attendance/attendence_page.dart';
import 'package:digischool/Pages/StudentPages/HomePage/Components/Modal/card_view.dart';
import 'package:digischool/Pages/StudentPages/HomePage/Components/Modal/class_view.dart';
import 'package:digischool/Pages/StudentPages/HomePage/Components/Modal/exam_card_view.dart';
import 'package:digischool/Pages/StudentPages/HomePage/Components/Cards/menu_card.dart';
import 'package:digischool/Pages/StudentPages/HomePage/Components/Modal/update_card_slider.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/MeetTabs/lecture_page.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/meet_page.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/PaymentPages/fees_page.dart';
import 'package:digischool/Models/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../LandingPage/ClassroomPages/Tabs/CR_Page_01/assignment_page.dart';
import '../LandingPage/ClassroomPages/Tabs/CR_Page_03/progress_page.dart';
import '../LandingPage/about_page.dart';
import '../LandingPage/ClassroomPages/classroom_page.dart';
import '../LandingPage/MeetPages/MeetTabs/discussion_page.dart';
import '../LandingPage/ProfilePages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int selectedFigure = 0;
  void goToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  void goToClassPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ClassPage(),
      ),
    );
  }

  void goToProgressPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProgressPage(),
      ),
    );
  }

  void goToAttendencePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AttendencePage(),
      ),
    );
  }

  void goToAssignPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AssignmentPage(),
      ),
    );
  }

  void goToMeetPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MeetPage(),
      ),
    );
  }

  void goToDiscussPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DiscussionPage(),
      ),
    );
  }

  void goToLecturePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LecturePage(),
      ),
    );
  }

  void goToAboutPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutPage(),
      ),
    );
  }

  void goToPayPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FeesPayment(),
      ),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppSearchBar(),
        drawer:const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0,left: 10,),
                        child: Text(
                          "Updates",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .95,
                        height: MediaQuery.of(context).size.height * .3,
                        child: const CardViewOnHome()),
                  ),
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0,left: 10,),
                        child: Text(
                          "Today's Highlights",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*.95,
                        height: MediaQuery.of(context).size.height*.44,
                        child: const DailyUpdateSlider()),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0,left: 10,),
                        child: Text(
                          "Exams",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*.95,
                        height: MediaQuery.of(context).size.height*.35,
                        child: const ExamCardSlider()),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0,left: 10,),
                        child: Text(
                          "Your Subjects",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*.95,
                        height: MediaQuery.of(context).size.height*.35,
                        child: const ClassView()),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0,left: 10,),
                        child: Text(
                          "Performance",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            ),
                        ),
                      ),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuCard(
                        title: 'Attendence',
                        icon: Icons.person_add_alt,
                        onTap: goToAttendencePage,
                        numericalFigure: 60,
                        onFigureSelected: (figure) {
                          setState(() {
                            selectedFigure = figure;
                          });
                        },
                      ),
                      MenuCard(
                        title: 'Score',
                        icon: Icons.score_outlined,
                        onTap: goToProgressPage,
                        numericalFigure: 72,
                        onFigureSelected: (figure) {
                          setState(() {
                            selectedFigure = figure;
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
