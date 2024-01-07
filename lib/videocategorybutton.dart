import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/pages/learningscreen.dart';

class VideoCategoryButton extends StatelessWidget {
  final IconData icon;
  final String category;
  final List<String> videoIds;

  const VideoCategoryButton({
    super.key,
    required this.icon,
    required this.category,
    required this.videoIds,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoListScreen(category: category, videoIds: videoIds),
          ),
        );
      },
      icon: Icon(icon),
      label: Text(category),
    );
  }
}
