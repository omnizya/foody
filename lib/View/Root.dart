import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:foody/Widgets/Loader.dart';

import 'Home/Home.dart';
import 'Welcome/Welcome.dart';

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootState();
}

class _RootState extends State<Root> {
  Widget launchWidget = loaderWidget();

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    //Future<User> user = await FirebaseAuth.instance.currentUser;
    const user = null;
    try {
      if (user != null) {
        setState(() {
          launchWidget = Welcome(
            user: user,
          );
        });
      } else {
        setState(() {
          launchWidget = Home();
        });
      }
    } catch (e) {
      print("ERROR IN LAUNCH ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: launchWidget);
}
