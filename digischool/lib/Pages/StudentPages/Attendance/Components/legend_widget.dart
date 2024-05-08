import 'package:flutter/material.dart';

class Legend {
  final String title;
  final Color color;

  Legend(this.title, this.color);
}

class LegendsListWidget extends StatelessWidget {
  final List<Legend> legends;

  const LegendsListWidget({Key? key, required this.legends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var legend in legends)
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make the container circular
                    color: legend.color,
                  ),
                ),
                const SizedBox(width: 5),
                Text(legend.title),
              ],
            ),
          ),
      ],
    );
  }
}
