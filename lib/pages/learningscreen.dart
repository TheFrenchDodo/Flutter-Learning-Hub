import 'package:dorian/components/file_uploader_widget.dart';
import 'package:flutter/material.dart';
import 'package:dorian/components/my_bottomwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dorian/components/my_drawer.dart';


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
            child: Column(
              children: [
                // Upload to Sciences
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black,  // Set the color of the border
      width: 2.0,           // Set the width of the border
    ),
    borderRadius: BorderRadius.circular(10.0),  // Set the border radius
  ),
  child: Column(
    children: [
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context)!.upload_science_file),
                content: FileUploaderWidget(),  // TODO: add API parameters here
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context)!.close),
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(
          Icons.file_upload_outlined,
          size: 50,
        ),
        tooltip: AppLocalizations.of(context)!.upload_file,
      ),
      Text(
        AppLocalizations.of(context)!.science,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      SizedBox(height: 25),
    ],
  ),
)

              ],
            ),
          ),

          SizedBox(height: 25),

          // Upload to News
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,  // Set the color of the border
                width: 2.0,           // Set the width of the border
              ),
              borderRadius: BorderRadius.circular(10.0),  // Set the border radius
            ),
            child: Column(
              children: [
                IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(AppLocalizations.of(context)!.upload_news_file),
                        content: FileUploaderWidget(),  // TODO: add API parameters here
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(AppLocalizations.of(context)!.close),
                          ),
                        ],
                      );
                    },
                  );
                },
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    size: 50,
                  ),
                  tooltip: AppLocalizations.of(context)!.upload_file,
                ),
                Text(
                  AppLocalizations.of(context)!.news,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          // Upload to Entertainment
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,  // Set the color of the border
                width: 2.0,           // Set the width of the border
              ),
              borderRadius: BorderRadius.circular(10.0),  // Set the border radius
            ),
            child: Column(
              children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(AppLocalizations.of(context)!.upload_entertainment_file),
                        content: FileUploaderWidget(),  // TODO: add API parameters here
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(AppLocalizations.of(context)!.close),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.file_upload_outlined,
                  size: 50,
                ),
                tooltip: AppLocalizations.of(context)!.upload_file,
              ),
              Text(
                AppLocalizations.of(context)!.entertainment,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        ]
      ),
      bottomNavigationBar: BottomWidget(),
      drawer: const MyDrawer(),
    );
  }
}
