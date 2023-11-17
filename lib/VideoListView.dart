import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rama_puzle/CustomColor.dart';
import 'package:rama_puzle/playVideo.dart';
import 'package:rama_puzle/studyMaterial.dart';
import 'package:rama_puzle/videoPlayer.dart';
import 'package:rama_puzle/videoTopic.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'HttpClient.dart';
import 'TopicData.dart';
import 'VideoMaterialData.dart';
import 'ViewComments.dart';

class VideoViewInList extends StatefulWidget {
  final int category_id;
  final String? sub_category_id;
  final String? sub_name;
  final String? video_topic_id;
  const VideoViewInList({Key? key, required this.category_id, required this.sub_category_id
    , required this.sub_name, required this.video_topic_id
  }) : super(key: key);


  // TODO: implement createState
  //throw UnimplementedError();
  @override
  State<VideoViewInList> createState() =>

      VideoViewInListNext(category_id: category_id, sub_category_id: sub_category_id,
      sub_name: sub_name,video_topic_id: video_topic_id
  );
}

class VideoViewInListNext extends State<VideoViewInList> {
  late final int category_id;
  late final String? sub_category_id;
  late final String? sub_name;
  late final String? video_topic_id;
  int chapterCount =0  ;
  VideoViewInListNext({Key? key, required this.category_id, required this.sub_category_id, required this.sub_name
  ,required this.video_topic_id });

  Future<TopicList>? topicData;
  Future<VideoTopic>? videoData;
  Future<VideoMaterialData>? videoMatData;
  VideoMaterialData? videoTopic;
  int? length;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //topicData = getTopicList( "$category_id", sub_category_id!);
    //videoData = getVideoTopic("1", "10");
    /*videoMatData = */getVideoMaterial(video_topic_id!);
    print(videoMatData);
  }

  /*Future<VideoMaterialData> */getVideoMaterial(String video_topic_id1) async {
    final encoding = Encoding.getByName("utf-8");
    var res = await http.post(Uri.parse(videoMaterial), encoding: encoding,
        body:{
          'video_topic_id' : video_topic_id1,

        });
    /*VideoMaterialData */videoTopic = VideoMaterialData.fromJson(json.decode(res.body));

    print( videoTopic?.payload.elementAt(0).createdTime);
    length = videoTopic?.payload.length;
    setState(() {

    });
    //return videoTopic;
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
    return MaterialApp(
      home:
      Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConstants.greyShad,
          centerTitle: true,
          leadingWidth: 30,

          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child:Padding(padding: EdgeInsets.only(left: 10),
            child:

            Image.asset(
              "assets/images/back_arrow.png", height: 10,
              width: 10,),),),
          title: Text('Video',/*style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20, fontWeight: FontWeight.w800
          ),*/style:
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

        /*Column(
          children: <Widget>[*/
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

            */




            Container(
              height:   MediaQuery.of(context).size.height * .8366,
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
              /*Column(
                children:[*/


                  /*Container(
                    margin: EdgeInsets.only(top: 10),
                    height:   MediaQuery.of(context).size.height * .8366,
                    child:*/
/*
                    FutureBuilder<VideoMaterialData>(
                        future: videoMatData*//*getTopicList( "$category_id", sub_category_id!)*//*,
                        builder: (context, snapshot) {

                          return*/
                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:  /*snapshot.data?.payload?*/videoTopic?.payload.length,
                                itemBuilder:
                                    (context, index) {
                                  //chapterCount = snapshot.data?.payload.length as int;
                                  return
                                    InkWell(
                                      onTap: () {

                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizGrid()));
                                        /*Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  StudyMaterial(category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description, )));
*/

                                        getVideoData(video_topic_id!, videoTopic?.payload[index].id.toString() as String, context);
                                        /*Navigator.push(
                                                    context,
                                            MaterialPageRoute(builder: (context) => *//*CommunitySection1()*//*PlayVideo(video_topic_id: video_topic_id!,  video_id: snapshot.data?.payload[index].id.toString() as String,)));*/
                                      },
                                      child:
                                      Expanded(child:Padding(padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                                      child: Column(children: [
                                        Row(children: [
                                          Image.asset('assets/images/contact_us.png',height: 40, width: 40),
                                          //Padding(padding: ////EdgeInsets.)
                                          Expanded(child:Column(children: [
                                            Container(

                                          child:
                                            Align(alignment: Alignment.centerLeft,child:Text(
                                                style:
                                                TextStyle(color: ColorConstants.backgroundColor, fontFamily: 'Poppins',
                                                    fontSize: 16, fontWeight:  FontWeight.w700),
                                                formatHtmlString(videoTopic!.payload[index].title as String)))),

                                            Row(children: [
                                                Text(videoTopic!.payload[index].createdTime as String),
                                              /*GestureDetector(onTap:() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>
                                                  // ViewAllCommentsBody(post_Id:  snapshot?.data!.payload[index].id.toString() )
                                                  *//*Comment6()*//*
                                                  ViewComments(post_Id: snapshot?.data!.payload[index].id.toString()),));},*/

                                              ]
                                              ,),
                                            //Align(alignment: Alignment.topLeft,child: Text(snapshot.data?.payload[index].createdTime as String))
                                          ],),)
                                        ],),
                                        Padding(padding: EdgeInsets.only(top: 10),child:SizedBox(width: double.infinity,child:
                                        Divider(height: 1,)),)
                                      ]),),),);},),),),);}}

 /*                                     Center(child:
                                      Padding(padding: EdgeInsets.only( left: 20,right: 10, top: 5, bottom: 5),child:
                                      Center(child:
                                      Container(
                                          alignment: Alignment.center,

                                          height: ,
                                width: 350,
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
                                                  Text(snapshot.data?.payload?[index].title as String,textAlign: TextAlign.center,
                                                    style: GoogleFonts.poppins(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w700, fontSize: 16),)),
                                                  Align(alignment: Alignment.centerLeft,child:
                                                  Text('concepts  ' + (snapshot.data?.payload?[index].noOfVideos.toString() as String),
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.poppins(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w500, fontSize: 14),))
                                                ],
                                              ),),),),)
                                          ],)
                                      ),),

                                      ),),);});}),),],),),],),),);}}
*/
  /*   image: DecorationImage(

                                image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl! as String),

                                fit: BoxFit.cover,


                              }

                          )
*/


/*
child: FutureBuilder<>,
                  future: ,
builder: (context, snapshot) {
                    return ListView.builder(scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.payload.latestQuiz.length,
                        itemBuilder: (Context, index) {

                        })
                  }
child:Padding(padding: EdgeInsets.only(top:10),child:
                  Text('Latest Quiz' ,
                      style: GoogleFonts.poppins(
                          fontSize: 17, fontWeight: FontWeight.w800
                      )
                    style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )),)



style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )



],
          ),
        )
    );
    throw UnimplementedError();
  }

}*/
