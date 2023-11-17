import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rama_puzle/CustomColor.dart';
import 'package:rama_puzle/PdfOpen.dart';
import 'package:rama_puzle/rapidTest.dart';
import 'package:rama_puzle/studyMaterial.dart';
import 'package:rama_puzle/studyMaterialData.dart';

import 'HttpClient.dart';
import 'Instruction.dart';
import 'OpenDoc.dart';
import 'StudyMaterialDataList.dart';
import 'TopicData.dart';
import 'body1.dart';

class PdfList extends StatefulWidget {
  final int study_id;
  final String title;

  const PdfList({Key? key, required this.study_id,required this.title
  }) : super(key: key);


  // TODO: implement createState
  //throw UnimplementedError();
  @override
  State<PdfList> createState() => PdfList2(study_id: study_id, title: title
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
class PdfList2 extends State<PdfList> {
  final int study_id;
  final String title;

  int chapterCount =0  ;
  PdfList2({Key? key, required this.study_id, required this.title});
  Future<StudyMaterialData>? pdfList;
  Future<TopicList>? topicData;
  Future<StudyMaterialDataList>? studyMatList;/*StudyMaterialDataList? studyMatList;*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //studyMatList = getStudyMaterialList(category_id, sub_category_id!);
    //topicData = getTopicList( "$category_id", sub_category_id!);
    print(studyMatList);
    /*setState(() {

    });*/
    pdfList = getStudyMaterial(study_id.toString());
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

          title: Text(title,style:
          TextStyle(color: Colors.white, fontFamily: 'Poppins',
              fontSize: 20, fontWeight:  FontWeight.w800)

          )
          /*GoogleFonts.poppins(
              color: Colors.white,
                fontSize: 20, fontWeight: FontWeight.w800
            )*/


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
                                          /*StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description,
                                                    reward:snapshot.data?.payload[index].reward)*/
                                          /*Instruction(description: snapshot.data!.payload[index].description,sub_name: snapshot.data!.payload[index].title, topic_id: snapshot.data!.payload[index].id,
                                            sub_category_id: snapshot.data!.payload[index].id.toString(),category_id: 0, reward: snapshot.data!.payload[index].amount.toString(),loc: 1,)*/

                                          OpenDoc(pdf: snapshot.data!.payload[index].postUrl)
                                          ));

                                      else
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>
                                            /*StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description,
                                                    reward:snapshot.data?.payload[index].reward)*/
                                            /*Instruction(description: snapshot.data!.payload[index].description,sub_name: snapshot.data!.payload[index].title, topic_id: snapshot.data!.payload[index].id,
                                            sub_category_id: snapshot.data!.payload[index].id.toString(),category_id: 0, reward: snapshot.data!.payload[index].amount.toString(),loc: 1,)*/

                                            PdfOpen(pdf: snapshot.data!.payload[index].postUrl)
                                            ));


                                      //StudyMaterial(topic_id:  topicId!,category_id:  category_id, sub_category_id:sub_category_id, sub_name: sub_name, description: snapshot.data?.payload[index].description, )));
                                      /*    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()));*/
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


                                              /*GoogleFonts.poppins(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w700, fontSize: 16)*/,)),),)
                                        ],)
                                    ),

                                    ),);});},),)],),),],),),);}}

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