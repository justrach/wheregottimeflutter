import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {

  @override
  
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Box _box;
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  @override
  
  bool loginConfirmed = false;
  bool selected = false;
  String pickedItem;
  final pinkIC = const Color(0xFff8b9d4);
final militaryGreen = const Color(0xFF4b5320);
final elevenB = const Color(0xFF98ff98);
DateTime selectedDate = DateTime.now();

// Future<String> _getDataFromCalendar(DateTime _datetime) async{
//   final prefs = await  SharedPreferences.getInstance();
//   prefs.setString("date1", ;);

// }

  
    Future<String> getData() async {
    final SharedPreferences prefs = await _sprefs;
    String data = prefs.getString('enlistmentDate');
    if (data != null && data != pickedItem)
      setState(() {
        
        pickedItem = data;
      });
      else if (data == null)
      setState(() {
        data = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
        pickedItem = data;
      });
    // this.setState(() {
    //   pickedItem = data;
    // });
    return pickedItem;
  }
  Future<String> _selectDate(BuildContext context) async {
    final SharedPreferences prefs = await _sprefs;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2018, 6),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String pickedItem = DateFormat('dd-MM-yyyy').format(picked).toString();
        prefs.setString('enlistmentDate',pickedItem.toString());
      });
      String pickedItem = DateFormat('dd-MM-yyyy').format(picked).toString();
      return pickedItem;
  }
    void initState() {
    super.initState();
    getData();
  }
  //  void initState() {
  //   _box = Hive.box('myBox');
  //   super.initState();
  // }
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('When did you enlist?'),
            MaterialButton(
                  onPressed: () {
                    getData();
                  _selectDate(context);},
                  child:     Column( mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [   Container(
                    child: Center(child:
                              Text(selectedDate == null ? 'Press me twice' :pickedItem, style:TextStyle(fontSize: 50,  fontFamily: 'OpenSans',))

                                ),
                                    )],)),
            SizedBox(height: 50,),

            RaisedButton(
                onPressed: () {
                  loginConfirmed =! loginConfirmed;
                  print('$loginConfirmed');
                  Navigator.pushNamed(context, '/second');

                },
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Confirm ah?", style: TextStyle(color: Colors.black),),
              ),
              SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fifth');
                },
                child: Column(children: [Icon(Icons.face),
                  Text('about')],),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sixth');
                },
                child: Column(children: [Icon(Icons.color_lens),
                  Text('App themer')],),
              ),
            ],),

              // Text(_box.get('counter', defaultValue: selectedDate).toString())
          ],


        ),
      ),
    );
  }

  //   Future<String> _nameSaver() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('name2', '$selectedDate');
  //   prefs.setString('school2', 'asdasdas');
  //   return 'saved';
  // }

  // _nameRetriever() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final name = prefs.getString('name2') ?? '';
  //   final school = prefs.getString('school2') ?? '';

  //   print(name);
    
  // }

}


