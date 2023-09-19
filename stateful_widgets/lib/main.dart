import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void onClicked() {
    setState(() {
      counter += 1;
    });
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '$counter',
                style: TextStyle(fontSize: 30),
              ),
              IconButton(onPressed: onClicked, icon: Icon(Icons.add_box_rounded)),
              IconButton(onPressed: reset, icon: Icon(Icons.lock_reset_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}
