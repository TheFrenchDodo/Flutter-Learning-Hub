import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dorian/components/my_bottomwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dorian/components/my_drawer.dart';
import 'package:dorian/pages/categories/entertainment.dart';
import 'package:dorian/pages/categories/news.dart';
import 'package:dorian/pages/categories/sciences.dart';


class LearningScreen extends StatefulWidget {
  @override
  LearningScreenState createState() => LearningScreenState();
}

class LearningScreenState extends State<LearningScreen> {

  File? selectedFile;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile = File.fromRawPath(result.files.single.bytes!);
      });

      // Upload the selected file to Firestore
      // await uploadFileToFirestore(selectedFile!);
    }
  }

  // Future<void> uploadFileToFirestore(File file) async {
  //   try {
  //     // Convert file to bytes
  //     List<int> fileBytes = await file.readAsBytes();

  //     // Get a reference to the Firestore storage bucket
  //     Reference storageReference = FirebaseStorage.instance.ref().child('uploads/${file.path.split('/').last}');

  //     // Upload file to Firestore
  //     await storageReference.putData(Uint8List.fromList(fileBytes));

  //     // Get the download URL
  //     String downloadURL = await storageReference.getDownloadURL();

  //     // Store the download URL in Firestore or perform any other necessary actions
  //     await FirebaseFirestore.instance.collection('uploaded_files').add({
  //       'file_name': file.path.split('/').last,
  //       'download_url': downloadURL,
  //     });
  //   } catch (e) {
  //     print('Error uploading file to Firestore: $e');
  //   }
  // }

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
                IconButton(
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
                    size: 50,
                  ),
                  tooltip: AppLocalizations.of(context)!.science,
                ),
                Text(
                  AppLocalizations.of(context)!.science,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),

          // Navigate to Movies
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => News(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.newspaper,
                  size: 50,
                ),
                tooltip: AppLocalizations.of(context)!.news,
              ),
              Text(
                AppLocalizations.of(context)!.news,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          // Navigate to Entertainment
          Column(
            children: [
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
                  size: 50,
                ),
                tooltip: AppLocalizations.of(context)!.entertainment,
              ),
              Text(
                AppLocalizations.of(context)!.entertainment,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomWidget(),
      drawer: const MyDrawer(),
    );
  }
}
