import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({super.key});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {

  String filePickerReturnText = "";

  Future<String> pickSingleFile() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result != null){
      String filePath = result.files.single.path!;
      filePickerReturnText = filePath.toString();
    } else{
      filePickerReturnText = Text("No file picked").toString();
    }

    return filePickerReturnText;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Display the name of the picked file
          Text(filePickerReturnText),
    ],
    );
  }
}