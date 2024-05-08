import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color bgColor,textColor;
  final bool showBorder;
  const MyButton({
    super.key, 
    required this.onTap, 
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.showBorder,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width*.45,
        height: MediaQuery.of(context).size.height*.05,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
          border: showBorder ? Border.all(color: Colors.grey, width: 1) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
