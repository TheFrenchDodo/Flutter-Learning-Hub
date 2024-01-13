import 'package:flutter/material.dart';
import 'package:flutter_test_application_1/components/my_bottomwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test_application_1/components/my_drawer.dart';
import 'package:flutter_test_application_1/pages/categories/entertainment.dart';
import 'package:flutter_test_application_1/pages/categories/movies.dart';
import 'package:flutter_test_application_1/pages/categories/sciences.dart';


class LearningScreen extends StatefulWidget {
  @override
  LearningScreenState createState() => LearningScreenState();
}

class LearningScreenState extends State<LearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.learning),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sciences(),
                  ),
                );
              },
              icon: const Icon(
                Icons.science, 
                //color: Theme.of(context).colorScheme.tertiary,
                size: 50,
               ),
              tooltip: AppLocalizations.of(context)!.science,
            ),
          ),

          // Navigate to Movies
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Movies(),
                ),
              );
            },
            icon: const Icon(
              Icons.movie,
              //color: Theme.of(context).colorScheme.tertiary,
              size: 50,
            ),
            tooltip: AppLocalizations.of(context)!.movie,
          ),

          // Navigate to Entertainment
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Entertainment(),
                ),
              );
            },
            icon: const Icon(
              Icons.music_video,
              //color: Theme.of(context).colorScheme.tertiary,
              size: 50,),
            tooltip: AppLocalizations.of(context)!.entertainment,
          ),
        ],
      ),
      // bottom widget
      bottomNavigationBar: BottomWidget(),
      drawer: const MyDrawer(),
    );
  }
}


        //   SizedBox(height: 16),
        //   VideoCategoryButton(
        //     icon: Icons.local_movies,
        //     category: AppLocalizations.of(context)!.movie,
        //     videoIds: ['NAIzQFZACcw', 'AtT5WCCyzDU'],
        //   ),
        //   SizedBox(height: 16),

        //   IconButton(
        //     onPressed: Navigator.push(
        //     context, 
        //     MaterialPageRoute(
        //       builder: (context) => Sciences()),
        //     icon: const Icon(Icons.arrow_upward),
        //   ),


        //   VideoCategoryButton(
        //     icon: Icons.music_video,
        //     category: AppLocalizations.of(context)!.entertainment,
        //     videoIds: ['0e3GPea1Tyg', 'K4FgLj5HVTo'],
        //   ),
        // ],
      

      // bottom widget
      //bottomNavigationBar: BottomWidget(),


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

            // Add more details (thumbnail, duration,...)

          );
        },
      ),
    );
  }
}
