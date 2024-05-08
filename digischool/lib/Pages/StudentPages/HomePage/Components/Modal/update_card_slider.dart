import 'package:flutter/material.dart';

import '../Cards/update_card.dart';
class DailyUpdateSlider extends StatefulWidget {
  const DailyUpdateSlider({super.key});

  @override
  _DailyUpdateSliderState createState() => _DailyUpdateSliderState();
}

class _DailyUpdateSliderState extends State<DailyUpdateSlider> {
  final List<DailyUpdateCard> cards = [
    const DailyUpdateCard(title: 'Card 1', isSubmissionOnTime: true, isScoreImproved: true, percentageChange: 5.0),
    const DailyUpdateCard(title: 'Card 2', isSubmissionOnTime: false, isScoreImproved: true, percentageChange: -3.0),
    const DailyUpdateCard(title: 'Card 3', isSubmissionOnTime: true, isScoreImproved: false, percentageChange: 2.5),
    const DailyUpdateCard(title: 'Card 4', isSubmissionOnTime: false, isScoreImproved: false, percentageChange: -8.0),
  ];

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width*.95,
        height: MediaQuery.of(context).size.height*.44,
        child: PageView.builder(
          controller: _controller,
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: cards[index],
            );
          },
        ),
      ),
    );
  }
}