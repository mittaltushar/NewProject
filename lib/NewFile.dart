import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rama_puzle/CustomColor.dart';
import 'package:rama_puzle/rewardHistory.dart';
import 'package:rama_puzle/sign_up.dart';
import 'package:rama_puzle/studyMaterial.dart';

import 'HttpClient.dart';
import 'RewardsData.dart';
import 'TopicData.dart';
import 'body1.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewFile extends StatefulWidget {

  const NewFile({Key? key
  }) : super(key: key);


  // TODO: implement createState
  //throw UnimplementedError();
  @override
  State<NewFile> createState() => NewFile2(
  );
}

class NewFile2 extends State<NewFile> {
/*  final int category_id;
  final String? sub_category_id;
  final String? sub_name;*/
  int chapterCount =0  ;
  Rewards? rewards2;
  NewFile2({Key? key});

  Future<TopicList>? topicData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRewardHistory();
    //topicData = getTopicList( "$category_id", sub_category_id!);

  }

  getRewardHistory() async{
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;
    var res = await http.post(Uri.parse(rewardHistoy), body: {
      "page" : "1",
      "limit" : "10"
    }, headers: {"auth-token": token!});

    /*final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

  var token = string;
  final response = await http.post(Uri.parse(topicQuiz),
      encoding: Encoding.getByName("utf-8"),
      headers: {"auth-token": token!},
      body: {

        'topic_id': topic_id,
        *//* 'password' : password,
         'login_type' : 'E',
         'device_type': 'A',
         'device_token': 'fjksf'*//*
      }
  );*/
    Rewards rewards = rewardsFromJson(res.body);
    setState(() {
      rewards2 = rewards;
      //isVisibleList = List.generate(rewards2!.payload.recentQuiz.length, (index) => false);
      //isVisibleList = List.generate(rewards2!.payload.recentQuiz.length, (index) => false);
    });
    //return rewards;

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
    int? totalRewards = 0;
    int? itemLenght = 0;
    var myGroup = AutoSizeGroup();
    if (rewards2 != null){
      totalRewards = rewards2?.payload.totalRewards;
      itemLenght = rewards2?.payload.recentQuiz.length;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConstants.backgroundColor,
          centerTitle: true,
          leadingWidth: 30,

          leading:  Container(
              margin: EdgeInsets.only(left: 10),
              child:
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Body2(isLogin: false)));*/
                },child:

              Image.asset("assets/images/back_arrow.png", height: 20,
                width: 20,)
                ,
                //children: <Widget>[Text("fjkff")],
              )
          ),

          title: Text("Rewards"!,style:
          TextStyle(color: Colors.white, fontFamily: 'Poppins',
              fontSize: 15, fontWeight:  FontWeight.w800)

          )
          /*GoogleFonts.poppins(
              color: Colors.white,
                fontSize: 20, fontWeight: FontWeight.w800
            )*/,


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

            Wrap(children: [
        Column(
          children: <Widget>[
            /*Container(child:
            Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(left: 10),
                child:
                Text("Tests", textAlign: TextAlign.left,
                    style: *//*GoogleFonts.poppins(color: Colors.white,
                      fontSize: 20, fontWeight: FontWeight.w800
                  )*//*TextStyle(color: Colors.white, fontFamily: 'Poppins',
                        fontSize: 20, fontWeight:  FontWeight.w800)

                ),),),),*/
            /*style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )*/
            /*Align(
                alignment: Alignment.topLeft,
                child:
                    Padding(padding: EdgeInsets.only(left: 10),child:
              Text("$chapterCount" + " " + "chapters",textAlign: TextAlign.left,
                  style:
                  TextStyle(color: Colors.white, fontFamily: 'Poppins',
                      fontSize: 14, fontWeight:  FontWeight.w800)

              )
                *//*GoogleFonts.poppins(color: Colors.white,
                      fontSize: 14, fontWeight: FontWeight.w800
                  )*//*,),)*/
            Column(
              children: [
            Padding(padding: EdgeInsets.only(top: 40),child:
                Text("YOUR BALANCE", style: TextStyle(color: Colors.white, fontFamily: 'Poppins',
                    fontSize: 10, fontWeight:  FontWeight.w400), ),),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 30),child:
                InkWell(onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (
                          context) => /*Body2(isLogin: true)*/RewardHistory()));
                },child:
                Text(rewards2!.payload.totalRewards.toString() + " POINTS", style: TextStyle(color: Colors.white, fontFamily: 'Poppins',
                    fontSize: 20, fontWeight:  FontWeight.w800)),),)
              ],
            ),

            Container(
              margin: EdgeInsets.only(right:10.0, top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                /*image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),*/

              ),

              child:
              Column(
                children:[
                  Padding(padding: EdgeInsets.only(left: 10),child:
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Text("My Quizzes",textAlign: TextAlign.left,
                        style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins',
                            fontSize: 20, fontWeight:  FontWeight.w800)

                    )
                    /*GoogleFonts.poppins(color: Colors.black,
                              fontSize: 18, fontWeight: FontWeight.w800
                          )*/,),),


                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 30),
                    height:   MediaQuery.of(context).size.height * .8144,
                    child:


                    ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 20),
                        scrollDirection: Axis.vertical,
                        itemCount:  itemLenght != 0 ? itemLenght: 0,
                        itemBuilder: (context, index) {

                          return
                            //SizedBox.shrink();
//Text("data");
                            // RewardDisplay3( recentQuiz: snapshot.data!.payload.recentQuiz[index]);

                            InkWell(
                              onTap: () {
                                var topicId = rewards2?.payload.recentQuiz[index].topicId;
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizGrid()));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => quizHistory2(rewards2!.payload.recentQuiz[index].topicId.toString(), context,rewards2!.payload.recentQuiz[index].topicName) /*StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, ,
                                        reward:rewards2?.payload.recentQuiz[index].reward)*/));


                              },
                              child:
                              Padding(padding: EdgeInsets.only( left: 20,right: 10, top: 5, bottom: 5),child:
                              Container(
                                height: 60,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: ColorConstants.skyBlueColor,
                                  borderRadius: BorderRadius.circular(8.0),),
                                child:

                                    Column(children: [

                                      Padding(padding: EdgeInsets.only(left: 10, top: 5),child:
                                          Align(alignment: Alignment.topLeft,
                                      child:
                                      AutoSizeText(
                                        group: myGroup,

                                        formatHtmlString(rewards2!.payload.recentQuiz[index].topicName)
                                        ,
                                        style: TextStyle(fontSize: 5, color: ColorConstants.backgroundColor, fontWeight: FontWeight.w500),
                                        maxLines: 2,
                                      ),),),
                                Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 5),child:
                                Align(child: AutoSizeText(
                                        group: myGroup,
                                        /*"Question " +*/ rewards2!.payload.recentQuiz[index].createdTime
                                        ,
                                        style: TextStyle(fontSize: 10, color: Colors.grey),
                                        maxLines: 2,
                                      ),alignment: Alignment.topLeft),)
                                    ],),),),);},),)],),)],),]),),);}}




