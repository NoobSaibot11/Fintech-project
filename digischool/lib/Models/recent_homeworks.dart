import 'package:digischool/Models/assign.dart';
import 'package:digischool/Models/constraints.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentHomeworks extends StatefulWidget {
  const RecentHomeworks({super.key});

  @override
  State<RecentHomeworks> createState() => _RecentHomeworksState();
}

class _RecentHomeworksState extends State<RecentHomeworks> {
  DateFormat dateFormat = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: recentAssign.length,
      itemBuilder: (BuildContext context, int index) {
        Assign assign = recentAssign[index];
        return Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        assign.title,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          Text(
                            "${DateTime.now().weekday == assign.dueTime.weekday ? "Today" : DateFormat.EEEE().format(assign.dueTime)}, ${dateFormat.format(assign.dueTime)}",
                            style: const TextStyle(
                              color: kTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  _todoButton(assign),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _todoButton(Assign assign) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          assign.isDone = !assign.isDone;
        });
      },
      shape: CircleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      color: assign.isDone?Theme.of(context).colorScheme.tertiary:Colors.transparent,
      child: assign.isDone?const Icon(Icons.check,color: Colors.white,):null,
    );
  }
}
