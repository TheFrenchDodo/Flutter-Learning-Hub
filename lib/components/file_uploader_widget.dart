import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class FileUploaderWidget extends StatefulWidget {
  @override
  FileUploaderWidgetState createState() => FileUploaderWidgetState();
}

class FileUploaderWidgetState extends State<FileUploaderWidget> {
  File? _selectedFile;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile() async {
    try{
      if (_selectedFile != null) {


      // _firestore.collection("Files").doc().set(
      //   {
      //     "uid": userCredential.user!.uid,
      //     "email": email,
      //   },
      // );
      }
    }
    catch (e) {
          if (context.mounted){ 
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child:Text(e.toString()),)
              ),
            );
          // }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _selectFile,
          child: Text(AppLocalizations.of(context)!.select_file),
        ),
        SizedBox(height: 16),
        if (_selectedFile != null)
          Text("${AppLocalizations.of(context)!.selected_file}:\n ${path.basename(_selectedFile!.path)}"),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _uploadFile,
          child: Text(AppLocalizations.of(context)!.upload_file, 
          semanticsLabel: AppLocalizations.of(context)!.upload_file),
        ),
      ],
    );
  }
}
