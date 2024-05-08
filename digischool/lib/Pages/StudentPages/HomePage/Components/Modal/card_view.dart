import 'package:digischool/Pages/StudentPages/HomePage/Components/Cards/new_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardViewOnHome extends StatefulWidget {
  const CardViewOnHome({Key? key}) : super(key: key);

  @override
  State<CardViewOnHome> createState() => _CardViewOnHomeState();
}

class _CardViewOnHomeState extends State<CardViewOnHome> {
  final PageController _controller = PageController();
  //Keep track of Pages
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              NewFeatureCard(
                title: 'title', 
                subtitle: 'subtitle', 
                icon: Icons.video_call,
                category: 'category',
                applicability: 'app',
                impactFactor: 'ip',
                goodFor: 'gf',
                whatsNew: 'wn',

                ),
              NewFeatureCard(
                title: 'title', 
                subtitle: 'subtitle', 
                icon: Icons.video_call,
                category: 'category',
                applicability: 'app',
                impactFactor: 'ip',
                goodFor: 'gf',
                whatsNew: 'wn',

                ),
              NewFeatureCard(
                title: 'title', 
                subtitle: 'subtitle', 
                icon: Icons.video_call,
                category: 'category',
                applicability: 'app',
                impactFactor: 'ip',
                goodFor: 'gf',
                whatsNew: 'wn',

                ),
            ],
          ),
          //Dot Indicator
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Dots Indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.amber,
                    dotColor: Colors.orange.shade500,
                    dotHeight: 7,
                    dotWidth: 7,
                    spacing: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
