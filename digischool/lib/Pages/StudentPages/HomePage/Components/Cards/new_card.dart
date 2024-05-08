import 'package:flutter/material.dart';

class NewFeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String category;
  final IconData icon;
  final String impactFactor;
  final String applicability;
  final String goodFor;
  final String whatsNew;

  const NewFeatureCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.icon,
    required this.impactFactor,
    required this.applicability,
    required this.goodFor,
    required this.whatsNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Card(
        elevation: 0, // Add elevation for a shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.grey[200], // Light grey color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: Icon(icon, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '$subtitle • $category',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildParametersRow('Impact Factor', impactFactor, 'Applicability', applicability),
              const SizedBox(height: 10),
              _buildParametersRow('Good For', goodFor, "What's New", whatsNew),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParametersRow(String param1, String figure1, String param2, String figure2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                param1,
                style: TextStyle(
                  color:Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                figure1,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16), // Add some space between the columns
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                param2,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                figure2,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
