import 'package:digischool/Components/material_button.dart';
import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const MoreCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.buttonText,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.topRight,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, -10),
                    child: Transform.rotate(
                      angle: 0.3,
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            MyButton(
              onTap: onButtonPressed,
              text: buttonText,
              bgColor: const Color(0xff674aef),
              textColor: Colors.white,
              showBorder: false,

            ),
          ],
        ),
      ),
    );
  }
}
