import 'package:digischool/Components/material_button.dart';
import 'package:digischool/Pages/main_tabs.dart';
import 'package:flutter/material.dart';

class QSubPage extends StatelessWidget {
  const QSubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // An Image/Icon signifying query submission successful.
          // Slide the Icon upwards and stop at top center
          TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: -1.5),
            duration: const Duration(milliseconds: 1000),
            builder: (context, double value, child) {
              return Transform.translate(
                offset: Offset(0, value * 100),
                child: const Icon(
                  Icons.check_circle,
                  size: 100.0,
                  color: Colors.green,
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Your query has been received and will be resolved as soon as possible.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 40.0),
          // Align material button at the bottom of the screen with "Done" text.
          Align(
            alignment: Alignment.bottomCenter,
            child: MyButton(
              text: "Done",
              bgColor: Colors.white,
              textColor: Colors.black,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppTab(),
                  ),
                );
              },
              showBorder: true,
            ),
          ),
        ],
      ),
    );
  }
}
