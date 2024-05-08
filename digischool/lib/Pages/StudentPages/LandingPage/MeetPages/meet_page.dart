import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/MeetTabs/class_page.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/MeetTabs/discussion_page.dart';
import 'package:digischool/Pages/StudentPages/LandingPage/MeetPages/MeetTabs/lecture_page.dart';
import 'package:flutter/material.dart';

import '../../../../Components/app_search_bar.dart';

class MeetPage extends StatelessWidget {
  const MeetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar:const AppSearchBar(),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Column(
            children: [
              TabBar(tabs: [
                //Tab 1
                Tab(
                  icon: Icon(
                    Icons.live_tv,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                //Tab 2
                Tab(
                  icon: Icon(
                    Icons.group,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ]),
              const Expanded(
                child: TabBarView(children: [
                  //TAB 1
                  LecturePage(),
                  //TAB 2
                  DiscussionPage(),
                  //TAB 3
                  ClassroomPage(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
