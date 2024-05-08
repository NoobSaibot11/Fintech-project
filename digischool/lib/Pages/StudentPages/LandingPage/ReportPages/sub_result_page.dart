import 'package:flutter/material.dart';

class ResultSubject extends StatelessWidget {
  const ResultSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 350),
      child: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Result Not Yet Displayed",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}