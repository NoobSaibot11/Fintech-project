import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  final String subjectName;
  final String className;
  const ClassCard({
    super.key,
    required this.subjectName,
    required this.className,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8.0)
      ),
      margin: const EdgeInsets.only(top: 25,left: 25,right: 25),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(className,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              const SizedBox(height: 10,),
              Text(subjectName,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),),
            ],
          ),
          
        ],
      ),
    );
  }
}