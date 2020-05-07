import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ord_countdown/main.dart';
import 'mainpage.dart';

class ServiceTerm extends StatefulWidget {

  @override
  _ServiceTermState createState() => _ServiceTermState();
}

class _ServiceTermState extends State<ServiceTerm> {
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  @override
  bool loginConfirmed = false;
DateTime twentytwomonths;
DateTime newDate = DateTime.now();
  String popDate1 = '';
  String popDate;
  // String ordDate22months = "wait for this to load";
  DateTime enlistmentDate;
  String pickedItem;
  String ordDatefinalised24;
  String ordDatefinalised;
  int days;


   Future<String> getDataPop() async {
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      popDate1 = (prefs.getString('enlistmentDate')??'');
      return popDate1;
    });
  }
    Future<String> setOrdDate22() async{
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      DateTime enlistmentDate = DateFormat("dd-MM-yyyy").parse(popDate1);
      DateTime ordDate1 = new DateTime(enlistmentDate.year, enlistmentDate.month +22, enlistmentDate.day);
      ordDatefinalised = DateFormat('dd-MM-yyyy').format(ordDate1).toString();
      prefs.setString('ordDatefinalised',ordDatefinalised.toString());
    });
    return ordDatefinalised;
  }
  // Future<bool> is22() async{
  //   final SharedPreferences prefs = await _sprefs;
  //   setState(() {
      
  //   });
  // }
     Future<String> setOrdDate24() async{
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      DateTime enlistmentDate = DateFormat("dd-MM-yyyy").parse(popDate1);
      DateTime ordDate1 = new DateTime(enlistmentDate.year, enlistmentDate.month +24, enlistmentDate.day);
      ordDatefinalised = DateFormat('dd-MM-yyyy').format(ordDate1).toString();
      prefs.setString('ordDatefinalised',ordDatefinalised);
    });
    return ordDatefinalised;
  }
  Future<int> month22() async{
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      final int days = 674;
      prefs.setInt('days',days);
    });
    return days;}



    Future<int> month24() async{
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      final int days = 730;
      prefs.setInt('days',days);
    });
    return days;

  }

     void initState() {
    super.initState();
    getDataPop();
    setOrdDate22();
    setOrdDate24();
    month22();
    month24();
  }
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('How long is your service?',
            style: TextStyle(fontFamily: 'OpenSans',
            fontSize: 30,
            ),
            ),
            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [RaisedButton(
              color: Colors.greenAccent,
              child: Text('22 months',style: TextStyle(fontFamily: 'OpenSans',
            color: Colors.black)),
              onPressed: () {
                Navigator.pushNamed(context, '/');
                setOrdDate22();
                month22();
                print(days);

              },
            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),

            ),
            SizedBox(width: 50,),
            RaisedButton( color: Colors.greenAccent,
              child: Text('24 months',style: TextStyle(fontFamily: 'OpenSans',

            color: Colors.black),),
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),

              onPressed: () {
                Navigator.pushNamed(context, '/');
                setOrdDate24();
                month24();
                print(days);

              },),],),

                            SizedBox(height: 30,),
              RaisedButton(
                onPressed: () {
                  loginConfirmed =! loginConfirmed;
                  print('$loginConfirmed');
                  Navigator.pushNamed(context, '/fourth');


                },
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text("back", style: TextStyle(color: Colors.black, fontSize: 15),),
              ),
        
        
       
          ]),
    ));
  }




}