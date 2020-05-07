import 'package:flutter/material.dart';
//import 'package:ord_countdown/about/directory.dart';
import 'config/theme.dart';
import 'widgets/theme_inherited_widget.dart';
import 'animationthings/enlistmentdate.dart';
import 'animationthings/popdate.dart';
import 'animationthings/serviceterm.dart';
import 'animationthings/mainpage.dart';
import 'about/about.dart';
import 'about/homepage.dart';
//import 'ColorTheme/colourTheme.dart';
import 'ColorTheme/colorpicker.dart';
void main(){
// async {
//     var dir = await getApplicationDocumentsDirectory();
//     Hive.init(dir.path);
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
final militaryGreen = const Color(0xFF4b5320);
bool loginConfirmed = false;
  Widget build(BuildContext context) {
    // return ThemeSwitcherWidget(
    //   initialDarkModeOn: false,
      
    //   child: FirstScreen(), //Loads the first screen(or home page or whatever if you want haha)
    // );
     return new MaterialApp(
       
      title: 'Where Got Time',
        theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    backgroundColor: Colors.green
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: militaryGreen,
    backgroundColor: militaryGreen
  ),
// theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),

     routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    // '/': (context) => FutureBuilder(
    //     future: Hive.openBox('myBox'),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         if (snapshot.error != null) {
    //           print(snapshot.error);
    //           return Scaffold(
    //             body: Center(
    //               child: Text('Something went wrong :/'),
    //             ),
    //           );
    //         } else {
    //           return Home();
    //         }
    //       } else {
    //         return Scaffold();
    //       }
    //     },
    //   ),
 '/': (context) => MainPage(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) => PopDate(),
    '/third': (context) => ServiceTerm(),
       '/fourth': (context) => Home(),
       '/fifth': (context) => MyApp2(),
       '/sixth' : (context) => ColourTracer(),
    
  },initialRoute: '/',

  // onGenerateRoute: (settings) => switch ( ) {
  //   case :
      
  //     break;
  //   default:
  // },

      
    );
  }
}


class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhereGotTime',
      theme:ThemeSwitcher.of(context).isDarkModeOn?darkTheme(context):lightTheme(context),
      home: Home(),
    );
  }
}
