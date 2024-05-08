import 'package:flutter/material.dart';
import '../Cards/exam_card.dart';
class ExamCardSlider extends StatefulWidget {
  const ExamCardSlider({super.key});

  @override
  _ExamCardSliderState createState() => _ExamCardSliderState();
}
class _ExamCardSliderState extends State<ExamCardSlider> {
  final List<ExamCard> cards = [
    const ExamCard(title: 'Card 1', description: 'This is the description of Card 1.', timePeriod: '2d', newsSource: 'News Source 1'),
    const ExamCard(title: 'Card 2', description: 'This is the description of Card 2.', timePeriod: '1w', newsSource: 'News Source 2'),
    const ExamCard(title: 'Card 3', description: 'This is the description of Card 3.', timePeriod: '3d', newsSource: 'News Source 3'),
    const ExamCard(title: 'Card 4', description: 'This is the description of Card 4.', timePeriod: '1m', newsSource: 'News Source 4'),
  ];

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.35,
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