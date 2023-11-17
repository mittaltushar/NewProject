import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rama_puzle/CustomColor.dart';
import 'package:rama_puzle/PdfOpen.dart';
import 'package:rama_puzle/rapidTest.dart';
import 'package:rama_puzle/studyMaterial.dart';
import 'package:rama_puzle/studyMaterialData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HttpClient.dart';
import 'Instruction.dart';
import 'OpenDoc.dart';
import 'RewardHistoryData.dart';
import 'StudyMaterialDataList.dart';
import 'TopicData.dart';
import 'package:http/http.dart' as http;
import 'body1.dart';

class RewardHistory extends StatefulWidget {
  /*final int study_id;
  final String title;*/

  const RewardHistory({Key? key/*, required this.study_id,required this.title*/
  }) : super(key: key);


  // TODO: implement createState
  //throw UnimplementedError();
  @override
  State<RewardHistory> createState() => RewardHistory2(/*study_id: study_id, title: title*/
  );
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
class RewardHistory2 extends State<RewardHistory> {
  
  RewardHistoryData? rewardHistoryData;
  /*final int study_id;
  final String title;*/

  //int chapterCount =0  ;
  RewardHistory2({Key? key/*, required this.study_id, required this.title*/});
  /*Future<StudyMaterialData>? pdfList;
  Future<TopicList>? topicData;
  Future<StudyMaterialDataList>? studyMatList;*//*StudyMaterialDataList? studyMatList;*//*

  RewardHistory2(*//*study_id: study_id, title: title*//*
      );*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRewardsData();
    //studyMatList = getStudyMaterialList(category_id, sub_category_id!);
    //topicData = getTopicList( "$category_id", sub_category_id!);
    /*print(studyMatList);
    *//*setState(() {

    });*//*
    pdfList = getStudyMaterial(study_id.toString());*/

  }

  void getRewardsData() {
    /*rewardHistoryData = */getUserRewardHistory();
    /*setState(() {
        rewardHistoryData = rewardHistoryData;
    });*/
  }

  getUserRewardHistory() async {

    final prefs = await SharedPreferences.getInstance();
    var authToken =  prefs.getString('auth-token');
    print("authentication token is here___________$authToken");
    var headers = {
      'auth-token': '$authToken'
    };

    final response = await http.post(Uri.parse('http://www.ramapuzzle.com/api/v1/user/getMyRewardHistory'),
        /*body: {
          'topic_id': topic_id,
        },*/encoding: Encoding.getByName("utf-8"),
        headers: {'auth-token': authToken!}
    );

    RewardHistoryData quizHIstoryData = rewardHistoryDataFromJson(response.body);
    setState(() {
      rewardHistoryData = quizHIstoryData;
    });
   /* if (quizHIstoryData.code == 1) {
      Navigator.push(*/


    /*var request = http.MultipartRequest('POST',
        Uri.parse("http://www.ramapuzzle.com/api/v1/user/getMyRewardHistory"));
    *//*request.fields.addAll({
      'page': '$_pageNumber',
      'limit': '10'
    });*//*
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = RewardHistoryData.fromJson(
          jsonDecode(finalResponse));
      //final jsonResponse = DeAddictionListModel.fromJson(jsonDecode(finalResponse));

      setState(() {
        rewardHistoryData = jsonResponse;
      });*/
      //return jsonResponse;
      //print(finalResponse);
      /*setState(() {
      rewardHistoryData = jsonResponse;
    });*/

      /* for(var i=0;i< communityModel!.payload!.length;i++){
        */ /*bool isContained = comments.any((element) => element.id.toString() == getDeAddictionListData!.payload![i].id.toString());
        print("checking is valid function here ${isContained}");
        if(isContained == true){
        }
        else{
          print("working this not");
          comments.add(getDeAddictionListData!.payload![i]);
        }*/ /*
        payload15?.add(communityModel!.payload.elementAt(i));
      }
      setState(() {
        _isLastPage = payload15!.length < _numberOfPostsPerRequest;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        // _posts.addAll(_posts);
      });
    }
    else {
      print(response.reasonPhrase);
    }*/
    }


  /*getUserRewardHistory() async {


    final prefs = await SharedPreferences.getInstance();
    var authToken =  prefs.getString('auth-token');
    print("authentication token is here___________$authToken");
    var headers = {
      'auth-token': '$authToken'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse("http://www.ramapuzzle.com/api/v1/user/getMyRewardHistory"));
    *//*request.fields.addAll({
      'page': '$_pageNumber',
      'limit': '10'
    });*//*
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = RewardHistoryData.fromJson(
          jsonDecode(finalResponse));
      //final jsonResponse = DeAddictionListModel.fromJson(jsonDecode(finalResponse));

      return jsonResponse;
      print(finalResponse);
      *//*setState(() {
      rewardHistoryData = jsonResponse;
    });*//*

      *//* for(var i=0;i< communityModel!.payload!.length;i++){
        *//* *//*bool isContained = comments.any((element) => element.id.toString() == getDeAddictionListData!.payload![i].id.toString());
        print("checking is valid function here ${isContained}");
        if(isContained == true){
        }
        else{
          print("working this not");
          comments.add(getDeAddictionListData!.payload![i]);
        }*//* *//*
        payload15?.add(communityModel!.payload.elementAt(i));
      }
      setState(() {
        _isLastPage = payload15!.length < _numberOfPostsPerRequest;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        // _posts.addAll(_posts);
      });
    }
    else {
      print(response.reasonPhrase);
    }*//*
    }
  }*/

  //user/getMyRewardHistory

  /*getUserRewardHistory() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //a/wait prefs.setInt('user_id', data.payload.id);
    var string = prefs.getString('auth-token');


    int postId = prefs.getInt("user_id")!;


    var token = string;

    final response = await http.post(Uri.parse("http://www.ramapuzzle.com/api/v1/user/getMyRewardHistory"),
        encoding: Encoding.getByName("utf-8"),
        body: {
          //'user_id': postId.toString(),

        }, headers: {"auth-token": token!});
    RewardHistoryData nationalityData =

    rewardHistoryDataFromJson(response.body);
    return nationalityData;
  }*/


  @override
  Widget build(BuildContext context) {
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

            title: Text('Reward History',style:
            TextStyle(color: Colors.white, fontFamily: 'Poppins',
                fontSize: 20, fontWeight:  FontWeight.w800)

            ),
          /*GoogleFonts.poppins(
              color: Colors.white,
                fontSize: 20, fontWeight: FontWeight.w800
            )*/


          actions: [
          Padding(padding: EdgeInsets.only(left: 25),
          child:

          Icon(Icons.ac_unit),)

          /*child: DropdownButtonHideUnderline(
          //child: Expanded(
          child: Image.asset(
            "assets/images/back_arrow.png", height: 20,
            width: 20,),)*/
            ],
        ),
        body:

        Column(
          children: <Widget>[
            /*Container(child:
            Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(left: 10),
                child:
                Text(sub_name!, textAlign: TextAlign.left,
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

            Container(
              margin: EdgeInsets.only(right:10.0, top: 20),
        height:   MediaQuery.of(context).size.height * .8444,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                /*image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),*/

              ),

              child:
/*
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 30),
                height:   MediaQuery.of(context).size.height * .8144,*/
              SafeArea(

                child:Padding(padding:const EdgeInsets.all(10.0),
              child:
              Column(
                children:[
                  Padding(padding: EdgeInsets.only(left: 10),child:
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Text("Recent Activities",textAlign: TextAlign.left,
                        style:
                        TextStyle(color: ColorConstants.backgroundColor, fontFamily: 'Poppins',
                            fontSize: 20, fontWeight:  FontWeight.w600)
                    )
                    /*GoogleFonts.poppins(color: Colors.black,
                              fontSize: 18, fontWeight: FontWeight.w800
                          )*/,),),

                  /*Container(
                    margin: EdgeInsets.only(top: 10,bottom: 30),
                    height:   MediaQuery.of(context).size.height * .8144,
                    child:*/

                  Expanded(

                    child:

                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 20),
                      scrollDirection: Axis.vertical,
                      itemCount:  rewardHistoryData?.payload.length != null ? rewardHistoryData?.payload.length: 0,
                      itemBuilder: (context, index) {

                        return
                          //SizedBox.shrink();
//Text("data");
                          // RewardDisplay3( recentQuiz: snapshot.data!.payload.recentQuiz[index]);



                          InkWell(
                            onTap: () {
                             // var topicId = rewards2?.payload.recentQuiz[index].topicId;
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizGrid()));
                             /* Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => quizHistory2(rewards2!.payload.recentQuiz[index].topicId.toString(), context,rewards2!.payload.recentQuiz[index].topicName) *//*StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, ,
                                        reward:rewards2?.payload.recentQuiz[index].reward)*//*));
*/
                            },
                            child:
                            Padding(padding: EdgeInsets.only( left: 20,right: 0, top: 5, bottom: 5),child:
                            Container(
                              height: 60,
                              width: 300,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(8.0),),
                              child:

                                  Column(children :[

                                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.remove_red_eye_rounded,color: Colors.yellow,),
                                Padding(
                                  padding:EdgeInsets.only( left: 20,right: 10, top: 5, bottom: 5),
                                child:
                                    Padding(
                                      padding:EdgeInsets.only(right: 100),
                                      child:
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(rewardHistoryData!.payload[index].title,

                                      style: TextStyle(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w800),
                                      ),
                                      Text(rewardHistoryData!.payload[index].createdAt,
                                          style: TextStyle(color: Colors.grey
                                      ))
                                    ]
                                ),),),
                                Padding(padding:
                                    EdgeInsets.only(left: 0),
                                    child:
                                    Text(rewardHistoryData!.payload[index].reward,
                                        style: TextStyle(color: Colors.red),
                                        /*style: TextStyle(

                                        )*/
                                    )
                                ),
                                ]),
                                    Padding(
                                      padding:EdgeInsets.only(left:15),
                                      child:Container(
                                        height:1.0,
                                        width:340.0,
                                        color:Colors.grey,),)
                                  ])
                              /*Row(
                                  *//*mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,*//*
                                  children: [

                                Row(children: [


                                Align(alignment: Alignment.topLeft,
                                child: 
                               ,),]),


                                *//*Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 5),child:
                                AutoSizeText(
                                  group: myGroup,

                                  formatHtmlString(rewards2!.payload.recentQuiz[index].topicName)
                                  ,
                                  style: TextStyle(fontSize: 5, color: ColorConstants.backgroundColor, fontWeight: FontWeight.w500),
                                  maxLines: 2,
                                ),)*//*

                                *//*Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 5),child:
                                Align(child: AutoSizeText(
                                  group: myGroup,
                                  "Question " + rewards2!.payload.recentQuiz[index].totalQuestion.toString()
                                  ,
                                  style: TextStyle(fontSize: 10, color: Colors.grey),
                                  maxLines: 2,
                                ),alignment: Alignment.topLeft),)*//*
                              ]),*/


                            ),),);},),)]),),),)],),),);}}

                  /*Container(
                    margin: EdgeInsets.only(top: 10),
                    height:   MediaQuery.of(context).size.height * .7366,
                    child:

                    FutureBuilder<StudyMaterialData>(
                      future: pdfList,
                      builder: (context, snapshot) {

                        return
                          //Text("ab")
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount:  snapshot.data?.payload.length,
                              itemBuilder:
                                  (context, index) {
                                //chapterCount = studyMatList.data?.payload.length as int;
                                return
                                  InkWell(
                                    onTap: () {

                                      //var topicId = snapshot.data?.payload[index].id;
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizGrid()));
                                      if (snapshot.data!.payload[index].postType == "DOC")

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>
                                            *//*StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description,
                                                    reward:snapshot.data?.payload[index].reward)*//*
                                            *//*Instruction(description: snapshot.data!.payload[index].description,sub_name: snapshot.data!.payload[index].title, topic_id: snapshot.data!.payload[index].id,
                                            sub_category_id: snapshot.data!.payload[index].id.toString(),category_id: 0, reward: snapshot.data!.payload[index].amount.toString(),loc: 1,)*//*

                                            OpenDoc(pdf: snapshot.data!.payload[index].postUrl)
                                            ));

                                      else
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>
                                            *//*StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description,
                                                    reward:snapshot.data?.payload[index].reward)*//*
                                            *//*Instruction(description: snapshot.data!.payload[index].description,sub_name: snapshot.data!.payload[index].title, topic_id: snapshot.data!.payload[index].id,
                                            sub_category_id: snapshot.data!.payload[index].id.toString(),category_id: 0, reward: snapshot.data!.payload[index].amount.toString(),loc: 1,)*//*

                                            PdfOpen(pdf: snapshot.data!.payload[index].postUrl)
                                            ));


                                      //StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description, )));
                                      *//*    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()));*//*
                                    },
                                    child:
                                    Padding(padding: EdgeInsets.only( left: 20,right: 10, top: 5, bottom: 5),child:
                                    Container(
                                        height: 50,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: ColorConstants.skyBlueColor,
                                          borderRadius: BorderRadius.circular(8.0),),
                                        child: Column(children: [
                                          Padding(
                                            padding:EdgeInsets.fromLTRB(20, 0, 10, 0),child:
                                          Container(
                                            height: 40,
                                            child:
                                            Align(alignment: Alignment.centerLeft,child:
                                            Text(formatHtmlString(snapshot.data!.payload[index].title as String),
                                              style:
                                              TextStyle(color: ColorConstants.backgroundColor, fontFamily: 'Poppins',
                                                  fontSize: 16, fontWeight:  FontWeight.w700)


                                              *//*GoogleFonts.poppins(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w700, fontSize: 16)*//*,)),),)
                                        ],)
                                    ),

                                    ),);});},),)*/

 /* @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }*/

/*     image: DecorationImage(

                                image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl! as String),

                                fit: BoxFit.cover,


                              }

                          )*/



/*child: FutureBuilder<>,
                  future: ,*/
/*builder: (context, snapshot) {
                    return ListView.builder(scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.payload.latestQuiz.length,
                        itemBuilder: (Context, index) {

                        })
                  }*/
/*child:Padding(padding: EdgeInsets.only(top:10),child:
                  Text('Latest Quiz' ,
                      style: GoogleFonts.poppins(
                          fontSize: 17, fontWeight: FontWeight.w800
                      )
                    *//*style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )*//*),)*/



/*style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )*/



/*],
          ),
        )
    );
    throw UnimplementedError();
  }

}*/