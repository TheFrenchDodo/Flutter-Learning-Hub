import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/pages/homescreen.dart';

class LearningScreen extends StatefulWidget {
  @override
  LearningScreenState createState() => LearningScreenState();
}

class LearningScreenState extends State<LearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Learning Screen"),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VideoCategoryButton(
            icon: Icons.science,
            category: 'Science',
            videoIds: ['IesIsKMjB4Y', 'uzjA5d0QXv8'],
          ),
          SizedBox(height: 16),
          VideoCategoryButton(
            icon: Icons.local_movies,
            category: 'Movies',
            videoIds: ['NAIzQFZACcw', 'AtT5WCCyzDU'],
          ),
          SizedBox(height: 16),
          VideoCategoryButton(
            icon: Icons.music_video,
            category: 'Entertainment',
            videoIds: ['0e3GPea1Tyg', 'K4FgLj5HVTo'],
          ),
        ],
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }
}

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

class VideoListScreen extends StatelessWidget {
  final String category;
  final List<String> videoIds;

  const VideoListScreen({
    super.key,
    required this.category,
    required this.videoIds,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: videoIds.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Video Title ${index + 1}'),
            // Add more details like thumbnail, duration, etc., if needed
          );
        },
      ),
    );
  }
}
