import 'package:flutter/material.dart';
import 'package:mini_streamer/screens/simple_version.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body:
          StreamHome(),
        
      ),
    );
  }
}
