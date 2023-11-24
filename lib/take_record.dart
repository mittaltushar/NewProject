
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'data_list.dart';

class FillForm {
  String? entry;
}
  // ViewModel
  class FormViewModel with ChangeNotifier {
    FillForm _formData = FillForm();

    String? get newEntry => _formData.entry;


    set entry(String value) {
      _formData.entry = value;
      notifyListeners();
    }

  }

  class Entry extends StatelessWidget {
  int id;
  String userId;


  Entry({required this.id, required this.userId});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return ChangeNotifierProvider(
      create: (context) => FormViewModel(),
      child: MaterialApp(
        home: EntryRecord(funId: id, userId: userId),
      ),
    );
  }
}

class EntryRecord extends StatelessWidget {

  int? funId;
  String? userId;

  EntryRecord({required this.funId, required this.userId});
  final databaseReference = FirebaseDatabase.instance.reference();

  void writeToDatabase(String reco, int entry) {

    
    databaseReference.child('users/' +entry.toString() ).set({
      'entry': reco,

    }).then((value) {
      Fluttertoast.showToast(
          msg: "Insert",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print('Data written successfully!');
    }).catchError((error) {
      print('Failed to write data: $error');
    });
  }

  void updateUser(String userId, String record) {
    // Assuming 'users' is the key where your data is stored
     // Replace with the user ID you want to update

    // Update the specific user data
    databaseReference.child('users/$userId').update({
      'entry': record,

    }).then((value) {
      print('User data updated successfully!');
      Fluttertoast.showToast(
          msg: "Update",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }).catchError((error) {
      print('Failed to update user data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
          title: Text('FormField'),
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>

                    DataList()
                    ));
                  },
                  child:
                      Align(child:
              Text(
                "See List",
              ),alignment: Alignment.centerRight,))
              /*IconButton(
                icon: Icon(Icons.add),
                onPressed: onButtonPressed,
              ),*/
            ],
    ),
      body:
      Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    children: [
    TextField(
    decoration: InputDecoration(labelText: 'Type'),
    onChanged: (value) {
    context.read<FormViewModel>().entry = value;
    },
    ),

    SizedBox(height: 16.0),
    ElevatedButton(
    onPressed: () async {
    // Access the form data from the ViewModel
    String? record = context.read<FormViewModel>().newEntry;
    final prefs = await SharedPreferences.getInstance();

    if (funId == 2)
      updateUser(userId!, record!);
    else {
// set value
      //await prefs.setInt('user_id', data.payload.id);
      var id = await prefs.getInt('id');
      if (id == null) {
        id = 0;
      }


      //
      writeToDatabase(record!, id);
      prefs.setInt('id', ++id);
    }

    // Do something with the form data, e.g., submit it
    // For simplicity, just print the data

    },
    child: Text('Submit'),
    ),
    ],
    )
    ),);}}

