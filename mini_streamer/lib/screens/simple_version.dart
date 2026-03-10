import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StreamHome extends StatefulWidget {
  const StreamHome({super.key});

  @override
  State<StreamHome> createState() => _StreamHomeState();
}

class _StreamHomeState extends State<StreamHome> {
  String? fileName;
  //USe AWS here, get videos and show the list of them here
  String? uploadStatus;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });

      String? filePath = result.files.single.path;
      if(filePath != null){
        await uploadFileToS3(filePath);
      } else {
        print("User cancelled file picker");
      }
    }
  }

  Future<void> uploadFileToS3(String filePath) async {
    try{
      //This will be a hard coded pre-signed URL generated from AWS CLI
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(120),
      child: Column(
        children: [
          Text("Welcome to the Simple Video Viewer!!"),
          //Implement a File Picker logic here
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: pickFile,
              child: Text("Select File"),
            ),
          ),
          Text(
            fileName ?? "No file selected",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(height: 12),
          //ListView(),
        ],
      ),
    );
  }
}
