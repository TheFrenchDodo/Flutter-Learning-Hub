import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoWidget extends StatefulWidget {
  final String videoId;

  const YoutubeVideoWidget({super.key, required this.videoId});

  @override
  YoutubeVideoWidgetState createState() => YoutubeVideoWidgetState();
}

class YoutubeVideoWidgetState extends State<YoutubeVideoWidget> {
  late YoutubePlayerController _controller;
  late String videoTitle;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    fetchVideoTitle(widget.videoId);
  }

  Future<void> fetchVideoTitle(String videoId) async {
    //final yt_explode.Extractor extractor = yt_explode.Extractor();
    //final yt_explode.Video video = await extractor.getVideo(videoId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text box with the title of the YouTube video
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "videoTitle",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // YouTube Video Player
        SizedBox(
          height: 200.0,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
