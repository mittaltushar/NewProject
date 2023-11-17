import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rama_puzle/CustomColor.dart';
import 'package:rama_puzle/studyMaterial.dart';

import 'HttpClient.dart';
import 'TopicData.dart';
import 'body1.dart';

class QuizChapter extends StatefulWidget {
  final int category_id;
  final String? sub_category_id;
  final String? sub_name;
  const QuizChapter({Key? key, required this.category_id, required this.sub_category_id
    , required this.sub_name
  }) : super(key: key);


  // TODO: implement createState
  //throw UnimplementedError();
  @override
  State<QuizChapter> createState() => QuizChapter1(category_id: category_id, sub_category_id: sub_category_id,
      sub_name: sub_name
  );
}

class QuizChapter1 extends State<QuizChapter> {
  final int category_id;
  final String? sub_category_id;
  final String? sub_name;
  int chapterCount =0  ;
  QuizChapter1({Key? key, required this.category_id, required this.sub_category_id, required this.sub_name});

  Future<TopicList>? topicData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topicData = getTopicList( "$category_id", sub_category_id!);

  }

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

          title: Text(sub_name!,style:
          TextStyle(color: Colors.white, fontFamily: 'Poppins',
              fontSize: 20, fontWeight:  FontWeight.w800)

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

        Column(
          children: <Widget>[
            Container(child:
            Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: EdgeInsets.only(left: 10),
                child:
                Text(sub_name!, textAlign: TextAlign.left,
                    style: /*GoogleFonts.poppins(color: Colors.white,
                      fontSize: 20, fontWeight: FontWeight.w800
                  )*/TextStyle(color: Colors.white, fontFamily: 'Poppins',
                        fontSize: 20, fontWeight:  FontWeight.w800)

                ),),),),
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
                    Text("Chapters",textAlign: TextAlign.left,
                        style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins',
                            fontSize: 20, fontWeight:  FontWeight.w800)

                    )
                    /*GoogleFonts.poppins(color: Colors.black,
                              fontSize: 18, fontWeight: FontWeight.w800
                          )*/,),),


                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height:   MediaQuery.of(context).size.height * .7366,
                    child:

                    FutureBuilder<TopicList>(
                        future: topicData/*getTopicList( "$category_id", sub_category_id!)*/,
                        builder: (context, snapshot) {

                          return
                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:  snapshot.data?.payload.length,
                                itemBuilder:
                                    (context, index) {
                                  chapterCount = snapshot.data?.payload.length as int;
                                  return
                                    InkWell(
                                      onTap: () {
                                        var topicId = snapshot.data?.payload[index].id;
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizGrid()));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>
                                                  StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description,
                                                        reward:snapshot.data?.payload[index].reward)));

                                                //StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description, )));
                                        /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()));*/
                                      },
                                      child:
                                      Padding(padding: EdgeInsets.only( left: 20,right: 10, top: 5, bottom: 5),child:
                                      Container(
                                        /*height: ,
                                width: 350,*/
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
                                              Text(snapshot.data?.payload[index].title as String,
                                                style:
                                                TextStyle(color: ColorConstants.backgroundColor, fontFamily: 'Poppins',
                                                    fontSize: 16, fontWeight:  FontWeight.w700)


                                                /*GoogleFonts.poppins(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w700, fontSize: 16)*/,)),),)
                                          ],)
                                      ),

                                      ),);});}),),],),),],),),);}}

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