import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PopDate extends StatefulWidget {

  @override
  _PopDateState createState() => _PopDateState();
}

class _PopDateState extends State<PopDate> {
Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  @override
  bool loginConfirmed = false;
  bool selected = false;
  final pinkIC = const Color(0xFff8b9d4);
final militaryGreen = const Color(0xFF4b5320);
final elevenB = const Color(0xFF98ff98);
DateTime selectedDate = DateTime.now();
String popDate ="";
String popDate1;

   Future<String> getData2() async {
    final SharedPreferences prefs = await _sprefs;
    String data = prefs.getString('popDate');
    if (data != null && data != popDate)
      setState(() {
        
        popDate = data;
      });
      else if (data == null)
      setState(() {
        data = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
        popDate = data;
      });
    // this.setState(() {
    //   popDate = data;
    // });
    return popDate;
  }
  Future<String> _selectDate(BuildContext context) async {
    final SharedPreferences prefs = await _sprefs;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2018, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String popDate = DateFormat('dd-MM-yyyy').format(picked).toString();
        prefs.setString('popDate',popDate.toString());
      });
      String popDate = DateFormat('dd-MM-yyyy').format(picked).toString();
      return popDate;
  }
    void initState() {
    super.initState();
    getData2();
  }
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('When are you going to POP?'),

  

                            
             GestureDetector(  
                child: MaterialButton(
                  onPressed: () {
                  getData2();
                  _selectDate(context);
                  },
                  child:     Column( mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [   Container(
                    child: Center(child: 
    Text(selectedDate == null ? 'Press me twice' : popDate, style:TextStyle(fontSize: 50,  fontFamily: 'OpenSans',))
    
    ),
                  )],)),


              onDoubleTap: () =>
              
                  _selectDate(context),
                  

                
              ),
            
            SizedBox(height: 50,),
            
        
        
        Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [ RaisedButton(
          
                onPressed: () {
                  loginConfirmed =! loginConfirmed;
                  print('$loginConfirmed');
                  Navigator.pushNamed(context, '/third');
                },
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Confirm ah", style: TextStyle(color: Colors.black),),
              ),
              SizedBox(width: 30,),
              RaisedButton(
              
                onPressed: () {
                  loginConfirmed =! loginConfirmed;
                  print('$loginConfirmed');
                  Navigator.pushNamed(context, '/fourth');


                },
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(30)),
                child: Text("Eh paiseh my enlistment date wrong", style: TextStyle(backgroundColor: Colors.redAccent
                ),),
              ),
              
              ],)
       
          ],
       
        ),
      ),
    );
  }


}


