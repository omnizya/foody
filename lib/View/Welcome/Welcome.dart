import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foody/Theme/Color.dart';
import 'package:foody/View/Home/Home.dart';
import 'package:foody/View/Resturant/ResturantList.dart';

class Welcome extends StatelessWidget {
  final Future<User> user;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Welcome({this.user});

  logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } catch (e) {
      print('ERROR logout $e');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Resturant Nearby"),
          backgroundColor: primaryColor,
          actions: <Widget>[
            InkResponse(
              onTap: () => print('TODO: Tap appBar action'),
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10.0,
                ),
                child: Icon(Icons.shopping_cart),
              ),
            )
          ],
        ),
        drawer: drawer(title: 'Foody'),
        body: ResturantList(),
      );

// Drawer Widget
// TODO : add params
  Drawer drawer({String title}) => Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 30.0,
                  ),
                ),
              ),
              drawerMenu(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bouskoura, Morocco',
                      style: TextStyle(
                        color: secondryColor,
                        fontSize: titleText,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Change',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: normalText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget drawerMenu() => Column(
        children: <Widget>[
          drawerList(
            active: true,
            icon: Icons.home,
            name: 'Home',
            id: 'HOME',
          ), // HOME
          drawerList(
            active: false,
            icon: Icons.bookmark_border,
            name: 'My Orders',
            id: 'MY_ORDERS',
          ), // MY ORDER
          drawerList(
            active: false,
            icon: Icons.notifications_none,
            name: 'Notifications',
            id: 'NOTIFICATION',
          ), // Notification
          drawerList(
            active: false,
            icon: Icons.settings,
            name: 'Settings',
            id: 'SETTINGS',
          ), // Setting
          drawerList(
            active: false,
            icon: Icons.power_settings_new,
            name: 'Log Out',
            id: 'LOGOUT',
          ), // logout
        ],
      );

  Widget drawerList({
    String name,
    IconData icon,
    bool active,
    String id,
  }) =>
      InkWell(
        onTap: () {
          if (id == 'LOGOUT') {
            logout(_scaffoldKey.currentContext);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 10.0,
          ),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: active ? primaryColor : secondryColor,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                name,
                style: TextStyle(
                  color: active ? primaryColor : secondryColor,
                ),
              ),
            ],
          ),
        ),
      );
}
