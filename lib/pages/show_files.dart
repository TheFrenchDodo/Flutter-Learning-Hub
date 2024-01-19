import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_learning_hub/components/my_bottomwidget.dart';
import 'package:flutter_learning_hub/components/my_circular_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.learning),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        automaticallyImplyLeading: true,
      ),
      body: FutureBuilder(
        future: fetchFileList(),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          try{
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: MyCircularIndicator(),
              );
            }
            } catch(e){
              if (context.mounted){
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(e.toString()),
                  ),
                );
              }
            }
          try {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
          }
          catch(e){
            if (context.mounted){
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ),
              );
            }
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var fileName = snapshot.data![index];

                return ListTile(
                  title: Text(fileName),
                  onTap: () {
                    // TODO
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text('No files available.'),
            );
          }
        }
      ),
      bottomNavigationBar: BottomWidget(),
    );
  }

  Future<List<String>> fetchFileList() async {
    try {
      // Fetch the list of files from Firebase Cloud Storage
      ListResult result = await FirebaseStorage.instance.ref('Files').listAll();
      List<String> fileList = result.items.map((item) => item.name).toList();
      return fileList;
    } catch (e) {
      print('Error fetching file list: $e');
      rethrow;
    }
  }
}
