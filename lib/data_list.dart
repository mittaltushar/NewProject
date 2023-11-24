
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/data.dart';
import 'package:test_project/take_record.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DataList extends StatefulWidget {

  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return Listing ();
  }

}

class Listing extends State {
  late  List<Data> list = [];

  bool clickState = false;
   /*readFromDatabase2() async {
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.once().then((DataSnapshot snapshot) {


    }).catchError((error) {
      print('Failed to read data: $error');
    });
  }*/

  writeToDatabase() {
    final databaseReference = FirebaseDatabase.instance.reference();

    List list2;

    /*for (int i= 0; i < list.length; i++) {
      list2.add(list.)
    }*/

    for (int i = 0; i < list.length; i++) {
      databaseReference.child('users/' + list.elementAt(i).id.toString()).set({
        'entry': list
            .elementAt(i)
            .entry,

      }).then((value) {
        /*Fluttertoast.showToast(
          msg: "Insert",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );*/
        print('Data written successfully!');
      }).catchError((error) {
        print('Failed to write data: $error');
      });
    }
    list = [];
  }
  Future<void> readFromDatabase() async {
    final databaseReference = FirebaseDatabase.instance.reference();

    /*databaseReference.child('users').once().then((DataSnapshot snapshot) {


    }*/
    setState(() {

    });
    final snapshot = await FirebaseDatabase.instance.ref('users').get();

    /*databaseReference.child('users').once().then((DataSnapshot snapshot) {
      Object? data = snapshot.value;

setState(() {

    });

      // Process the data as needed
      print('Data from Firebase: $data');
    } as FutureOr Function(DatabaseEvent value)).catchError((error) {
      print('Failed to read data: $error');
    });*/


    final map = snapshot.value as List;
    print(map);
    //map.elementAt(0)['entry']

    for (int i = 0; i < map.length; i++) {
      //list.add(map['entry' + i.toString()]);
      if (map.elementAt(i) != null) {
        Data data = new Data(entry: map.elementAt(i)['entry'],
            id: i);
        list.add(data);
      }




    }
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('id', list.length);


    setState(() {

    });
    /*map.forEach((key, value) {
      final data = Data.fromMap(value);
      list.add(data);
    });*/
    /*final map =
    databaseReference.child('users').once().then((DataSnapshot snapshot) {
      print(snapshot.value);
      Map<dynamic, dynamic> values = snapshot.value;
      */ /*setState(() {
        userData = 'Name: ${values['username']}, Email: ${values['email']}';
      });*/ /*
    }).catchError((error) {
      print('Failed to read data: $error');
    });*/
    //clickState = true;

  }

  removeFromList(int id) {
    list.removeAt(id);
  }

  deleteData(int id) {
    //clickState = false;
    final databaseReference = FirebaseDatabase.instance.reference();
    for (int i = 0; i < list.length; i++) {
      databaseReference.child('users/' + list
          .elementAt(i)
          .id
          .toString()).remove();
    }


    /*if (list.length == 1)
      list.removeAt(0);
    else if (list.length != 0 || list.length != 1)
      list.removeAt(--id);*/

    list.removeAt(id);
    //removeFromList(id);

    //List<Data> list2 = [];
    /*for (int i = 0; i < list.length; i++) {
      list2.add(new Data(entry: list
          .elementAt(i)
          .entry, id: i));

    }*/



    for (int j = 0; j < list.length; j++) {
      if (list.elementAt(j)  != null)
      databaseReference.child('users/' + j.toString()).set({
        'entry': list
            .elementAt(j)
            .entry,
      });
    }

    /*setState(() {

    });*/
    list = [];
    readFromDatabase();
    //readFromDatabase();

  }







    /*for (int i = 0; i < list.length;i++) {
      databaseReference.child('users/' + list.elementAt(i).id.toString()).remove();
    }*/

    /*databaseReference.child('users/' + id.toString()).remove().then((value) {
      print('User data deleted successfully!');
      for (int i = 0 ; i < list.length; i++) {
        databaseReference.child('users/' + list.elementAt(i).id.toString()).remove();
      }

    }).catchError((error) {
      print('Failed to delete user data: $error');
    });*/


    /*final databaseReference = FirebaseDatabase.instance.reference();
    int userId = id; // Replace with the user ID you want to delete

    // Delete the specific user data
    databaseReference.child('users/$userId').remove().then((value) {
      print('User data deleted successfully!');


    }).catchError((error) {
      print('Failed to delete user data: $error');
    });
    //list.removeAt(id);

    writeToDatabase();

    readFromDatabase();
    setState(() {

    });*/


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    //readFromDatabase();
    return MaterialApp(
home:
Scaffold (
body:

    ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {

return

    Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [


Text(list[index].entry , style: TextStyle(fontSize: 15),),

        InkWell(onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  Entry(id: 2,userId: list[index].id.toString(),)));
        }
          ,
        child:
        Text("Edit" , style: TextStyle(color: Colors.blue),),
        ),

        InkWell(onTap: () {
          //if (clickState == true)
         deleteData(index);
        },child:
        Text("Delete", style: TextStyle(color: Colors.blue)),)
      ],
    );}),),);}}




 /*   throw UnimplementedError();
    *//*return ChangeNotifierProvider(
      create: (context) => FormViewModel(),
      child: MaterialApp(
        home: EntryRecord(),
      ),
    );*//*

  }

  void getList() {

  }
}*/


