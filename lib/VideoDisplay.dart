import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rama_puzle/CustomColor.dart';
import 'package:rama_puzle/studyMaterial.dart';
import 'package:rama_puzle/videoTopic.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'HttpClient.dart';
import 'TopicData.dart';
import 'VideoListView.dart';
import 'VideoMaterialData.dart';
import 'body1.dart';

class VideoDisplay extends StatefulWidget {
  final int category_id;
  final String? sub_category_id;
  final String? sub_name;
  const VideoDisplay({Key? key, required this.category_id, required this.sub_category_id
    , required this.sub_name
  }) : super(key: key);


  // TODO: implement createState
  //throw UnimplementedError();
  @override
  State<VideoDisplay> createState() => VideoChapter1(category_id: category_id, sub_category_id: sub_category_id,
      sub_name: sub_name
  );
}

class VideoChapter1 extends State<VideoDisplay> {
  final int category_id;
  final String? sub_category_id;
  final String? sub_name;
  int chapterCount =0  ;
  VideoChapter1({Key? key, required this.category_id, required this.sub_category_id, required this.sub_name});
  SharedPreferences? prefs;
  Future<TopicList>? topicData;
  Future<VideoTopic>? videoData;
  VideoMaterialData? videoTopic;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //topicData = getTopicList( "$category_id", sub_category_id!);
    videoData = getVideoTopic("1", "10");
    //print(videoData);
        getVideo("1");

  }

  getVideo(String video_topic) async {
    final encoding = Encoding.getByName("utf-8");
    var res = await http.post(Uri.parse(videoMaterial), encoding: encoding,
        body:{
          'video_topic_id' : video_topic,

        });
    //Iterable list = json.decode(res.body);
    print("abc");
    videoTopic = VideoMaterialData.fromJson(json.decode(res.body));

    print( videoTopic?.payload.elementAt(0).createdTime);
    /*setState(() {

    });*/
    //return videoTopic;
  }
  @override
  Widget build(BuildContext context) {
    SharedPreferences prefs;
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

          leading:
          GestureDetector(
            onTap: () async {

              prefs = await SharedPreferences.getInstance();
              //prefs = await SharedPreferences.getInstance();

              String? lang = await prefs.getString('lang');
              /*prefs = await SharedPreferences.getInstance();

            String? lang = await prefs.getString('lang');*/
          //getBack();
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Body2(isLogin: false)));
    },child:

    /*Image.asset("assets/images/back_arrow.png", height: 20,
      width: 20,)*/

      //children: <Widget>[Text("fjkff")],


          /*InkWell(onTap: () => *//*Navigator.pop(context)*//*
          {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
          Body2(isLogin: false,)))
          },
          *//*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>

                  *//**//*VideoDisplay(category_id: 0,
                    sub_category_id: "", sub_name: "",)*//**//*),)*//*)*/
         /* MaterialPageRoute(builder:
              (context) =>
              Body2(isLogin: false,)
          )*/

          Padding(padding: EdgeInsets.only(left: 10),
            child:
            Image.asset(
              "assets/images/back_arrow.png", height: 10,
              width: 10,),),),
          title:
          Text('Video'/*videoTopic?.message as String*/,style: /*GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20, fontWeight: FontWeight.w800
          ),
*/

          TextStyle(color: Colors.white, fontFamily: 'Poppins',
              fontSize: 20, fontWeight:  FontWeight.w800)
          ),
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

            WillPopScope(
    onWillPop: () async {
    //Navigator.pop(context);
    //getBack();
    print("abc");
    final prefs = await SharedPreferences.getInstance();

    String? lang = await prefs.getString('lang');
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Body2(isLogin: false)));
    return false;
    },child:
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
                  style: GoogleFonts.poppins(color: Colors.white,
                      fontSize: 20, fontWeight: FontWeight.w800
                  ),),),),),
            *//*style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )*//*
            Align(
              alignment: Alignment.topLeft,
              child:
              Padding(padding: EdgeInsets.only(left: 10),child:
              Text("$chapterCount" + " " + "chapters",textAlign: TextAlign.left,
                style: GoogleFonts.poppins(color: Colors.white,
                    fontSize: 14, fontWeight: FontWeight.w800
                ),),),),

            */Container(

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
                  Wrap(children: [

              Column(
                children:[
                  /*Padding(padding: EdgeInsets.only(left: 10),child:
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Text("Chapters",textAlign: TextAlign.left,

                      style: GoogleFonts.poppins(color: Colors.black,
                          fontSize: 18, fontWeight: FontWeight.w800
                      ),),),),*/


                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height:   MediaQuery.of(context).size.height * .8366,
                    child:

                    FutureBuilder<VideoTopic>(
                        future: videoData/*getTopicList( "$category_id", sub_category_id!)*/,
                        builder: (context, snapshot) {

                          return
                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:  snapshot.data?.payload?.length,
                                itemBuilder:
                                    (context, index) {
                                  //chapterCount = snapshot.data?.payload.length as int;
                                  return
                                    InkWell(
                                      onTap: () {


                                        /*Future<VideoMaterialData> *//*getVideoMaterial(String video_topic_id1) async {
                                          final encoding = Encoding.getByName("utf-8");
                                          var res = await http.post(Uri.parse(videoMaterial), encoding: encoding,
                                              body:{
                                                'video_topic_id' : video_topic_id1,

                                              });
                                          *//*VideoMaterialData *//*videoTopic = VideoMaterialData.fromJson(json.decode(res.body));

                                          print( videoTopic);
                                          setState(() {

                                          });
                                          //return videoTopic;
                                        }*/
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizGrid()));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  VideoViewInList(category_id: 0,sub_category_id: '',sub_name: '',
                                        video_topic_id: snapshot.data?.payload![index].id.toString(),),),);/*StudyMaterial(category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description, ))*/

                                        /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()));*/
                                      },
                                      child:Center(child:
                                      Padding(padding: EdgeInsets.only( left: 20,right: 10, top: 5, bottom: 5),child:
                                          Center(child:
                                      Container(
                                          alignment: Alignment.center,

                                          /*height: ,
                                width: 350,*/
                                          decoration: BoxDecoration(
                                            color: ColorConstants.skyBlueColor,
                                            borderRadius: BorderRadius.circular(8.0),),
                                          child: Column(children: [
                                            Padding(
                                              padding:EdgeInsets.fromLTRB(20, 0, 10, 0),child:
                                                Center(child:
                                            Container(
                                              alignment: Alignment.center,

                                              height: 80,
                                              child:
                                                  Align(alignment: Alignment.center, child:Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [

                                                    Align(alignment: Alignment.centerLeft,child:
                                                    Text(snapshot.data?.payload?[index].title as String,/*textAlign: TextAlign.center*/
                                                      style:
                                                      TextStyle(color: ColorConstants.backgroundColor, fontFamily: 'Poppins',
                                                          fontSize: 16, fontWeight:  FontWeight.w700),
                                                      /*GoogleFonts.poppins(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w700, fontSize: 16)*/)),
                                                    Align(alignment: Alignment.centerLeft,child:
                                                    Text('No of videos  ' + (snapshot.data?.payload?[index].noOfVideos.toString() as String),
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      TextStyle(color: ColorConstants.backgroundColor, fontFamily: 'Poppins',
                                                          fontSize: 14, fontWeight:  FontWeight.w500)
                                                      /*GoogleFonts.poppins(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w500, fontSize: 14)*/,))
                                                  ],
                                              ),),),),)
                                          ],)
                                      ),),

                                      ),),);});}),),],),],)),],),),),);}}

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