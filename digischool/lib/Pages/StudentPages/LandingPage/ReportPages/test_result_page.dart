import 'package:flutter/material.dart';

import 'sub_result_page.dart';
class TestResult extends StatefulWidget {
  const TestResult({super.key});

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {
  bool _isbool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListTile(
                leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                title: const Text("Test Results",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                //current user name will be fetched

                //notifications regarding the new posts by the teachers

                trailing: IconButton(
                  icon: const Icon(Icons.account_box),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        _isbool = true;
                      },
                    );
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  child: const Text("Subject Wise"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        _isbool = false;
                        // if (condition) {

                        // } else {

                        // }
                      },
                    );
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  child: const Text("Term Wise"),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _isbool,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              replacement: const Text("hi"),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const ResultSubject();
                  }));
                },
                child: Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color.fromARGB(255, 255, 254, 254),
                    //     blurRadius: 10.0, // soften the shadow
                    //     spreadRadius: 5.0, //extend the shadow
                    //     offset: Offset(
                    //       1.0, // Move to right 5  horizontally
                    //       1.0, // Move to bottom 5 Vertically
                    //     ),
                    //   )
                    // ],
                    // gradient: LinearGradient(
                    //     colors: [Colors.purple[200]!, Colors.amber],
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 227, 194, 194), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "English",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 39, 39, 39)),
                      ),
                      SizedBox(
                        height: 60,
                        child: Image.asset("assets/images/english.jpg"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}