import 'package:flutter/material.dart';
class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData icon;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;
  final bool enabled;

  const CustomInputField({super.key, 
    required this.controller,
    required this.hintText,
    required this.icon,
    this.actionIcon,
    this.onActionPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (actionIcon != null) // Only show label if actionIcon is provided
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(hintText),
              const Spacer(),
              if (actionIcon != null && onActionPressed != null)
                IconButton(
                  icon: Icon(actionIcon),
                  onPressed: onActionPressed,
                ),
            ],
          ),
        if (actionIcon != null) const SizedBox(height: 8),
        TextField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(icon),
            border: InputBorder.none,
          ),
        ),
        const Divider(), // Add a divider between sections
      ],
    );
  }
}
