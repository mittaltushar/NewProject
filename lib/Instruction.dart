import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rama_puzle/CustomColor.dart';
import 'package:rama_puzle/startQuiz.dart';
import 'package:rama_puzle/studyMaterialList.dart';
/*import 'package:html/parser.dart';*/
import 'HttpClient.dart';
import 'PdfList.dart';
import 'PdfOpen.dart';
import 'StudyMaterialList2.dart';
import 'TopicData.dart';
/*import 'package:flutter_html/flutter_html.dart';*/

class Instruction extends StatefulWidget {
  final int category_id;
  final int topic_id;
  final String? sub_category_id;
  final String? sub_name;
  final String? description;
  final String? reward;
  final int? loc;
  final String? title;
  const Instruction({Key? key, required this.topic_id,required this.category_id, required this.sub_category_id
    , required this.sub_name, required this.description, required this.reward, required this.loc, required this.title
  }) : super(key: key);


  // TODO: implement createState
  //throw UnimplementedError();
  @override
  State<Instruction> createState() => Instruction2(topic_id: topic_id,category_id: category_id, sub_category_id: sub_category_id,
      sub_name: sub_name, description: description, reward: reward, loc: loc!, title: title
  );
}

class Instruction2 extends State<Instruction> {
  final int topic_id ;
  final int category_id;
  final String? sub_category_id;
  final String? sub_name;
  final String? description;
  final String? title;
  final String? reward;
  int chapterCount =0  ;
  int loc;
  Instruction2({Key? key, required this.topic_id,required this.category_id, required this.sub_category_id, required this.sub_name
    , required this.description, required this.reward, required this.loc, required this.title});

  Future<TopicList>? topicData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //topicData = getTopicList( "$category_id", sub_category_id!);


  }
  /*String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }*/
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
          Container(
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



          /*Image.asset(
              "assets/images/back_arrow.png", height: 10,
              width: 10,)*/
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
            /*Container(child:
            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(left: 10),
                child:
                Text(sub_name!, textAlign: TextAlign.left,
                  style:
                  TextStyle(color: Colors.white, fontFamily: 'Poppins',
                      fontSize: 20, fontWeight:  FontWeight.w800)

                )
                  *//*GoogleFonts.poppins(color: Colors.white,
                      fontSize: 20, fontWeight: FontWeight.w800
                  ),*//*),),)*/
            /*style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )*/
            /* Align(
              alignment: Alignment.topLeft,
              child:
              Padding(padding: EdgeInsets.only(left: 10),child:
              Text("$chapterCount" + " " + "chapters",textAlign: TextAlign.left,
                style: GoogleFonts.poppins(color: Colors.white,
                    fontSize: 14, fontWeight: FontWeight.w800
                ),),),),
*/
            Container(
              height:MediaQuery.of(context).size.height * .8162,
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
                      Text("Instruction",textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontFamily: 'Poppins',
                              fontSize: 18, fontWeight:  FontWeight.w800)

                      )/*GoogleFonts.poppins(color: Colors.black,
                          fontSize: 18, fontWeight: FontWeight.w800
                      ),*/),),


                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10),

                    child:

                    /*                 String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
    }*/
                    //  Html(data:description)
                    Text(formatHtmlString(description!))
/*
                    FutureBuilder<TopicList>(
                        future: topicData*//*getTopicList( "$category_id", sub_category_id!)*//*,
                        builder: (context, snapshot) {

                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount:  snapshot.data?.payload.length,
                              itemBuilder:
                                  (context, index) {
                                chapterCount = snapshot.data?.payload.length as int;
                                return
                                  Padding(padding: EdgeInsets.only( left: 20,right: 10, top: 5, bottom: 5),child:
                                  Container(
                                    *//*height: ,
                                width: 350,*//*
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
                                            style: GoogleFonts.poppins(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w700, fontSize: 16),)),),)
                                      ],)
                                  ),

                                  );});})*/,),

                  Spacer(),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(padding: EdgeInsets.only(left: 17, right: 17, top: 4, bottom: 20),
                      child:   Container(

                        width: 400,
                        child: ElevatedButton(

                          child: Text("Next"),
                          onPressed: () {

                            if (loc == 1)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    PdfList(title: title!,study_id: topic_id)));
                                        //StudyMater4(study_topic_id: topic_id, sub_category_id: '', sub_name: sub_name)));

                           /* if (loc == 2)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>StudyMaterialList4(study_topic_id: topic_id, sub_category_id: '', sub_name: sub_name)));
*/
                            /* =>

                              *//*setState(() {
    if (_form!.currentState!.validate()) {
    *//*
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()))*/
                          }
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
                    ),)

                ],),),],),),);}}

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