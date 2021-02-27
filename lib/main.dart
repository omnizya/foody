import 'package:flutter/material.dart';

void main() {
  runApp(FoodyApp());
}

class FoodyApp extends StatefulWidget {
  FoodyApp({Key key}) : super(key: key);

  @override
  _FoodyAppState createState() => _FoodyAppState();
}

class _FoodyAppState extends State<FoodyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('TODO: Make a cool foody app'),
      ),
    );
  }
}
