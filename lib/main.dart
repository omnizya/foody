import 'package:flutter/material.dart';
import 'package:foody/Theme/Color.dart';
import 'package:foody/View/Root.dart';

void main() {
  runApp(FoodyApp());
}

class FoodyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "RalewatMedium",
        primaryColor: primaryColor,
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        primarySwatch: Colors.green,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
        ),
      ),
      title: 'Foody',
      home: Root(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/root': (context) => Root(),
      },
    );
  }
}
