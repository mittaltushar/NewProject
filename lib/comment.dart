import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rama_puzle/submissionSuccess.dart';
import 'package:sizer/sizer.dart';


import 'CustomColor.dart';
import 'HttpClient.dart';
import 'addPost.dart';
import 'commentData.dart';

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

class Comment1 extends StatefulWidget {

  String? postid;
  Comment1({Key? key, required this.postid}) : super(key: key);

  Comment2 createState() => Comment2(postid: postid);
}
class Comment2 extends State<Comment1>{
  String? postid;
  Comment2({Key? key, required this.postid}) ;
  FocusNode _focusNode = FocusNode();
  GlobalKey<CommentBox4> _buttonStateKey = GlobalKey();
  bool _isVisible = true;
  var _colorVariable = Colors.white;
  bool _click = true;
  final myController = TextEditingController();
  List<Payload>? payload2;
  //ViewAllCommentsModel? getAllCommentsData;

  //List<Reply>? getData;


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

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  CommentData? commentData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*commentData =*/ getAllCommentData(postid, '1', '1', '10', _updateValue);


    //final myController = TextEditingController();
    //topicData = getTopicList( "$category_id", sub_category_id!);
    //commentData = getVideoTopic("1", "10");
  }

  void _updateValue(CommentData newValue) {
    setState(() {
      //_value = newValue;
      commentData = newValue;
      /*if (newValue == "1") {
        //setLoginStatus();
        //getLoginStatus();

      }*/
    });
   /* loginStatus = true;
    updateLoginStatus();
    setLoginStatus2();*/
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var anyVar = 'Comments';
    return
      KeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),


        child:
        Scaffold(
          backgroundColor: ColorConstants.backgroundColor,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          /*appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),*/
          body:

              SingleChildScrollView(

                child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
          Container(
            height:MediaQuery.of(context).size.height * .85,
            margin: EdgeInsets.only(left: 10, right: 10, top: 40),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(anyVar),
                  Icon(Icons.cancel_outlined)
                  //Image.asset("assets/images/")
                ],),
              Row(

                children: [
                  Image.asset("assets/images/email.png", height: 20, width: 20,),
                  InkWell(onTap: () {

                  },child:
                  Padding(padding: EdgeInsets.only(left: 15),child:
                  InkWell(onTap:() {


   /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddPost()));*/
    }, child:

    InkWell (
    onTap: () {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0))),
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
                child: TextFormField(
                  controller: myController,
                  onFieldSubmitted: (term) async {
                    //_fieldFocusChange(context, _ageFocus, _heightFocus);
                    SubmissionSuccess success = await addCommentComuPostApi(postid!, myController.text, _updateValue);
                    if (success.code == 1) {

                      /*Payload payload = new Payload(id: , postId: postId, createdTime: createdTime, userId: , name: name, profileImg: profileImg, content: content)
                      payload2.add(myController.text);*/
                      /*commentData = *///getAllCommentData(postid, '1', '1', '10', _updateValue);
                      //setState(() {});
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15), // add padding to adjust text
                    isDense: true,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                      child: InkWell(
                          onTap: (){
                            /*if(addReplyController.text.isEmpty ){
                              Fluttertoast.showToast(msg: 'Please Enter Some Text');
                            }else{
                              addReplyCommentsApi();*/

                          },
                          child: Icon(Icons.recent_actors,size: 30,color: ColorConstants.backgroundColor,)),
                    ),

                    hintText: "Add a comment",
                   /* prefixIcon: const Padding(
                      padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                      child: Icon(Icons.chat),
                    )*/

                  ), ),
              ),
            );
          },
        );
      },
    );}
      , child:
                  Text("Add a comment", style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: ColorConstants.backgroundColor)/*GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w600,color: ColorConstants.backgroundColor
              )*/,),),),),),
                ],
              ),

              Divider(
                  height: 1,
                  color: Colors.black
              ),
              Container(
                height: MediaQuery.of(context).size.height * .500,
                child:
               /* FutureBuilder<CommentData>(
                    future: commentData
//getTopicList( "$category_id", sub_category_id!)
                    ,
                    builder: (context, snapshot) {
                      payload2 = snapshot.data?.payload;
                      return*/
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount:  commentData?.payload.length,
                          itemBuilder:
                              (context, index) {
                            //chapterCount = snapshot.data?.payload.length as int;
                            return
                              //Text('abc');
                              //Text(snapshot.data!.payload[index].name);
                              CommentBox3(key: _buttonStateKey, payload: commentData?.payload[index]  );
                            //CommentBox1(colorVariable: false, isVisible: false,index: index,payload:snapshot.data!.payload[index]/*snapshot.data?.payload*/);

                            //getCommentItem(snapshot, index);
                          },),),/*})*/

              /*TextField(

                decoration: InputDecoration(
                  labelText: 'Enter text',
                ),
              ),*/
              /*Visibility(
                visible: true,
                child: Align(
                alignment: Alignment.bottomCenter,child:
              TextField(

                decoration: InputDecoration(
                  labelText: 'Enter text',
                ),
              ),),)*/],),),

          ),
           /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                scrollPadding: EdgeInsets.only(bottom: 30),
                style: TextStyle(color: Colors.white),

                autofocus: false,

            ),)*/]),),
        ),);}}

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

  getCommentItem2() {
    return Column(
      children: [
        Text(payload!.name)
      ],
    );
  }
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

        /*Visibility(
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
                  *//*Container(
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

*//**//*
                  *//**//*Row(children: [

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
                *//**//**//**//*TextFormField(
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
              ),*//**//**//**//*
                *//**//**//**//*Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child: TextFormField(

                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Enter MailId';
                        }
                        return null;
                      },
                      *//**//**//**//**//**//**//**//*focusNode: focusNode,
                      controller: myController,*//**//**//**//**//**//**//**//*
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
                    ),)*//**//**//**//*

              ],),*//**//*
              Divider(
                color: Colors.black,
                height: 2,
                thickness: .1,
                indent: 0,
                endIndent: 0,

              ),
            ]
              //Image.asset("assets/images/icon_user")
            ))*//*
     ],),)*/]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getCommentItem2();//Text(payload!.name);
    //return Text("ab");
  }
}




