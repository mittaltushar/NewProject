

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rama_puzle/quizHistoryData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CustomColor.dart';
import 'body1.dart';

class QuestionHistory extends StatefulWidget {
  QuizHIstoryData? data;
  QuestionHistory ({GlobalKey? key, required this.data}):super(key: key);

  @override
  State createState() => QuestionHistory2(
data: data
  );

}

class QuestionHistory2 extends State {
  QuizHIstoryData? data;
  int? _incre= 0;
  GlobalKey<Question2> _buttonStateKey = GlobalKey();
  QuestionHistory2 ({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar:
            AppBar(
                elevation: 0,
                backgroundColor: ColorConstants.backgroundColor,
                centerTitle: true,
                leadingWidth: 30,

                leading: Padding(padding: EdgeInsets.only(left: 10),
                  child:GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      //prefs = await SharedPreferences.getInstance();

                      String? lang = await prefs.getString('lang');
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Body2(isLogin: false, )));
                    },child:

                  Image.asset("assets/images/back_arrow.png", height: 20,
                    width: 20,)
                    ,
                    //children: <Widget>[Text("fjkff")],
                  ),),
                title: Text("sub_name",style: /*GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20, fontWeight: FontWeight.w800
          ),*/

                TextStyle(color: Colors.white, fontFamily: 'Poppins',
                    fontSize: 20, fontWeight:  FontWeight.w800)

                )

              /*actions: [
          Padding(padding: EdgeInsets.only(left: 25),
          *//*child: DropdownButtonHideUnderline(*//*
          //child: Expanded(
          child: Image.asset(
            "assets/images/back_arrow.png", height: 20,
            width: 20,),)
            ],*/
            ),
    body:
      Column(
        children: [
          Question(key: _buttonStateKey, payload1: data!.payload.elementAt(0)),

          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                setState(()  {
                  _incre = (_incre! + 1)!;
                  //Question(key: _buttonStateKey, payload1: data!.payload.elementAt(0));
                  _buttonStateKey.currentState?.setValue(data!.payload.elementAt(_incre!));

                  });},

              child: Text("Next"),

              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontWeight: FontWeight.w600),
                minimumSize: const Size.fromHeight(50),
                primary: Colors.yellow,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          )
        ],
      ),),);


  }

}

class Question extends StatefulWidget {
  Payload payload1;

  Question({GlobalKey? key, required this.payload1});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return Question2(payload1: payload1);
  }

}

class Question2 extends State<Question> {
  Payload? payload1;
  Question2({Key? key,required this.payload1});
  setValue(Payload value) {
    setState(() {
      this.payload1 = value;
    });
  }

  String formatHtmlString(String string) {
    return string
        .replaceAll("<p>", "") // Paragraphs
        .replaceAll("</p>", "") // Line Breaks
    /*.replaceAll("\"", "&quot;") // Quote Marks
        .replaceAll("'", "&apos;") // Apostrophe
        .replaceAll(">", "&lt;") // Less-than Comparator (Strip Tags)
        .replaceAll("<", "&gt;") */// Greater-than Comparator (Strip Tags)
        .trim(); // Whitespace
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //Payload0 payload0 = payload;
    return
/*
    MaterialApp(
      home: Scaffold(
          appBar:
          AppBar(
              elevation: 0,
              backgroundColor: ColorConstants.backgroundColor,
              centerTitle: true,
              leadingWidth: 30,

              leading: Padding(padding: EdgeInsets.only(left: 10),
                child:GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Body2(isLogin: false)));
                  },child:

                Image.asset("assets/images/back_arrow.png", height: 20,
                  width: 20,)
                  ,
                  //children: <Widget>[Text("fjkff")],
                ),),
              title: Text("sub_name",style: *//*GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20, fontWeight: FontWeight.w800
          ),*//*

              TextStyle(color: Colors.white, fontFamily: 'Poppins',
                  fontSize: 20, fontWeight:  FontWeight.w800)

              )

            *//*actions: [
          Padding(padding: EdgeInsets.only(left: 25),
          *//**//*child: DropdownButtonHideUnderline(*//**//*
          //child: Expanded(
          child: Image.asset(
            "assets/images/back_arrow.png", height: 20,
            width: 20,),)
            ],*//*
          ),body:*/



      Container(

        height: 400,
        child:

        Column(

            children: [
              Text(formatHtmlString(payload1!.question)),

              InkWell(onTap: () {
                setState(() {
                  /*colorIndex = 0;
                  answer = 'a';*/
                });

              },child:
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                  //color: (colorIndex == 0) ? ColorConstants.greenColor : Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)
                      ,bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                ),child:

              Align(
                  alignment: Alignment.centerLeft ,
                  child:
                  Padding(padding: EdgeInsets.only(left: 10),child:Text("A ." + payload1!.a),)),),),
              InkWell(onTap: () {
                setState(() {
                  /*colorIndex = 1;
                  answer = 'b';*/
                });

              },child:
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                 // color: (colorIndex == 1) ? ColorConstants.greenColor : Colors.white ,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)
                      ,bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                ),child:
              Align(
                  alignment: Alignment.centerLeft ,
                  child:
                  Padding(padding: EdgeInsets.only(left: 10),child:Text("B ." + payload1!.b),)),),),

              InkWell(
                onTap: () {
                  setState(() {
                    /*colorIndex = 2;
                    answer = 'c';*/
                  });
                },
                child:
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 350,
                  height: 35,
                  decoration: BoxDecoration(
                    //color: (colorIndex == 2) ? ColorConstants.greenColor : Colors.white ,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)
                        ,bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                  ),child: Align(
                    alignment: Alignment.centerLeft ,
                    child:
                    Padding(padding: EdgeInsets.only(left: 10),child:Text("C ." + payload1!.c),)),),),

              InkWell(
                onTap: () {
                  setState(() {
                    /*colorIndex = 3;
                    answer = 'd';*/
                  });
                },
                child:
                Container(
                    width: 350,
                    height: 35,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                     // color: (colorIndex == 3) ? ColorConstants.greenColor : Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)
                          ,bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                    ),child: Align(
                    alignment: Alignment.centerLeft ,
                    child:
                    Padding(padding: EdgeInsets.only(left: 10),child:Text("D ." + payload1!.d ),))),)]),);
  }

}

//class