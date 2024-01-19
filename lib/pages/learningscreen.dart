import 'package:flutter_learning_hub/components/file_uploader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_hub/components/my_bottomwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_learning_hub/components/my_drawer.dart';
import 'package:flutter_learning_hub/pages/show_files.dart';


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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // Upload file in Sciences category
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.tertiary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(AppLocalizations.of(context)!.upload_science_file),
                          content: FileUploaderWidget(),
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
                  icon: Icon(
                    Icons.file_upload_outlined,
                    semanticLabel: AppLocalizations.of(context)!.upload_science_file,
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

               // Upload file in News category
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(AppLocalizations.of(context)!.upload_news_file),
                          content: FileUploaderWidget(),
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
                  icon: Icon(
                    Icons.file_upload_outlined,
                    semanticLabel: AppLocalizations.of(context)!.upload_news_file,
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
                 SizedBox(height: 25),

                // Upload file in Entertainment category 
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(AppLocalizations.of(context)!.upload_entertainment_file),
                          content: FileUploaderWidget(),
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
                  icon: Icon(
                    Icons.file_upload_outlined,
                    semanticLabel: AppLocalizations.of(context)!.upload_entertainment_file,
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

        // View files
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              IconButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowFiles(),
                  )
                );
                },
                icon: Icon(
                  Icons.folder_special_rounded,
                  semanticLabel: "Go to files",
                  size: 50,
                ),
                tooltip: "Go to files",
              ),
              Text(
                "Go to files ->",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    bottomNavigationBar: BottomWidget(),
    drawer: const MyDrawer(),
    );
  }
}
