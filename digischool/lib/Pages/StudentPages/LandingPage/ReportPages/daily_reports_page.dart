import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class DailyReport extends StatelessWidget {
  const DailyReport({super.key});

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
                title: const Text("Daily Report",
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
            // ---------date------------
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime(2023, 10, 8),
                onDateTimeChanged: (DateTime newDateTime) {
                  // Do something
                },
              ),
            ),
// --------------------------------

            const SizedBox(
              height: 50,
            ),
            const Column(
              children: [
                ExpansionTile(
                  title: Text(
                    "English",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text(
                            "Topic",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(
                            "Periodic Table",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                              "Brief Infomation regarding what has been taught"),
                        ),

                        // ------------------
                      ],
                    )
                  ],
                ),

                // --------------------
                SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  title: Text(
                    "Maths",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text(
                            "Topic",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(
                            "Periodic Table",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                              "Brief Infomation regarding what has been taught"),
                        ),

                        // ------------------
                      ],
                    )
                  ],
                ),

                // -------------

                SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  title: Text(
                    "Science",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text(
                            "Topic",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(
                            "Periodic Table",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                              "Brief Infomation regarding what has been taught"),
                        ),

                        // ------------------
                      ],
                    )
                  ],
                ),

                // -----------

                SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  title: Text(
                    "Marathi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text(
                            "Topic",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(
                            "Periodic Table",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                              "Brief Infomation regarding what has been taught"),
                        ),

                        // ------------------
                      ],
                    )
                  ],
                ),

                // ----------

                SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  title: Text(
                    "Computer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: Text(
                            "Topic",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(
                            "Periodic Table",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                              "Brief Infomation regarding what has been taught"),
                        ),

                        // ------------------
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}