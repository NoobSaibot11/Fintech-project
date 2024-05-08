import 'package:digischool/Pages/StudentPages/LandingPage/MorePages/Components/more_card_list.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});
  @override
  State<MorePage> createState() => _MorePageState();
}
class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
          "NEP '20",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
            ),
          ),
          ),
      ),
      body: const MoreCardList(),
    );
  }
}