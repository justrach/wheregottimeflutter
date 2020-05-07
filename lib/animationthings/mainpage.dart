
 import 'package:flutter/material.dart';
 import 'package:intl/intl.dart';
 import 'package:shared_preferences/shared_preferences.dart';

 import 'package:flutter_circular_chart/flutter_circular_chart.dart';



 class MainPage extends StatefulWidget {
   @override
   _MainPageState createState() => _MainPageState();
 }

 class _MainPageState extends State<MainPage> {
   Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
   @override
   String ordDaysLeft="Press the settings icon below";

   String popDate1 = 'Faster eh';
   int days ;
   int daysLeft;
   int popDaysLeft; // for POP
   String fromPop=""; //from Pop window
   String daysToPoP;

   int thisIs(){
     if(daysLeft == null){
       setState(() {
         daysLeft = 80;

       }
       );

     }
     else {
       return daysLeft;
     }
     return daysLeft;
   }


   final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
   final GlobalKey<AnimatedCircularChartState> _chartKey2 = new GlobalKey<AnimatedCircularChartState>();

  int completed1;
  int left1 ;
  int dayslefttext;
  Color completed;
  Color left;

  Future<int> getColour1() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
     completed1 = prefs.getInt('Lmao') ?? Colors.green.value;


    });
    return completed1;

  }
   Future<int> getColour3() async{
     final prefs = await SharedPreferences.getInstance();
     setState(() {
       dayslefttext = prefs.getInt('Lmao3') ?? Colors.blueGrey.value;


     });
     return dayslefttext;

   }

   Future<int> getColour2() async{
     final prefs = await SharedPreferences.getInstance();
     setState(() {
       left1 = prefs.getInt('Lmao1') ?? Colors.greenAccent.value;
     });
     return left1;
   }

   Future<String> getDataPop() async {
     final SharedPreferences prefs = await _sprefs;

     setState(() {
       popDate1 = (prefs.getString('ordDatefinalised') ?? '');
       return popDate1;
     });
   } //get the final ORD date
   Future<int> numberDays() async {
     final SharedPreferences prefs = await _sprefs;

     setState(() {
       days = (prefs.getInt('days') ?? '');
       return days;
     });
     return days;
   } //
   Future<String> setOrdDate24() async{
     final SharedPreferences prefs = await _sprefs;

     setState(() {
       DateTime enlistmentDate = DateFormat("dd-MM-yyyy").parse(popDate1);
       int difference = enlistmentDate.difference(DateTime.now()).inDays;
//      ordDaysLeft = "";
//       if(difference == 0){
//         String ordDaysLeft = "ORDLO";
//       }else{
       ordDaysLeft = difference.toString();
       prefs.setString('daysLeft',ordDaysLeft);
     });
     return ordDaysLeft;
   } //days left to ORD
   Future<int> daysleft() async {
     final SharedPreferences prefs = await _sprefs;

     setState(() {
       days = (prefs.getInt('days') ?? '');
//       int daysLeft1 = - days - int.parse(ordDaysLeft)  ;
       double percentage = (int.parse(ordDaysLeft)/ days) * 100;
       daysLeft= percentage.toInt();
       daysLeft = (prefs.setInt('daypercentage', daysLeft) ?? '');

       return daysLeft;

     });
     print(daysLeft);
     return daysLeft;
   } //find percentage of number of days elapsed to actual number of days

   /// POPREGION PLEASE DO NOT WRITE OTHER CODE INSIDE HERE PLEASE :)
//   Future<String> getPopdate() async {
//     final SharedPreferences prefs = await _sprefs;
//     setState(() {
//       fromPop = (prefs.getString('popDate')??'');
//       return fromPop;
//     });
//   }
//   //number of days as percentage to current day
//   Future<int> popDays() async {
//     final SharedPreferences prefs = await _sprefs;
//
//     setState(() {
//       int daysLeft1 = days - int.parse(ordDaysLeft) ;
//       double percentage = daysLeft1/~ days * 100;
//       daysLeft= percentage.toInt();
//       daysLeft = (prefs.getInt('daypercentage') ?? '');
//
//       return daysLeft;
//     });
//     return daysLeft;
//   }
//   Future<String> currentDayminusPop() async{
//     final SharedPreferences prefs = await _sprefs;
//     setState(() {
//       DateTime enlistmentDate = DateFormat("dd-MM-yyyy").parse(fromPop);
//       int difference = enlistmentDate.difference(DateTime.now()).inDays;
//
//       daysToPoP = difference.toString();
//       prefs.setString('daysToPoP',daysToPoP);
//     });
//     return daysToPoP;
//   }
   /// POP SECTION HERE PLS DONT WRITE CODE BEYOND THIS REGION TAHNKS
   /// DO
   /// NoT
   /// WriTe
   /// HERE
   /// ThaNks


//   Future<double> leaveDays() async{
//     final SharedPreferences prefs = await _sprefs;
//     setState(() {
//        double value = 14;
//       prefs.setDouble('leaveDays',value);
//     });
//     return value;
//
//   }
   _loadCounter() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
       value = (prefs.getDouble('counter') ?? 100);
       if ((value/100 *14).toInt() == 0){
         value =0;
       }
       return value;
     });
   }double value = 100;

   final _chartSize = const Size(200.0, 200.0);
//   double value = 14.0;
   Color labelColor = Colors.blue[200];

   void _increment() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {

//       value += .5;

       value = (prefs.getDouble('counter') ?? 100) + (3.6);
       prefs.setDouble('counter', value);
       List<CircularStackEntry> data = _generateChartData(value);
       _chartKey.currentState.updateData(data);
     });
   }


   void _decrement() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
       value = (prefs.getDouble('counter') ?? 100) -(3.6);
       prefs.setDouble('counter', value);
       List<CircularStackEntry> data = _generateChartData(value);
       _chartKey.currentState.updateData(data);
     });
   }

   List<CircularStackEntry> _generateChartData(double value) {
     Color dialColor = Colors.green[200];
     if (value < 20) {
       dialColor = Colors.red[200];
     } else if (value < 60) {
       dialColor = Colors.yellow[600];
     }
     else if (value == 100) {
       dialColor = Colors.green[400];
     } else if (value <0) {
       dialColor = Colors.red[900];
     }
     else if (value < 30) {
       dialColor = Colors.pink[900];
     }
     else if (value < 75) {
       dialColor = Colors.green[100];
     }
     labelColor = dialColor;

     List<CircularStackEntry> data = <CircularStackEntry>[
       new CircularStackEntry(
         <CircularSegmentEntry>[
           new CircularSegmentEntry(
             value,
             dialColor,
             rankKey: 'percentage',
           )
         ],
         rankKey: 'percentage',
       ),
     ];

     if (value > 100) {
       labelColor = Colors.green[200];

       data.add(new CircularStackEntry(
         <CircularSegmentEntry>[
           new CircularSegmentEntry(
             value - 100,
             Colors.green[200],
             rankKey: 'percentage',
           ),
         ],
         rankKey: 'percentage2',
       ));
     }

     return data;
   }
   Color textColor = Colors.green;
   colorpicker(){
     if (value < 20) {
       textColor = Colors.red[200];
     } else if (value < 60) {
       textColor = Colors.yellow[600];
     }
     else if (value == 100) {
       textColor = Colors.green[400];
     } else if (value <0) {
       textColor = Colors.red[900];
     }
     else if (value < 30) {
       textColor = Colors.pink[900];
     }
     else if (value < 75) {
       textColor = Colors.green[100];
     }
     return textColor;

   }
   void initState() {
     super.initState();
     getDataPop();
     setOrdDate24();
     numberDays();
     daysleft();
//     getPopdate();
//     popDays();
//     currentDayminusPop();
     _increment();
     _decrement();
     getColour1();
     getColour2();
     getColour3();
//     leaveDays();
   }
   Color completedColour = Colors.green;
   Color leftColour = Colors.greenAccent;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child: Align(
           alignment: Alignment.topCenter,
           child: Column(

             children: [
               AnimatedCircularChart(
                 key: _chartKey2,
                 size: const Size(400.0, 400.0),
                 initialChartData: <CircularStackEntry>[
                   new CircularStackEntry(
                     <CircularSegmentEntry>[
                       new CircularSegmentEntry(
                         thisIs().toDouble(),
                         Color(completed1),
                         rankKey: 'completed',
                       ),
//                     new CircularSegmentEntry(
//                       100.0-daysLeft.toDouble(),
//                       Colors.blueGrey[600],
//                       rankKey: 'remaining',
//                     ),
                       new CircularSegmentEntry(
                         100.0-thisIs().toDouble(),
                         Color(left1),
                         rankKey: 'remaining',
                       ),
                     ],
                     rankKey: 'progress',
                   ),
                 ],
                 chartType: CircularChartType.Radial,
                 edgeStyle: SegmentEdgeStyle.round,
                 percentageValues: true,
                 holeLabel: '$ordDaysLeft Days',
                 labelStyle: TextStyle(
                   color: Color(dayslefttext),
                   fontWeight: FontWeight.bold,
                   fontSize: 32.0,
                 ),
               ),
               SizedBox(height: 10,),


               AnimatedCircularChart(
                 key: _chartKey,
                 size: _chartSize,
                 initialChartData: _generateChartData(value),
                 chartType: CircularChartType.Radial,
                 edgeStyle: SegmentEdgeStyle.round,
                 percentageValues: true,
                 holeLabel: '${(value/100 *14).toInt()} leaves ',
                 labelStyle: TextStyle(color: colorpicker(),fontWeight: FontWeight.bold,
                 ),

               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: <Widget>[
                   new RaisedButton(
                     onPressed: _decrement,
                     child: const Icon(Icons.remove),
                     shape: const CircleBorder(),
                     color: Colors.red,
                     textColor: Colors.white,
                   ),
                   new RaisedButton(
                     onPressed: _increment,
                     child: const Icon(Icons.add),
                     shape: const CircleBorder(),
                     color: Colors.green,
                     textColor: Colors.white,
                   ),
                 ],
               ),
               SizedBox(height: 20,),
               MaterialButton(
                 child: Icon(Icons.settings),
                 onPressed: (){
                   Navigator.pushNamed(context, '/fourth');
                 },
               ),
           ],),
         ),
       ),

     );
   }
 }