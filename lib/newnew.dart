/*
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage22 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage22> {
  int? _selectedValue = 1; // Initialize with a default value

  void handleRadioValueChanged(int? value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Buttons in AppBar'),
        actions: [
          IconButton(
            icon: Icon(Icons.radio_button_checked),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return
                    PopupMenuButton(
                      offset: const Offset(0, 50),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),itemBuilder: (BuildContext context) { return },
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RadioListTile<int>(
                          title: Text('Option 1'),
                          value: 1,
                          groupValue: _selectedValue,
                          onChanged: handleRadioValueChanged,
                        ),
                        RadioListTile<int>(
                          title: Text('Option 2'),
                          value: 2,
                          groupValue: _selectedValue,
                          onChanged: handleRadioValueChanged,
                        ),
                      ],
                    ),);
                  */
/*onSelected: (Payload2 viewType) {
                  _site = viewType.name;
                  tappedIndex = viewType.id;
                  },*//*



                  */
/*Container(
                    width: 400,
                  child:
                   AlertDialog(
                    title: Text('Select an option'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RadioListTile<int>(
                          title: Text('Option 1'),
                          value: 1,
                          groupValue: _selectedValue,
                          onChanged: handleRadioValueChanged,
                        ),
                        RadioListTile<int>(
                          title: Text('Option 2'),
                          value: 2,
                          groupValue: _selectedValue,
                          onChanged: handleRadioValueChanged,
                        ),
                      ],
                    ),
                  ),);*//*

                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Selected value: $_selectedValue'),
      ),
    );
  }
}
*/
