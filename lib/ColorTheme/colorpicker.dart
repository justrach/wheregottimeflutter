import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ColourTracer extends StatefulWidget {
  @override
  _ColourTracerState createState() => _ColourTracerState();
}

class _ColourTracerState extends State<ColourTracer> {
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  Color completed = Colors.greenAccent;
//  static Color test3;
  Color left;
//  int test1;
//  int test2 = test3.value;
//  Color picked;
  int test1;
  int test2;
  int test3;
  completedCounter3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int haha;
    setState(() {
      haha = test3;
    });
    prefs.setInt('Lmao3', haha);
    return test3;
  }
  completedCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int haha;
    setState(() {
      haha = test1;
    });
    prefs.setInt('Lmao', haha);
    return test1;
  }
  completedCounter2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int haha;
    setState(() {
      haha = test2;
    });
    prefs.setInt('Lmao1', haha);
    return test2;
  }


  Future<int> setColour1() async {

    final SharedPreferences prefs = await _sprefs;

    setState(() {

      prefs.setInt('color', test1);
    });
    return test1;
  }
  Future<int> setColour2() async {

    final SharedPreferences prefs = await _sprefs;

    setState(() {

      prefs.setInt('color2', test2);
    });
    return test2;
  }
  void initState() {
   super.initState();
   setColour2();
    setColour1();
   completedCounter();
   completedCounter2();
   completedCounter3();
   }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:completed ,
          title: GestureDetector(
            child: Text('Customiser'),

          ),
          bottom: TabBar(
            tabs: <Widget>[
              const Tab(text: 'Days Left'),
              const Tab(text: 'Days Elapsed'),
              const Tab(text: 'Days left text'),

            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[

            Center(
              child:new ColorPicker(
                  color: Colors.green,
                  onChanged: (value){
                    setState(() {
                       test1 = value.value;
                      completedCounter();


                    });
                  }
              )  ),
            Center(
                child: new ColorPicker(
                    color: Colors.green,
                    onChanged: (value){
                      setState(() {
                        test2 = value.value;
                        completedCounter2();
                      });
                    }
                )  ),
            Center(
                child:new ColorPicker(
                    color: Colors.green,
                    onChanged: (value){
                      setState(() {
                        test3 = value.value;
                        completedCounter3();


                      });
                    }
                )  ),
          ],
        ),
      ),
    );

  }
}