
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:rama_puzle/HttpClient.dart';
import 'package:rama_puzle/splash_screen.dart';
import 'package:rama_puzle/topicQuizData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CustomColor.dart';
import 'body1.dart';

Future<TopicQuizData>? topicQuizData ;

class startQuiz extends StatefulWidget {
  final int topic_id;
  final String sub_name;
  int _remainingTime = 60; //initial time in seconds
  late Timer? _timer;
  final String reward;

  startQuiz(
  {Key? key, topic, required this.topic_id, required this.sub_name, required this.reward}

      /*{Key? key, required this.category_id, required this.sub_category_id
    , required this.sub_name, required this.description
  }*/)   : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return startQuiz2(topic_id: topic_id, sub_name: sub_name, reward:reward);
  }

}

class QuizSection extends StatefulWidget {

  //QuizSection({GlobalKey key}) : super(key: key);

 /* @override
  LetterButtonState createState() => LetterButtonState();*/
  Payload0 payload1;


  QuizSection({GlobalKey? key, required this.payload1}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return QuizSection2(payload: payload1);
  }

}

class QuizSection2 extends State {
  Payload0 payload;

   int colorIndex = 5;
   String? answer ;
  QuizSection2({Key? key, required this.payload});
  int? questionNO = 1;



  setValue(Payload0 value) {
    setState(() {
      this.payload = value;
      this.colorIndex = 5;
    });
  }
  getValue() {

    return answer;
  }
  setQuestion(int qNo) {
   questionNO = qNo;
  }
  @override
  void initState() {
    // TODO: implement initState
    /*populateDropDowns();
    populateDropDowns2();
    populateDropDownNationality();*/

    super.initState();

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
    var colorName;
    Payload0 payload0 = payload;
    return

      Container(
        height: 400,
        child:

        Column(

          children: [
            Text(questionNO.toString() + ". " +  formatHtmlString(payload.question)),

          InkWell(onTap: () {
            setState(() {
              colorIndex = 0;
              answer = 'a';
            });

          },child:
          Container(
              margin: EdgeInsets.only(top: 10),
              width: 350,
              height: 35,
            decoration: BoxDecoration(
                color: (colorIndex == 0) ? ColorConstants.greenColor : Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)
                    ,bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
      ),child:

          Align(
              alignment: Alignment.centerLeft ,
              child:
              Padding(padding: EdgeInsets.only(left: 10),child:Text("A ." + payload.a),)),),),
    InkWell(onTap: () {
      setState(() {
        colorIndex = 1;
        answer = 'b';
      });

    },child:
    Container(
      margin: EdgeInsets.only(top: 10),
      width: 350,
      height: 35,
    decoration: BoxDecoration(
    color: (colorIndex == 1) ? ColorConstants.greenColor : Colors.white ,
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)
    ,bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
    ),child:
    Align(
        alignment: Alignment.centerLeft ,
        child:
    Padding(padding: EdgeInsets.only(left: 10),child:Text("B ." + payload.b),)),),),

    InkWell(
        onTap: () {
          setState(() {
            colorIndex = 2;
            answer = 'c';
          });
        },
        child:
    Container(
        margin: EdgeInsets.only(top: 10),
        width: 350,
        height: 35,
    decoration: BoxDecoration(
    color: (colorIndex == 2) ? ColorConstants.greenColor : Colors.white ,
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)
    ,bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
    ),child: Align(
        alignment: Alignment.centerLeft ,
        child:
        Padding(padding: EdgeInsets.only(left: 10),child:Text("C ." + payload.c),)),),),

    InkWell(
      onTap: () {
        setState(() {
          colorIndex = 3;
          answer = 'd';
        });
      },
      child:
    Container(
        width: 350,
        height: 35,
        margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
    color: (colorIndex == 3) ? ColorConstants.greenColor : Colors.white,
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)
    ,bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
    ),child: Align(
        alignment: Alignment.centerLeft ,
        child:
        Padding(padding: EdgeInsets.only(left: 10),child:Text("D ." + payload.d ),))),)]),);}}





     /* FutureBuilder<TopicQuizData>(
        future: topicQuizData,
        builder: (context, snapshot) {
      return*/


        /*Column(
            children: [


        Text(snapshot?.data!.payload.elementAt(index).question as String),


    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)
    ,bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    *//*image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),*//*

    ),
    child: Text(snapshot.data?.payload.elementAt(0).a as String )
    ,
    ),

    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)
    ,bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    *//*image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),*//*

    ),
    child: Text(snapshot.data?.payload.elementAt(0).b as String)
    ,
    ),

    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)
    ,bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    *//*image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),*//*

    ),
    child: Text(snapshot.data?.payload.elementAt(index).c as String)
    ,
    ),

    Container(
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)
    ,bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    *//*image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),*//*

    ),
    child: Text(snapshot.data?.payload.elementAt(index).d as String),),],)*/



class startQuiz2 extends State {
  TopicQuizData? topicQuizData;
  QuizSection? quizSection;
  final String sub_name;
  final int topic_id;
  int? _incre= 0;
  int _remainingTime = 0; //initial time in seconds
  late Timer _timer;
  int? userTime;
  bool? quizComplete;
  int? questionNO = 1;
  String? reward;
  GlobalKey<QuizSection2> _buttonStateKey = GlobalKey();


   startQuiz2(
      {Key? key, topic, required this.topic_id, required this.sub_name, required this.reward}
      /*{Key? key, required this.category_id, required this.sub_category_id
    , required this.sub_name, required this.description
  }*/);


  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getTopicQuizData();

    //topicData = getTopicList( "$category_id", sub_category_id!);
  }

  getTopicQuizData() async {
    TopicQuizData data = await getTopicQuiz(topic_id.toString());

    setState(() {
      topicQuizData = data;
      _remainingTime = data.payload[0].topicTime;
      userTime = _remainingTime;
      if (_remainingTime != 0) {
        questionNO = 1;
      }

    });
    _startTimer();
  }

  quitQuiz2() async {
    var code = await quitQuiz(topic_id.toString(), _remainingTime.toString());
    if (code == 1) {

          }
  }

  void _startTimer() {
    setState(() {

    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(()  {
        if (_remainingTime > 0) {
          _remainingTime--;


        } else {
          _timer.cancel();
            quitQuiz2();
          Fluttertoast.showToast(msg: "Quiz completed");

        }
      });
    });
  }

  setDefaultColorValues() {

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
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
                onTap: () {
                  Navigator.pop(context);
                },child:

              Image.asset("assets/images/back_arrow.png", height: 20,
                width: 20,)
                ,
                //children: <Widget>[Text("fjkff")],
              ),),
            title: Text(sub_name,style: /*GoogleFonts.poppins(
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
        )
        ,
        body:
        Column(
          children: [
            Container(
              height: 30,
        color: ColorConstants.backgroundColor,
        child:Padding(padding: EdgeInsets.only(left: 10, right: 10),child:
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(sub_name,
              style: TextStyle(color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 17, fontWeight:  FontWeight.w800

                ),),
                Text(_remainingTime.toString(), style: TextStyle(color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 17, fontWeight:  FontWeight.w800
                ))
              ],
            ),),),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10,
              top:5, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)
                ,bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                /*image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),*/

              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration:
              BoxDecoration(
              color: ColorConstants.skyBlueColor,
                borderRadius: BorderRadius.circular(8.0),
               /* image: DecorationImage(

                  image: NetworkImage(payload.imageUrl as String),

                  fit: BoxFit.cover,
                )*/)
                ,
                  child:

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(

                        children: [
                          CircleAvatar(

                            backgroundColor: Colors.yellow,
                            child: Icon(
                              Icons.storage,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Padding(child:Text(" Rewards", style: TextStyle(fontWeight: FontWeight.w700),),padding: EdgeInsets.only(left: 10)),
                        ],
                      )
                      ,

                      Row(
                        children: [
                          CircleAvatar(

                              backgroundColor: Colors.yellow,
                              child: Image.asset("assets/images/question_mark.png")
                            /* child: Icon(
                          Icons.storage,
                          color: Colors.white,
                          size: 20,
                        ),*/
                          ),
                          Padding(padding: EdgeInsets.only(left: 10), child:Text((questionNO).toString()  +"/" +topicQuizData!.payload!.elementAt(0).topicQuestion.toString(),style: TextStyle(fontWeight: FontWeight.w700))),

                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(

                              backgroundColor: Colors.yellow,
                              child: Image.asset("assets/images/star.png")
                            /* child: Icon(
                          Icons.storage,
                          color: Colors.white,
                          size: 20,
                        ),*/
                          ),
                         Padding(child: Text(reward! + " points" ,style: TextStyle(fontWeight: FontWeight.w700)), padding: EdgeInsets.only(left: 10),),

                        ],
                      )


                    ],

                  ),),

                  //Text(data)
                  //Text(topicQuizData!.message),

                  SizedBox(height: 10,),
                  QuizSection(key: _buttonStateKey,payload1: topicQuizData!.payload!.elementAt(0), ),

                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 4),
                    child: ElevatedButton(
                      onPressed: () async {

                        //(String topic_id, String question_id, String user_ans
                        //submitAnswer();
                        var code = await submitAnswer(

                          //topic_id1:
                      topicQuizData!.payload.elementAt(_incre!).topicId.toString(),
                      topicQuizData!.payload.elementAt(_incre!).id.toString(),
                            _buttonStateKey.currentState?.getValue()
                        );
                        if (code == 1) {


                          _incre = (_incre! + 1)!;
                          //questionNO = (_incre!);


                          if (topicQuizData!.payload.length == _incre) {
                            userTime = (userTime! - _remainingTime)!;
                            var code = await quitQuiz(topic_id.toString(), userTime.toString());
                           //  Navigator.pop(context);
                            Fluttertoast.showToast(msg: "Quiz completed");


                            if (code == 1) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            20.0,
                                          ),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                        top: 10.0,
                                      ),
                                      title:Align(
                                        alignment:  Alignment.center,
                                        child:
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Your answer is successfully submitted',textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                          ),
                                        ),)/*Text(
                                        "Create ID",
                                        style: TextStyle(fontSize: 24.0),
                                      )*/,
                                      content: Container(
                                        height: 150,
                                        child: SingleChildScrollView(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              /*Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Mension Your ID ",
                                                ),
                                              ),*/
                                       /* Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Note'),
                                        ),*/
                                              /*Align(
                                                alignment:  Alignment.center,
                                              child:
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Your answer is successfully submitted',textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                          ),
                                        ),)*/
                                              Align(
                                                alignment:  Alignment.center,
                                                child:
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Thank You!',textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ),),   /*Container(
                                                padding: const EdgeInsets.all(8.0),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      hintText: 'Enter Id here',
                                                      labelText: 'ID'),
                                                ),
                                              ),*/
                                              Container(
                                                width: double.infinity,
                                                height: 60,
                                                padding: const EdgeInsets.all(8.0),
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    final prefs = await SharedPreferences.getInstance();
                                                    //prefs = await SharedPreferences.getInstance();

                                                    String? lang = await prefs.getString('lang');
                                                    Navigator.of(context).pop();
                                                    Navigator.pushReplacement(context,
                                                        MaterialPageRoute(builder:
                                                            (context) =>
                                                            Body2(isLogin: false, )
                                                        )
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.yellow,
                                                    // fixedSize: Size(250, 50),
                                                  ),
                                                  child: Text("Continue",
                                                    style: TextStyle(color: Colors.black),

                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          }else {
                            questionNO = (_incre! + 1)!;
                            _buttonStateKey.currentState?.setQuestion(questionNO!);
                          }
                          if (topicQuizData!.payload.length - 1 == _incre) {
                            setState(() {
                              quizComplete = true;
                            });
                          }
                          setDefaultColorValues();
                          _buttonStateKey.currentState?.setValue(topicQuizData!
                              .payload!.elementAt(_incre!));
                        }



                        /*initState() {
                          _incre = (_incre! + 1)!;

                        }*/

                        //sendAnswer();
                        /*setState(() async {
                          if (_form!.currentState!.validate()) {


                            var _email = myController.text;
                            var _password = myController1.text;
                            LoginData data = fetchAlbum(_email, _password, "login_type",context);

                          }});*/},

                      child: Text(quizComplete == true? "Submit" : "Next"),

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
                  ),
            /*Align(alignment: Alignment.bottomCenter,child:
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 4),
child: ElevatedButton(

  child: Text("Sign In"),
  onPressed: () =>

  *//*setState(() {
    if (_form!.currentState!.validate()) {
    *//*                      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  SplashScreen()))
  ,
  style: ElevatedButton.styleFrom(
    textStyle: TextStyle(fontWeight: FontWeight.w600),

    primary: Colors.yellow,
    onPrimary: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),
),),
            )*/

                ],
              ),

            )

          ],
        )
        ,
      ),
    );
  }

}