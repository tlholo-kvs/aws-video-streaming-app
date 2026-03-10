import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StreamHome extends StatefulWidget {
  const StreamHome({super.key});

  @override
  State<StreamHome> createState() => _StreamHomeState();
}

class _StreamHomeState extends State<StreamHome> {
  String? fileName;
  //USe AWS here, get videos and show the list of them here

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });

      if (kDebugMode) {
        print("File path: ${result.files.single.path}");
      } else {
        if (kDebugMode) {
          print("User cancelled the file picker");
        }
      }
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
