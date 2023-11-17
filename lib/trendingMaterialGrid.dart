

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:rama_puzle/QuizGridItem.dart';
import 'package:rama_puzle/StudyMaterialSubCategory.dart';
import 'package:rama_puzle/sign_up.dart';
import 'package:rama_puzle/studyMaterialList.dart';
import 'package:rama_puzle/trandingData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CommunitySection.dart';
import 'CustomColor.dart';
import 'HttpClient.dart';

import 'HumanWelfare.dart';
import 'QuizSubCategory.dart';
import 'RedBloodPost.dart';
import 'StudySubCategory.dart';
import 'body1.dart';
import 'forget_password.dart';
import 'package:http/http.dart' as http;

import 'new_modules/de_addiction_community/list_de_addiction.dart';
import 'new_modules/family_tree/family_tree_structure.dart';
import 'new_modules/food_donation/list_food_donation.dart';
import 'new_modules/group_activity_swachha_bharat_abhiyan/list_of_group_activities.dart';
import 'new_modules/human_welfare_addiction/list_of_adictions.dart';
import 'new_modules/human_welfare_blood_donation/list_of_blood_donation.dart';
import 'new_modules/plant_tree/plant_a_tree.dart';

class TrendingGrid extends StatefulWidget {
  const TrendingGrid({Key? key}) : super(key: key);

  @override
  State<TrendingGrid> createState() => TrendingGrid2();
}




class TrendingGrid2 extends State<TrendingGrid> {
  TrandingData? study_material_item;

  /*final _form = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  String hintText = 'Email';
  String hintText2 = 'Password';

  final myController = TextEditingController();
  final myController1 = TextEditingController();
*/

  @override
  void initState() {
    getAllTrandingData();
    //study_material_item = fetchStudyMaterialItem();

    super.initState();
/*
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = 'Email';
      }
      setState(() {});
    });

    focusNode1.addListener(() {
      if (focusNode1.hasFocus) {
        hintText2 = '';

      } else {
        hintText2 = 'Password';
      }

      setState(() {

      });
    });*/
  }

  /*InkWell getItem2(Payload payload, int index) {
    //snapshot.data?.payload.studyMaterial[index].name as String,
    var i, j;
    if (index % 2 == 0) {
      i = 15.0;
      j = 5.0;
    } else {
      j = 15.0;
      i = 5.0;
    }
  }

    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  *//*StudySubCategory(study_cat_id: payload.id?.toInt() ?? 0, study_name: payload.name,))*//*
            StudyMaterialSubCategory(category_id: payload.id?.toInt() ?? 0, category_name: payload.name)));

        //QuizSubCategory(category_id: payload.id?.toInt() ?? 0, category_name: payload.name,))


      },
      child:
      Padding(
        padding: EdgeInsets.only(right: j, left: i),
        child:
        Container(

          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical : 10),
          child: Padding(padding: EdgeInsets.only(top: 45),
            child: Center(
              child: Text(payload.name
              as String,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),),
          ),
          height: 80,
          width: MediaQuery.of(context).size.width/2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(

              image: NetworkImage(payload.imageUrl as String),

              fit: BoxFit.cover,
            ),),),),);

  }*/

  getAllTrandingData() async {
    //print("++++++++++++++++++++++++++++++++++$getData");
    //print("_________________This is post id${widget.post_Id}");
    final prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString('auth-token');
    print("authantication token is here___________$authToken");
    var headers = {
      'auth-token': authToken!
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://www.ramapuzzle.com/api/v1/getAlltranding'));
    /*request.fields.addAll({
      'post_id': widget.post_Id!,
      'page': '1',
      'limit': '10'
    });
    request.headers.addAll(headers);*/
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      // final jsonResponse = ViewAllCommentsModel.fromJson(jsonDecode(finalResponse));
      //jsonResponse =
      TrandingData data = TrandingData.fromJson(jsonDecode(finalResponse));
      //CommentData data = CommentData.fromJson(jsonDecode(finalResponse));
      study_material_item = data;
      setState(() {
        study_material_item = data;
        //getData;
        //print('this is over reply___________$getData');
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  InkWell getItem2(Payload payload, int index) {
    //snapshot.data?.payload.studyMaterial[index].name as String,
    var i, j;
    if (index % 2 == 0) {
      i = 15.0;
      j = 5.0;
    } else {
      j = 15.0;
      i =5.0;
    }


    return InkWell(
      onTap: (){

        /*if (loginStatus == true) {*/
          if (index == 0 /*&& (loginStatus == true)*/)
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                //Comment1()
                CommunitySection(name: payload.name)
                  /*VideoDisplay(category_id: 0,
                  sub_category_id: "", sub_name: "",)*/));
          if (index == 1/* && (loginStatus == true)*/)
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                   //
                // CommunitySection(name: payload.name)
                //Comment1()
                RedBloodPost(name: payload.name)
                //CommunitySection(name: payload.name)
                //HumanWelfareSection(title: payload.name,)
                  /*VideoDisplay(category_id: 0,
                  sub_category_id: "", sub_name: "",)*/));
          if (index == 2)
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            PlantTree()
            ));
          if (index == 3)
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            FoodDonationList()
            ));
          if (index == 4)
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            FamilyViewStructure()
            ));
          if (index == 5)
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            DeAddictionList()
            ));
          if (index == 6)
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                GroupActivitiesList()
            ));
          if (index == 7)
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                BloodDonationtList()
            ));
          if (index == 8)
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                //BloodDonationtList()
            AddAddictionsList()
            ));


          /*if (index == 4)
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                PlantTree()
            ));*/

        },
        /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  *//*StudySubCategory(study_cat_id: payload.id?.toInt() ?? 0, study_name: payload.name,))*//*
            StudyMaterialSubCategory(category_id: payload.id?.toInt() ?? 0, category_name: payload.name)

            ));*/

        //QuizSubCategory(category_id: payload.id?.toInt() ?? 0, category_name: payload.name,))



      child:
      Padding(
        padding: EdgeInsets.only(right: j, left: i),
        child:
        Container(

          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical : 10),
          child: Padding(padding: EdgeInsets.only(top: 45),
            child: Center(
              child: Text(payload.name
              as String,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),),
          ),
          height: 80,
          width: MediaQuery.of(context).size.width/2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(

              image: NetworkImage(payload.imageUrl as String),

              fit: BoxFit.cover,
            ),),),),);

  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    /*myController.dispose();
    myController1.dispose();*/
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          appBar: AppBar(
              elevation: 0,
              leadingWidth: 30,
              backgroundColor: ColorConstants.backgroundColor,
              title: Center(child:Text("Trending", style: TextStyle(fontWeight: FontWeight.bold),),),
              leading: Padding(padding: EdgeInsets.only(left: 10),
                child:GestureDetector(
                  onTap: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Body2(isLogin: false)));*/
                    Navigator.pop(context);
                  },child:

                Image.asset("assets/images/back_arrow.png", height: 20,
                  width: 20,)
                  ,
                  //children: <Widget>[Text("fjkff")],
                ),)
          ),
          //resizeToAvoidBottomInset: false,
          //backgroundColor: ColorConstants.backgroundColor,
//backgroundColor: Colors.blue,

          body: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.only(top: 0),
            //margin: EdgeInsets.only(top: 40),
    child:
        
        GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    childAspectRatio: 1.65,
    crossAxisSpacing: 0, crossAxisCount: 2,

    ),
            itemCount: study_material_item?.payload.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
    if (study_material_item != null) {
    return

    //                             Text("${snapshot.data?.payload.tranding[index].name}")
    Container(

    height: 100,
    child:
    AspectRatio(aspectRatio: 16 / 13,
    child: getItem2(study_material_item!.payload[index],index)
    ,),);}

    }),),),);}}


    /*if (snapshot.data != null) {
    return

    //                             Text("${snapshot.data?.payload.tranding[index].name}")
    Container(

    height: 100,
    child:
    AspectRatio(aspectRatio: 16 / 13,
    child: getItem2(snapshot.data?.payload?[index] as Payload , index)
    ,),);}*//*})
    ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    itemCount: study_material_item?.payload!.length,
    itemBuilder: (context, index) {
    // print('${getData![index].content}');
    return GridView.builder(gridDelegate: , itemBuilder: itemBuilder)
    
    return Container(
            child: FutureBuilder<QuizGridItem>(
              future: study_material_item,
              builder: (context, snapshot) {
                //if (snapshot.data) {
                return

                  GridView.builder(

                    padding: EdgeInsets.only(top: 0,bottom: 0),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(


                      childAspectRatio: 1.65,
                      crossAxisSpacing: 0, crossAxisCount: 2,



                    ),

                    itemCount: snapshot.data?.payload?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {

                      if (snapshot.data != null) {
                        return

                          //                             Text("${snapshot.data?.payload.tranding[index].name}")
                          Container(

                            height: 100,
                            child:
                            AspectRatio(aspectRatio: 16 / 13,
                              child: getItem2(snapshot.data?.payload?[index] as Payload , index)
                              ,),);}},);},),)),);}}*/
