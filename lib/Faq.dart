import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'CustomColor.dart';
import 'HttpClient.dart';
import 'body1.dart';
import 'commentData.dart';
import 'faqData.dart';
import 'package:http/http.dart' as http;

class Faq extends StatefulWidget {


  // Comment1({Key? key, required this.isLogin}) : super(key: key);

  Faq2 createState() => Faq2();
}
class Faq2 extends State<Faq>{

  FaqData? faqData;

  bool _isVisible = true;
  var _colorVariable = Colors.white;
  bool _click = true;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
      if (_click == true) {
        _colorVariable = ColorConstants.lightGrey;
        _click = false;
      } else {
        _colorVariable = Colors.white;
        _click = true;
      }
    });
  }

  //Future<FaqData>? faqData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*faqData = */getFaq2();

    //commentData = getAllCommentData('', '1', '1', '10');
    //topicData = getTopicList( "$category_id", sub_category_id!);
    //commentData = getVideoTopic("1", "10");
  }

   getFaq2() async {
    var res = await http.get(Uri.parse(faq));
    var data;
    //attache countryname on parameter country in url
    faqData = faqDataFromJson(res.body);
    setState(() {

    });
   }


  /*@override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }*/
    //return faqData;
    /* NationalityData nationalityData = nationalityDataFromJson(res.body);
  if (nationalityData.code == 1) {
    //OccupationModel data = occupationModelFromJson(res.body);
    return nationalityData;
  }*/


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      /*RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: (event) {
          if (event.isKeyPressed(LogicalKeyboardKey.enter)) {

          }},
        child:*/
        Scaffold(
          backgroundColor: ColorConstants.backgroundColor,
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Center(child:Text("FAQ", style: TextStyle(fontWeight: FontWeight.bold),),),
            elevation: 0,
            backgroundColor: ColorConstants.backgroundColor,
            centerTitle: true,
            leadingWidth: 30,

            leading: Padding(padding: EdgeInsets.only(left: 10),
              child:
              GestureDetector(
                onTap: () async {

                  final prefs = await SharedPreferences.getInstance();

                  String? lang = await prefs.getString('lang');
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Body2(isLogin: false)));
                },child:

              Image.asset("assets/images/back_arrow.png", height: 20,
                width: 20,)
                ,
                //children: <Widget>[Text("fjkff")],
              )

              ,),),
          body:
          Container(
            height: MediaQuery.of(context).size.height * .8366,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(8)),
/*
image: DecorationImage(

                          //image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),
*/


            ),child:

          /*Text("abcc")*/
          SingleChildScrollView(child:
          Column(
            children: [
                           Container(
          decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
/*
image: DecorationImage(

                          //image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),
*/


          ),
                height:   MediaQuery.of(context).size.height * .8366/*8366*/,
                child:

               /* FutureBuilder<FaqData> (
                  future: faqData,
                  builder: (context, snapshot)  {
                    return*/
                        //Text("sdfk");
                    ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
    scrollDirection: Axis.vertical,
    itemCount:  /*snapshot.data?.payload?.length*/faqData!.payload?.length,
    itemBuilder:
    (context, index) {
    //chapterCount = snapshot.data?.payload.length as int;
    return CommentBox3(payload:/*snapshot.data?.payload![index] as Payload11*/
    faqData?.payload?.elementAt(index) as Payload11
    );
    //Text('abc');
                  }
                ),)],),),),);}}

                /*FutureBuilder<FaqData>(
                    future: faqData
//getTopicList( "$category_id", sub_category_id!)
                    ,
                    builder: (context, snapshot) {

                      return
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount:  snapshot.data?.payload?.length,
                          itemBuilder:
                              (context, index) {
                            //chapterCount = snapshot.data?.payload.length as int;
                            return
                              //Text('abc');
                              //Text(snapshot.data!.payload[index].name);

                                Text("fdsjkfs");
                              CommentBox3(payload:snapshot.data?.payload![index] as Payload11);
                            //CommentBox1(colorVariable: false, isVisible: false,index: index,payload:snapshot.data!.payload[index]/*snapshot.data?.payload*/);

                            //getCommentItem(snapshot, index);
                          },);})*/

class CommentBox3 extends StatefulWidget {
  Payload11? payload;
  CommentBox3({Key? key, required this.payload});
  /*Future<StudyMaterialSubCatData>? study_sub_item;
  int study_cat_id;
  CommentBox3({Key? key, required this.study_cat_id});*/

  @override
  CommentBox4 createState() {
    // TODO: implement createStatet
    //throw UnimplementedError();
    return CommentBox4(payload: payload);
  }
}

class CommentBox4 extends State<CommentBox3> {



  bool isVisible = false;
  Payload11? payload;


  var _colorVariable = Colors.white;
  bool _click = true;


  void showToast() {
    setState(() {
      isVisible = !isVisible;
      if (_click == true) {
        _colorVariable = ColorConstants.skyBlueColor;
        _click = false;
      } else {
        _colorVariable = Colors.white;
        _click = true;
      }
    });
  }

  CommentBox4({Key? key, required this.payload});

  getCommentItem() {
    return /*Positioned(top: 0,child:*/Column(
      children: [
        Container(

          decoration: BoxDecoration(color:_colorVariable,borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
          ),child:Column(children:[
          Padding(padding: EdgeInsets.only(top: 10), child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            Expanded(child: Padding(padding: EdgeInsets.only(left: 10, right: 20),child:

            Text(payload?.title as String,style: TextStyle(color: ColorConstants.backgroundColor,fontSize: 18,
                fontWeight:  FontWeight.w800)),),),
            InkWell(onTap: () {
              showToast();
            },child:
            Icon(
              Icons.arrow_downward_outlined,
              color: Colors.grey,
              size: 20,
            ),)
            //Text("fdjk")
          ],),),


          Visibility(
            visible: isVisible == true ? false: true,
            child:
            Padding(padding: EdgeInsets.only(top: 20), child:
            Divider(height: 1, color: Colors.grey,),),),

          Visibility(
              visible: isVisible,
              child:
              Padding(padding: EdgeInsets.only(left: 10, right: 20, top: 20,bottom: 20),child:
              Text(payload?.details as String,style: TextStyle(color: ColorConstants.backgroundColor,fontSize: 16,
                  fontWeight:  FontWeight.w600)),)
                //Image.asset("assets/images/icon_user")
              ),

         /* Align(child: Padding(padding: EdgeInsets.only(left: 30, right: 0, top: 10),*//*child:Text(payload.elementAt(index) as String)*//*),
              alignment: Alignment.topLeft),
          Align(alignment: Alignment.topLeft
            ,child:Padding(padding: EdgeInsets.only(left: 30, right: 0, top: 10), child:InkWell(
                onTap: () {

                  //anyVar = payload!.postId;
                  showToast();
                  *//* Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StudyMaterialGrid()));*//*
                },
                child:Icon(Icons.message)),),),]),),

        //Image.asset("assets/images/icon_user.png"),
        Visibility(
            visible: isVisible,
            child: Column(children: [


              Row(children: [

                Padding(padding:EdgeInsets.only(left:20),child:Image.asset("assets/images/email.png",height: 20, width: 20,)),
                Container(
                    width: 300,
                    child:
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      initialValue: 'Add a replay..',
                      style: new TextStyle(fontWeight: FontWeight.normal, color: ColorConstants.backgroundColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                      ),
                    )

                ),
                *//*TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
              ),*//*
                *//*Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child: TextFormField(

                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Enter MailId';
                        }
                        return null;
                      },
                      *//**//*focusNode: focusNode,
                      controller: myController,*//**//*
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),
                    ),)*//*

              ],),
              Divider(
                color: Colors.black,
                height: 2,
                thickness: .1,
                indent: 0,
                endIndent: 0,

              ),
         */   ]
              //Image.asset("assets/images/icon_user")
            ))
      ],);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getCommentItem();//Text(payload!.name);
  }
}




