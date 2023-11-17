
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rama_puzle/HttpClient.dart';
import 'package:rama_puzle/quizHistoryData.dart';
import 'package:rama_puzle/rewardHistory.dart';
import 'package:rama_puzle/splash_screen.dart';
import 'package:rama_puzle/topicQuizData.dart';

import 'CustomColor.dart';
import 'body1.dart';



class startQuiz20 extends StatefulWidget {
  QuizHIstoryData data1;
  String name;

  startQuiz20(
      {Key? key, required this.data1, required this.name})  : super(key: key);

      /*{Key? key, required this.category_id, required this.sub_category_id
    , required this.sub_name, required this.description
  })   : super(key: key);
*/
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return startQuiz30(data: data1, name:name);
  }

}

class QuizSection20 extends StatefulWidget {

  //QuizSection({GlobalKey key}) : super(key: key);

  /* @override
  LetterButtonState createState() => LetterButtonState();*/
  Payload payload1;


  QuizSection20({GlobalKey? key, required this.payload1}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    //throw UnimplementedError();
    return QuizSection30(payload: payload1);
  }

}

class QuizSection30 extends State {
  Payload payload;


  QuizSection30({Key? key, required this.payload});



  setValue(Payload value) {
    setState(() {
      this.payload = value;

    });
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
    Payload payload0 = payload;
    return

      Container(
        height: 400,
        child:

        Column(

            children: [
              Padding(padding: EdgeInsets.only(left: 10, right: 10),
          child:
              Text(formatHtmlString(payload.question))),

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
                  color: (payload.userAnswer == "a") ? (payload.userAnswer == payload.answer)?
                  ColorConstants.greenColor: Colors.red:(payload.answer == "a")?
                  ColorConstants.greenColor: Colors.white,
                  /*color: (colorIndex == 0) ? ColorConstants.greenColor : Colors.white,*/
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
                  /*colorIndex = 1;
                  answer = 'b';*/
                });

              },child:
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                  color: (payload.userAnswer == "b") ? (payload.userAnswer == payload.answer)?
                  ColorConstants.greenColor: Colors.red:(payload.answer == "b")?
                  ColorConstants.greenColor: Colors.white,

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
                   // color: (colorIndex == 2) ? ColorConstants.greenColor : Colors.white ,
                    color: (payload.userAnswer == "c") ? (payload.userAnswer == payload.answer)?
                    ColorConstants.greenColor: Colors.red:(payload.answer == "c")?
                    ColorConstants.greenColor: Colors.white,
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
                   /* colorIndex = 3;
                    answer = 'd';*/
                  });
                },
                child:
                Container(
                    width: 350,
                    height: 35,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: (payload.userAnswer == "d") ? (payload.userAnswer == payload.answer)?
                      ColorConstants.greenColor: Colors.red:(payload.answer == "d")?
                      ColorConstants.greenColor: Colors.white,
                      //color: (colorIndex == 3) ? ColorConstants.greenColor : Colors.white,
                      /*color: (payload.userAnswer == "d") ? (payload.userAnswer == payload.answer)?
                      ColorConstants.greenColor: Colors.red:Colors.white ,*/
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



class startQuiz30 extends State {

  QuizHIstoryData data;

  int? _incre= 0;
  String? name;


  GlobalKey<QuizSection30> _buttonStateKey = GlobalKey();


  startQuiz30(
      {Key? key, required this.data, required this.name}
      /*{Key? key, required this.category_id, required this.sub_category_id
    , required this.sub_name, required this.description
  }*/);


  @override
  initState() {
    // TODO: implement initState
    super.initState();
    //getTopicQuizData();

    //topicData = getTopicList( "$category_id", sub_category_id!);
  }

  /*getTopicQuizData() async {
    TopicQuizData data = await getTopicQuiz(topic_id.toString());

    setState(() {
      topicQuizData = data;
      _remainingTime = data.payload[0].topicTime;
    });
    _startTimer();
  }*/

  /*quitQuiz2() async {
    var code = await quitQuiz(topic_id.toString(), _remainingTime.toString());
    if (code == 1) {

    }
  }*/

  /*void _startTimer() {
    setState(() {

    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(()  {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          quitQuiz2();

        }
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child:
    MaterialApp(
        debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        Widget error = const Text('    ', style: TextStyle(color: Colors.white),);
        //Widget error = Container(decoration: ,);
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw ('widget is null');
      },
      home: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
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
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Body2(isLogin: false)));*/
                },child:

              Image.asset("assets/images/back_arrow.png", height: 20,
                width: 20,)
                ,
                //children: <Widget>[Text("fjkff")],
              ),),
            title: Text(name!,style: /*GoogleFonts.poppins(
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
            /*Container(
              height: 30,
              color: ColorConstants.backgroundColor,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("",
                    style: TextStyle(color: ColorConstants.backgroundColor,
                        fontFamily: 'Poppins',
                        fontSize: 17, fontWeight:  FontWeight.w800

                    ),),
                  Text("", style: TextStyle(color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 17, fontWeight:  FontWeight.w800
                  ))
                ],
              ),)*/
            Container(
height:  MediaQuery.of(context).size.height * .8144,
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
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
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
                        InkWell(onTap: () {

                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (
                                    context) => /*Body2(isLogin: true)*/RewardHistory()));

                        },child:
                        Row(children:[
                        CircleAvatar(

                          backgroundColor: Colors.yellow,
                          child: Icon(
                            Icons.storage,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Text("Reward"),]),),
                        CircleAvatar(

                            backgroundColor: Colors.yellow,
                            child: Image.asset("assets/images/question_mark.png")
                          /* child: Icon(
                          Icons.storage,
                          color: Colors.white,
                          size: 20,
                        ),*/
                        ),
                        Text("1/10"),
                        CircleAvatar(

                            backgroundColor: Colors.yellow,
                            child: Image.asset("assets/images/star.png")
                          /* child: Icon(
                          Icons.storage,
                          color: Colors.white,
                          size: 20,
                        ),*/
                        ),
                        Text("3 points"),

                      ],

                    ),),

                  //Text(data)
                  //Text(topicQuizData!.message),

                  SizedBox(height: 10,),
                  QuizSection20(key: _buttonStateKey,payload1: data!.payload!.elementAt(0), ),

                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 4),
                    child: ElevatedButton(
                      onPressed: () async {

                        //(String topic_id, String question_id, String user_ans
                        //submitAnswer();
                        /*var code = await submitAnswer(

                          //topic_id1:
                            topicQuizData!.payload.elementAt(_incre!).topicId.toString(),
                            topicQuizData!.payload.elementAt(_incre!).id.toString(),
                            _buttonStateKey.currentState?.getValue()
                        );*/
                      /*  if (code == 1) {
                          _incre = (_incre! + 1)!;
                          if (topicQuizData!.payload.length == _incre) {
                            var code = await quitQuiz(topic_id.toString(), _remainingTime.toString());
                            if (code == 1) {

                            }
                          }*/
                        _incre = (_incre! + 1)!;
                          _buttonStateKey.currentState?.setValue(data
                              .payload!.elementAt(_incre!));




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
    ),);
  }

}