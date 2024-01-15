import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class FileUploaderWidget extends StatefulWidget {
  @override
  FileUploaderWidgetState createState() => FileUploaderWidgetState();
}

class FileUploaderWidgetState extends State<FileUploaderWidget> {
  File? _selectedFile;

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_selectedFile != null) {
      // String fileName = path.basename(_selectedFile!.path);
      String apiUrl = 'https://example.com/upload'; // Find the Firebase API endpoint

      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(await http.MultipartFile.fromPath('file', _selectedFile!.path));
      var response = await request.send();

      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('Error uploading file');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _selectFile,
          child: Text('Select File'),
        ),
        SizedBox(height: 16),
        if (_selectedFile != null)
          Text('Selected File: ${path.basename(_selectedFile!.path)}'),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _uploadFile,
          child: Text('Upload File'),
        ),
      ],
    );
  }
}