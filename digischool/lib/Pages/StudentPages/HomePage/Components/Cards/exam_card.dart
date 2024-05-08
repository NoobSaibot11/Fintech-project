import 'package:flutter/material.dart';

class ExamCard extends StatefulWidget {
  final String title;
  final String description;
  final String timePeriod;
  final String newsSource;

  const ExamCard({
    Key? key,
    required this.title,
    required this.description,
    required this.timePeriod,
    required this.newsSource,
  }) : super(key: key);

  @override
  _ExamCardState createState() => _ExamCardState();
}

class _ExamCardState extends State<ExamCard> {
  int likeCount = 0;
  int dislikeCount = 0;
  int favoriteCount = 0;

  void _updateCount(String reaction, bool isIncrement) {
    setState(() {
      if (reaction == 'like') {
        likeCount += isIncrement ? 1 : -1;
      } else if (reaction == 'dislike') {
        dislikeCount += isIncrement ? 1 : -1;
      } else if (reaction == 'favorite') {
        favoriteCount += isIncrement ? 1 : -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.image, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            const Text(
              'Description: This is a detailed description of the exam news. It provides additional information about the topic.',
              style: TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.newsSource} • ${widget.timePeriod}',
              style: const TextStyle(color: Colors.grey),
            ),
            const Spacer(), // Added Spacer to push buttons to the bottom
            Row(
              children: [
                _buildReactionButton(Icons.thumb_up_outlined, likeCount, 'like'),
                _buildReactionButton(Icons.thumb_down_outlined, dislikeCount, 'dislike'),
                _buildReactionButton(Icons.favorite_border_outlined, favoriteCount, 'favorite'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReactionButton(IconData icon, int count, String reaction) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: Colors.grey,
          ),
          onPressed: () {
            _updateCount(reaction, count == 0 || count < 0);
          },
        ),
        const SizedBox(width: 4),
        Text('$count'),
      ],
    );
  }
}
