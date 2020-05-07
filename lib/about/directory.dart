import 'package:flutter/material.dart';
import 'homepage.dart';
import 'about.dart';
import 'privacy.dart';
import 'termsandconditions.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  static List<Widget> _children = <Widget>[
    AboutTab(),
    PrivacyPage(),
    termsandconditions(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueAccent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.blue,
      ),
      home: Scaffold(

        body: _children[_currentIndex], // new
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.face),
              title: Text('About'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.stop_screen_share),
              title: Text('Privacy'),
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_number),
                title: Text('Terms & Conditions')
            )
          ],
        ),
      ),
    );
  }
}