import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rama_puzle/submissionSuccess.dart';
import 'package:sizer/sizer.dart';


import 'CustomColor.dart';
import 'HttpClient.dart';
import 'SizeConfig.dart';
import 'addPost.dart';
import 'commentData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
/*class Comment1 extends StatefulWidget {
Comment2 createState() => Comment2();

State<StatefulWidget> createState() {
  // TODO: implement createStatet
  //throw UnimplementedError();
  return Comment2();
}


var anyVar = 0;

class Comment1 extends StatefulWidget {


  // Comment1({Key? key, required this.isLogin}) : super(key: key);

  Comment2 createState() => Comment2();
}*/
/*
class CommentBox1 extends StatefulWidget {
  var colorVariable;
  var isVisible;
  var index;

  var snapshot;

  Payload payload;
  CommentBox1({Key? key,required this.colorVariable, required this.isVisible, required this.index, required
  this.payload
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return CommentBox(colorVariable: colorVariable, isVisible: isVisible , payload: payload,index: index);
  }
}

class CommentBox extends State {
  var colorVariable;
  var isVisible;
  var _click = true;
  //AsyncSnapshot snapshot;
  Payload payload;
  int index;

  void showToast() {
    setState(() {
      isVisible = !isVisible;
      if (_click == true) {

        colorVariable = ColorConstants.lightGrey;
        _click = false;
      } else {
        colorVariable = Colors.white;
        _click = true;
      }
    });
  }

  CommentBox({Key? key, required this.colorVariable, required this.isVisible, required this.payload, required this.index});

  Positioned getCommentItem() {
    return Positioned(top: 0,child:Column(
        children: [
    Container(

    decoration: BoxDecoration(color:colorVariable),child:Column(children:[
    Padding(padding: EdgeInsets.only(top: 10), child:
    Row(children: [
      //Image.network(payload.elementAt(index) as String,height: 20, width: 20,),
      //Padding(padding: EdgeInsets.only(left: 10),child:Text(payload.elementAt(index) as String),)
      //Text("fdjk")
    ],),),

    Align(child: Padding(padding: EdgeInsets.only(left: 30, right: 0, top: 10),
    alignment: Alignment.topLeft),
    Align(alignment: Alignment.topLeft
    ,child:Padding(padding: EdgeInsets.only(left: 30, right: 0, top: 10), child:InkWell(
    onTap: () {
    //_isVisible = false;
    showToast();
    *//* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const StudyMaterialGrid()));*//*
    },
    child:Icon(Icons.message)),),),]),),

    //Image.asset("assets/images/icon_user.png"),
    Visibility(
    visible: true,
    child: Column(children: [


    Row(children: [

//                Padding(padding:EdgeInsets.only(left:20),child:Image.asset("assets/images/email.png",height: 20, width: 20,)),
    Container(
    width: 300,

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
    TextFormField(
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
    *//*Divider(
    color: Colors.black,
    height: 2,
    thickness: .1,
    indent: 0,
    endIndent: 0,

    ),*//*
    ]
    //Image.asset("assets/images/icon_user")
    ))
    ],),);
  }

*/

/*@override
  Widget build(BuildContext context) {

    return getCommentItem();

  }
}*/
/*class Body3 extends State {
  ScrollController scrollController = ScrollController();
  bool isLogin1 = false;
  Future<HomePageData>? homePageData;
  Future<CommunityPost>? communityPost;
  List<Payload2>? payload2;
  double pixel = 0;
  Body3({Key? key, required  this.isLogin1}) ;*/

class Comment6 extends StatefulWidget {


  // Comment1({Key? key, required this.isLogin}) : super(key: key);

  Comment7 createState() => Comment7();
}
class Comment7 extends State<Comment6>{
  FocusNode _focusNode = FocusNode();
  GlobalKey<CommentBox4> _buttonStateKey = GlobalKey();
  bool _isVisible = true;
  var _colorVariable = Colors.white;
  bool _click = true;
  CommentData? commentDataList;
  final myController = TextEditingController();

  TextEditingController addCommentController = TextEditingController();
  TextEditingController addReplyController = TextEditingController();
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

  getAllCommentData(String? string, String post_id, String page, String limit) async {
    //var token = string;
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');
    const baseURL = "http://www.ramapuzzle.com/api/v1";
    const commentData = baseURL + "/user/getAllComments";
    //var token = string;
    var token = string;
    final response = await http.post(Uri.parse(commentData),
        encoding: Encoding.getByName("utf-8"),
        headers: {"auth-token": token!},
        body: {
          'post_id': post_id,
          'page': page,
          'limit': limit
        });

    CommentData data = commentDataFromJson(response.body);
    print(data);
    setState(() {
      commentDataList = data;

    });
    //updateValue(data);
    return data;
  }

  Future<CommentData>? commentData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCommentData('', '1', '1', '10');
    //commentData = getAllCommentData('', '1', '1', '10', nullptr as Function);
    //topicData = getTopicList( "$category_id", sub_category_id!);
    //commentData = getVideoTopic("1", "10");
  }

  addCommentComuPostApi(String postId, String content) async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //a/wait prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;
    final response = await http.post(Uri.parse(addCommentComuPost),
        encoding: Encoding.getByName("utf-8"),
        body: {
          'post_id':postId,
          'content': content
        }, headers: {"auth-token": token!});

    SubmissionSuccess nationalityData =
    submissionSuccessFromJson(response.body);
    getAllCommentData(postId, '1', '1', '10',);
    return nationalityData;
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        child:Padding(
            padding: const EdgeInsets.all(10.0),
            child:Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: TextField(
                  controller: myController,
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20), // add padding to adjust text
                    isDense: true,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                      child: InkWell(
                          onTap: (){
                            if(myController.text.isEmpty ){
                              //Fluttertoast.showToast(msg: 'Please Enter Some Text');

                            }else{
                              //addCommentsApi();
                              addCommentComuPostApi('1', myController.text);
                            }
                          },
                          child: Icon(Icons.send,size: 30,color: ColorConstants.backgroundColor,)),
                    ),
                    hintText: "Add a comment",hintStyle: const TextStyle(color: ColorConstants.backgroundColor,fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.bold),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                      child: Icon(Icons.chat,size: 30,color: ColorConstants.backgroundColor,),
                    ),
                  ), ),
              ),

              const SizedBox(height: 10,),
              commentDataList == null ?  const Center(
                child: CircularProgressIndicator(
                  semanticsLabel: 'Circular progress indicator',color: ColorConstants.backgroundColor,
                ),
              ):commentDataList!.payload.isEmpty ?  const Text(""):SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: commentDataList!.payload.length,
                  itemBuilder: (context, index) {
                    // print('${getData![index].content}');
                    return Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 8,right: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Row(
                              children: [
                                Image.network('${commentDataList!.payload![index].profileImg}',scale: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${commentDataList!.payload![index].name}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                                ),
                                Text('${commentDataList!.payload![index].createdTime}'),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text("${commentDataList!.payload![index].content}",style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,fontSize: 14),),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 40.0),
                            //   child: Text("${getAllCommentsData!.payload![index].reply![index].content}",style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,fontSize: 14),),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0,left: 40),
                              child: InkWell(
                                  onTap: (){
                                    print('This is prticular post id ==>>${commentDataList!.payload![index].postId.toString()}');
                                    //commentId = commentDataList!.payload![index].postId.toString();
                                    // _displayTextInputDialog(context);
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                          builder: (BuildContext context,  Function( Function()) setState) {
                                            return Padding(
                                              padding: MediaQuery.of(context).viewInsets,
                                              // padding: const EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 20),
                                                child: TextField(
                                                  //controller: addReplyController,
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.only(top: 15), // add padding to adjust text
                                                    isDense: true,
                                                    suffixIcon: Padding(
                                                      padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                                                      child: InkWell(
                                                          onTap: (){
                                                            if(addReplyController.text.isEmpty ){
                                                              //Fluttertoast.showToast(msg: 'Please Enter Some Text');
                                                            }else{
                                                              //addReplyCommentsApi();
                                                            }
                                                          },
                                                          child: Icon(Icons.send,size: 30,color: ColorConstants.backgroundColor,)),
                                                    ),

                                                    hintText: "Add a reply....",
                                                    prefixIcon: const Padding(
                                                      padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                                                      child: Icon(Icons.chat),
                                                    ),

                                                  ), ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: const Text("Reply...",style: TextStyle(color: ColorConstants.backgroundColor,fontWeight: FontWeight.bold),)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )

            ],)
        ),

      ),
    );
  }
}

class CommentBox3 extends StatefulWidget {
  Payload? payload;
  CommentBox3({GlobalKey? key, required this.payload});
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
  Payload? payload;


  var _colorVariable = Colors.white;
  bool _click = true;

  final myController = TextEditingController();

  void showToast() {
    setState(() {
      isVisible = !isVisible;
      if (_click == true) {
        _colorVariable = ColorConstants.lightGrey;
        _click = false;
      } else {
        _colorVariable = Colors.white;
        _click = true;
      }
    });
  }
  @override
  void dispose() {
//    ServicesBinding.instance.keyboard.removeHandler(_onKey);
    myController.dispose();

    super.dispose();

  }
  getValue() {
    return myController.text;
  }
  CommentBox4({Key? key, required this.payload});

  getCommentItem() {
    return /*Positioned(top: 0,child:*/Column(
        children: [
          Container(

            decoration: BoxDecoration(color:_colorVariable),child:Column(children:[
            Padding(padding: EdgeInsets.only(top: 10), child:
            Row(children: [
              Image.network(payload?.profileImg as String,height: 20, width: 20,),
              Padding(padding: EdgeInsets.only(left: 10),child:Text(payload?.name as String),)
              //Text("fdjk")
            ],),),

            Align(child: Padding(padding: EdgeInsets.only(left: 30, right: 0, top: 10),child:Text(payload?.content as String)),
                alignment: Alignment.topLeft),
            Align(alignment: Alignment.topLeft
              ,child:Padding(padding: EdgeInsets.only(left: 30, right: 0, top: 10), child:InkWell(
                  onTap: () {

                    //anyVar = payload!.postId;
                    showToast();
                    /* Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StudyMaterialGrid()));*/
                  },
                  child:Icon(Icons.message)),),)]),),

          //Image.asset("assets/images/icon_user.png"),

          Visibility(
            visible: isVisible,
            child: Column(

              children: [

                Row(children: [
                  Padding(padding:EdgeInsets.only(left:20),child:Image.asset("assets/images/email.png",height: 20, width: 20,)),

                  Container(
                    width: 300,
                    child:
                    TextFormField(

                      onFieldSubmitted: (text) {
                        submitComment(payload!.id.toString(), text);
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: myController,

                      style: new TextStyle(fontWeight: FontWeight.normal, color: ColorConstants.backgroundColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add a replay',
                        contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),)
                ],),
                /*Container(
                      width: 100,
                      child:
                      TextFormField(
                        controller: myController,
                        //keyboardType: TextInputType.emailAddress,
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

*//*
                  *//*Row(children: [

                Padding(padding:EdgeInsets.only(left:20),child:Image.asset("assets/images/email.png",height: 20, width: 20,)),
                Container(
                    width: 300,
                    child:
                    TextFormField(
                      controller: myController,
                      //keyboardType: TextInputType.emailAddress,
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
                *//**//*TextFormField(
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
              ),*//**//*
                *//**//*Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child: TextFormField(

                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Enter MailId';
                        }
                        return null;
                      },
                      *//**//**//**//*focusNode: focusNode,
                      controller: myController,*//**//**//**//*
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
                    ),)*//**//*

              ],),*//*
              Divider(
                color: Colors.black,
                height: 2,
                thickness: .1,
                indent: 0,
                endIndent: 0,

              ),
            ]
              //Image.asset("assets/images/icon_user")
            ))*/
              ],),)]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getCommentItem();//Text(payload!.name);
  }
}



