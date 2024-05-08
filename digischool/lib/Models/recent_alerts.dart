import 'package:digischool/Components/count_down.dart';
import 'package:digischool/Models/constraints.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'alerts.dart';

class RecentAlerts extends StatefulWidget {
  const RecentAlerts({super.key});

  @override
  State<RecentAlerts> createState() => _RecentAlertsState();
}

class _RecentAlertsState extends State<RecentAlerts> {
  DateFormat dateFormat = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: recentAlerts.length,
      itemBuilder: (BuildContext context, int index) {
        Alert alert = recentAlerts[index];
        int hoursleft = DateTime.now().difference(alert.time).inHours;
        hoursleft = hoursleft < 0 ? -hoursleft : 0;
        double percent = hoursleft / 48;
        return Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 130,
              width: 15,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              height: 130,
              width: MediaQuery.of(context).size.width - 40,
              decoration: const BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )),
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        alert.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.timer,
                            color: Theme.of(context).colorScheme.tertiary,
                            size: 17,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${DateTime.now().weekday == alert.time.weekday ? "Today" : DateFormat.EEEE().format(alert.time)}, ${dateFormat.format(alert.time)}",
                            style: const TextStyle(
                              color: kTextColor,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.receipt,
                            color: Theme.of(context).colorScheme.tertiary,
                            size: 17,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            alert.subject,
                            style: const TextStyle(
                              color: kTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: CustomPaint(
                      foregroundPainter: CountdownPainter(
                        bgColor: kBGColor,
                        lineColor: _getColor(context, percent),
                        percent: percent,
                        width: 4.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "$hoursleft",
                              style: TextStyle(
                                color: _getColor(context, percent),
                                fontSize: 26.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Hours left",
                              style: TextStyle(
                                  color: _getColor(context, percent),
                                  fontSize: 13.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _getColor(BuildContext context, double percent) {
    if (percent >= 0.35) {
      return Theme.of(context).colorScheme.tertiary;
    }
    return kHourColor;
  }
}
