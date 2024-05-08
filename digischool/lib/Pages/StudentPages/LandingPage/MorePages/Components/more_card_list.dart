import 'package:flutter/material.dart';
import 'more_card.dart';

class MoreCardList extends StatelessWidget {
  const MoreCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        MoreCard(
          title: 'Card 1',
          description: 'Description for Card 1',
          icon: Icons.image,
          buttonText: 'Button Text 1',
          onButtonPressed: () {
            // Add logic for button tap on Card 1
          },
        ),
        const SizedBox(height: 16),
        MoreCard(
          title: 'Card 2',
          description: 'Description for Card 2',
          icon: Icons.image,
          buttonText: 'Button Text 2',
          onButtonPressed: () {
            // Add logic for button tap on Card 2
          },
        ),
        const SizedBox(height: 16),
        MoreCard(
          title: 'Card 3',
          description: 'Description for Card 3',
          icon: Icons.image,
          buttonText: 'Button Text 3',
          onButtonPressed: () {
            // Add logic for button tap on Card 3
          },
        ),
      ],
    );
  }
}
