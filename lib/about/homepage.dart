import 'package:flutter/material.dart';
import 'directory.dart';

void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
      ),

      home: Home2(),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrDApp',
      home: HomePage(),
    );
  }
}
