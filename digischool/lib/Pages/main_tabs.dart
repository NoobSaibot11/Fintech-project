import 'package:digischool/Pages/ParentPages/gen_login.dart';
import 'package:digischool/Pages/StudentPages/login_page.dart';
import 'package:digischool/Pages/TeachersPages/TeachersAuth/login_page_teacher.dart';
import 'package:digischool/Pages/TeachersPages/TeachersAuth/teachers_home.dart';
import 'package:flutter/material.dart';

class AppTab extends StatefulWidget {
  const AppTab({Key? key}) : super(key: key);

  @override
  State<AppTab> createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Greetings
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "lib/digiAppIcons/eduIcon.png",
                      height: 100,
                      width: 100,
                    ),
                    const Text(
                      'Hello Learner!',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Welcome to Your Education Journey',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width * .9,
                    child: DefaultTabController(
                      length: 3,
                      child: Scaffold(
                        backgroundColor: Theme.of(context).colorScheme.background,
                        body: Column(
                          children: [
                            TabBar(tabs: [
                              //Tab 1
                              Tab(
                                icon: Icon(
                                  Icons.person,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              //Tab 2
                              Tab(
                                icon: Icon(
                                  Icons.person_pin,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.people_alt,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ]),
                            Expanded(
                              child: TabBarView(children: [
                                //TAB 1
                                const LoginPage(),
                                //TAB 2
                                Builder(
                                  builder: (BuildContext context) {
                                    return TeacherLogin(
                                      onLogin:(){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TeachersEntry(),
                                          )
                                          );
                                      },
                                      );
                                  }
                                ),
                                //TAB 3
                                const GeneralLogin(),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
