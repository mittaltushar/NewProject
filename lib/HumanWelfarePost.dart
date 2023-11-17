
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rama_puzle/aws_s3_upload.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'CustomColor.dart';
import 'HttpClient.dart';
import 'amazon_s3_cognito.dart';
import 'package:simple_s3/simple_s3.dart';

class HumanWelfarePost extends StatefulWidget {
  int i ;
  HumanWelfarePost({Key? key, required this.i});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HumanWelfareState(i:i);
  }

}

class HumanWelfareState extends State<HumanWelfarePost> {
  int i;
  final myController = TextEditingController();
  //final _form = GlobalKey<FormState>();
  String name = '';
  File? imageFile;
  String? imgString;

  HumanWelfareState({Key? key, required this.i});

  /*submitData(String capiton, String title, String imgString) async {
    await addPost2(capiton, title, imgString);
    Navigator.pop(context);
  }
  */

  redDropPost(String capiton, String title, String imgString) async{
    await addPost3(capiton, title, imgString);
    Navigator.pop(context);
  }
  @override
  void initState() {
    super.initState();
    loginStatus();
  }

  void loginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name')!;
    });

  }
  /*getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string = await prefs.getString('auth-token');
    return string;
  }*/
  getSharedPreferences1() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;
    return token;
  }

  /*_getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        String imagePath = pickedFile.path;
        File()
      });
    }
  }*/

  /*_getFromGallery1() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        AwsS3.uploadFile(accessKey: accessKey, secretKey: secretKey, bucket: "ramapuzzle", file: imageFile!);
      });
    }
  }*/

  Future<void> _selectImageFromGallery() async {


    File? selfieFile;

    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      selfieFile = File(pickedFile.path);
      setState(() {

      });
      print('image======${selfieFile}');

    }


    SimpleS3 _simpleS3 = SimpleS3();


// /*https://ramapuzzle.s3.ap-south-1.amazonaws.com/*/
    var  result = await _simpleS3.uploadFile(
      selfieFile!,
      'ramapuzzle',
      'ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a',
      AWSRegions.apSouth1,
      debugLog: true,
      s3FolderPath: "upload",
      accessControl: S3AccessControl.publicRead,
    );
    imgString = result;
    print("authantication token is here___________$result");


    /* final prefs = await SharedPreferences.getInstance();
      var authToken = await prefs.getString('auth-token');
      print("authantication token is here___________$authToken");
      var headers = {
        'auth-token': '$authToken'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://www.ramapuzzle.com/api/v1/user/addPlantTreeProof'));
      request.fields.addAll({
        'plant_tree_id': widget.plan_Tree_ID,
        'photo':result,
      });
      //  selfieFile == null ? null : request.files.add(await http.MultipartFile.fromPath('photo', selfieFile!.path.toString()));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var finalResponse = await response.stream.bytesToString();
        final jsonResponse =  json.decode(finalResponse);
        if(jsonResponse ['type'] == 'SUCCESS'){
          Fluttertoast.showToast(msg: '${jsonResponse['message']}');
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ListOfSelfie(plan_Tree_ID: widget.plan_Tree_ID)));
        }else{
          Fluttertoast.showToast(msg: '${jsonResponse['message']}');
        }
        print("$jsonResponse");
      }
      else {
        print(response.reasonPhrase);
      }
    }*/
    /*final picker = ImagePicker();
    String? path;
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedImage!.path);
    String? uploadedImageUrl = await AmazonS3Cognito.uploadImage(
        imageFile!.path, 'ramapuzzle', 'ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a');
    print("acd" + uploadedImageUrl!);
    path = uploadedImageUrl;
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);

      });
    }*/

  }

  Future<void> _selectImageFromCamera() async {


    File? selfieFile;

    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      selfieFile = File(pickedFile.path);
      setState(() {

      });
      print('image======${selfieFile}');

    }


    SimpleS3 _simpleS3 = SimpleS3();



    var  result = await _simpleS3.uploadFile(
      selfieFile!,
      'ramapuzzle',
      'ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a',
      AWSRegions.apSouth1,
      debugLog: true,
      s3FolderPath: "upload",
      accessControl: S3AccessControl.publicRead,
    );
    imgString = result;
    print("authantication token is here___________$result");


    /* final prefs = await SharedPreferences.getInstance();
      var authToken = await prefs.getString('auth-token');
      print("authantication token is here___________$authToken");
      var headers = {
        'auth-token': '$authToken'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://www.ramapuzzle.com/api/v1/user/addPlantTreeProof'));
      request.fields.addAll({
        'plant_tree_id': widget.plan_Tree_ID,
        'photo':result,
      });
      //  selfieFile == null ? null : request.files.add(await http.MultipartFile.fromPath('photo', selfieFile!.path.toString()));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var finalResponse = await response.stream.bytesToString();
        final jsonResponse =  json.decode(finalResponse);
        if(jsonResponse ['type'] == 'SUCCESS'){
          Fluttertoast.showToast(msg: '${jsonResponse['message']}');
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ListOfSelfie(plan_Tree_ID: widget.plan_Tree_ID)));
        }else{
          Fluttertoast.showToast(msg: '${jsonResponse['message']}');
        }
        print("$jsonResponse");
      }
      else {
        print(response.reasonPhrase);
      }
    }*/
    /*final picker = ImagePicker();
    String? path;
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedImage!.path);
    String? uploadedImageUrl = await AmazonS3Cognito.uploadImage(
        imageFile!.path, 'ramapuzzle', 'ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a');
    print("acd" + uploadedImageUrl!);
    path = uploadedImageUrl;
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);

      });
    }*/

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*setState(() {
      name = getSharedPreferences1();
    });*/


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConstants.backgroundColor,
          centerTitle: true,
          leadingWidth: 30,

          leading: Padding(padding: EdgeInsets.only(left: 10),
            child:GestureDetector(
              onTap: () {
                Navigator.pop(context);
                /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Body2(isLogin: false)));*/
              },child:

            Image.asset("assets/images/back_arrow.png", height: 20,
              width: 20,)
              ,
              //children: <Widget>[Text("fjkff")],
            ),),
          title: Text('New Post',style: /*GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20, fontWeight: FontWeight.w800
            ),*/
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


        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          height: 710,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(15))),
          child:
          Stack(
            /*crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,*/
            children: [
              Column(children:[
                Row(children: [
                  Image.asset("assets/images/ages.png"),
                  Text("$name")
                ],),


                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 100,
                  child:
                  TextFormField(
                    controller: myController,
                    scrollPadding: EdgeInsets.only(left: 20),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,

                        //labelText: 'Name',
                        hintText: "What's on your mind"),),),


                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      String caption = myController.text;
                      //submitData(caption, title, imgString!);
                      String title = 'Blood Donation';
                      //Fluttertoast.showToast(msg: "Hello!");

                      redDropPost(caption, title, imgString!)
                      //addRedDropPost(caption, title, imgString!);
                      /*setState(() {
                        if (_form!.currentState!.validate()) {


                        if (imgString == null)
                          imgString = '';
                        if (i == 1) {
                          String title = 'Blood Donation';

                          addRedDropPost(caption, title, imgString!);
                        }
                        else {
                          String title = 'Community Post';

                          submitData(caption, title, imgString!);
                        }
                        var _email = myController.text;
                          var _password = myController1.text;
                          LoginData data = fetchAlbum(_email, _password, "login_type",context);

                      })*/;},

                    child: Text("Post"),

                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontWeight: FontWeight.w600),
                      minimumSize: const Size.fromHeight(50),
                      primary: Colors.yellow,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                )
                /*InkWell(
                  onTap: () async {*//*_selectImageFromCamera()*//*
                    String caption = myController.text;
                    //submitData(caption, title, imgString!);
                    String title = 'Blood Donation';
                    //Fluttertoast.showToast(msg: "Hello!");

                    final prefs = await SharedPreferences.getInstance();
                    //Fluttertoast.showToast(msg: 'client12');
// set value
                    //await prefs.setInt('user_id', data.payload.id);
                   // var string =  prefs.getString('auth-token');
                   // const baseURL = "http://www.ramapuzzle.com/api/v1";
                   // const postUrl = "/user/addCommunityPostHumanWelfare";
                    //var token = string;
                    //var token = string;
                   // Fluttertoast.showToast(msg: 'client12');
                    *//*final response = await http.post(Uri.parse(baseURL + postUrl),
                        encoding: Encoding.getByName("utf-8"),
                        headers: {"auth-token": token!},
                        *//**//*headers:   { 'Content-type': 'application/json',
       'Accept': 'application/json',
       *//**//**//**//*"Authorization": "user_2yHJ8eSsmKLED0h"*//**//**//**//*}*//**//* // user_VtPAAuNIRbQgzKT
                        body: {
                          'title':title,
                          'caption':caption,
                          'post_type' : 'IMAGE',
                          'post_url' : imgString,
                          *//**//*'email': 'shachish@ajath.com',
         'password' : '123456',
         'login_type' : 'E',
         'device_type': 'A',
         'device_token': 'fjksf'*//**//*
                        }
                    );*//*
                    addPost3(caption, title, imgString!);
                    //Fluttertoast.showToast(msg: 'client12');
                    Navigator.pop(context);
                    //SaveAnswerData saveAnswerData = saveAnswerDataFromJson(response.body);
                    *//*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPost()));*//*

                    //return saveAnswerData;

                    //addRedDropPost(caption, title, imgString!);
                    ;},
                  child:
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(border:
                    Border(
                      top: BorderSide(width: 1.0, color: Colors.grey),
                      //left: BorderSide(width: .0, color: Colors.black),
                      left: BorderSide(width: .5, color: Colors.grey),
                    ),),
                    //Border.all(color: Colors.grey, width: 1)),
                    child:
                    Padding(padding:EdgeInsets.only(top:10), child:Align(alignment: Alignment.center,child: Center(child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/insert_photo.png"),
                        Text('Add Camera')
                      ],),),),),),)*/

              ]),
              /*Padding(padding: EdgeInsets.only(bottom:1),child:*/Align(alignment: FractionalOffset.bottomCenter,child:Container(
                child:
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: 100,
                    child: Center(


                      child: GridView.count(
                        //crossAxisSpacing: 10,
                        physics: NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          InkWell(onTap: () {
                            _selectImageFromGallery();
                          },
                            child:
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(border:
                              Border(
                                top: BorderSide(width: 1.0, color: Colors.grey),
                                //left: BorderSide(width: .0, color: Colors.black),
                                left: BorderSide(width: .5, color: Colors.grey),
                              ),),
                              //Border.all(color: Colors.grey, width: 1)),
                              child:
                              Padding(padding: EdgeInsets.only(top: 10),child:
                              Center(child:Column(children: [
                                Image.asset("assets/images/insert_photo.png"),
                                Text('Add Photo')
                              ],),),),),),
                          InkWell(
                            onTap: (){_selectImageFromCamera();},
                            child:
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(border:
                              Border(
                                top: BorderSide(width: 1.0, color: Colors.grey),
                                //left: BorderSide(width: .0, color: Colors.black),
                                left: BorderSide(width: .5, color: Colors.grey),
                              ),),
                              //Border.all(color: Colors.grey, width: 1)),
                              child:
                              Padding(padding:EdgeInsets.only(top:10), child:Align(alignment: Alignment.center,child: Center(child:Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/insert_photo.png"),
                                  Text('Add Camera')
                                ],),),),),),)

                        ],

                        /*Text("abc")*/),),
                  ),),),),],),),),);}}

/*Stack(
    key: _form,
    children: <Widget>[
    *//*new Container(decoration: new
          BoxDecoration(image: new DecorationImage(
          image: new AssetImage("assets/images/background_img.png"))),),*//*
    Container(
      height: double.infinity,
    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
    decoration: new BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
    ),
    child:
    SingleChildScrollView(

    child: Form(child:
    Container(
    color: Colors.white,
    child: Column(
    children: <Widget>[





    *//*Align(alignment: Alignment.centerLeft,child: Padding(padding: EdgeInsets.only(left: 15,top: 25, bottom: 15),
    child: Text("For any enquiry email us", style:
    GoogleFonts.poppins(
    color: ColorConstants.backgroundColor,
    fontSize: 20, fontWeight: FontWeight.w800
    ),)),),
*//*
    Column(
    children: [

    *//*Align(alignment: Alignment.centerLeft,child: Padding(padding: EdgeInsets.only(left:15,top: 15),
    child:
    Text("Subject", style: TextStyle(color: ColorConstants.backgroundColor),),),),
    Padding(
    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
    child: TextFormField(

    validator: (text) {
    if (text!.isEmpty) {
    return 'Enter Subject';
    }
    return null;
    },
    *//**//*focusNode: focusNode,
              controller: myController,
              *//**//*decoration: InputDecoration(
    //prefixIcon: Icon(Icons.al),
    prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
    child: Image.asset('assets/images/personal_info.png', width: 5,height: 5, fit: BoxFit.fill,),),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.white,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(7.0)
    ),
    labelText: 'Subject',
    hintText: 'Subject'),
    ),), *//**//*Container(
            margin: EdgeInsets.only(left: 20.0, top: 35),
            height: 50,
            width: double.infinity,
            child: Text('Password', style: TextStyle(fontSize: 12,
                fontWeight: FontWeight.w700, color: Colors.white),),
          )*//**//*

    Align(alignment: Alignment.centerLeft,child: Padding(padding: EdgeInsets.only(left: 15,top: 15),
    child:
    Text("Message", style: TextStyle(color: ColorConstants.backgroundColor),),),),
    Padding(
    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
    child: TextFormField(

    validator: (text) {
    if (text!.isEmpty) {
    return 'Enter Message';
    }
    return null;
    },
    *//**//*focusNode: focusNode,
              controller: myController,
              *//**//*decoration: InputDecoration(
    //prefixIcon: Icon(Icons.al),
    prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
    child: Image.asset('assets/images/personal_info.png', width: 5,height: 5, fit: BoxFit.fill,),),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.white,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(7.0)
    ),
    labelText: 'Message',
    hintText: 'Message'),
    ),), Container(
    margin: EdgeInsets.only( left: 20.0, top: 35),
    height: 100,
    width: double.infinity,
    child: Text('Message', style: TextStyle(fontSize: 12,
    fontWeight: FontWeight.w700, color: Colors.white),),
    )
    ,*//*
    Align(
    alignment: FractionalOffset.bottomCenter,
    child: Padding(padding: EdgeInsets.only(left: 17, right: 17, top: 4, bottom: 20),
    child:   Container(

    width: 400,
    child: ElevatedButton(

    child: Text("Send Message"),
    onPressed: () {
    *//* =>

                              *//**//*setState(() {
    if (_form!.currentState!.validate()) {
    *//**//*
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()))*//*
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
    ),),],),],),),),),),],),),);}}
*/

/* Container(
            height: double.infinity,
            margin: EdgeInsets.only(right:10.0, top: 20,left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)
              , bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
              *//*image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),*//*

            ),
          child:
              Container(child:
          Column(
            children: [
              Row(children: [
          Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),
          Text("Abcd")
              ],
              ),
              Container(
                height: 100,
                child:
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'What'+ "'"+ "s on your mind"
                ),

              ),),

              Align(
                alignment: FractionalOffset.bottomCenter,
                child:
              Padding(padding: EdgeInsets.only(left: 17, right: 17, top: 4, bottom: 20),
    child:   Container(

    width: 400,
    child: ElevatedButton(

    child: Text("Post"),
    onPressed: () {
    *//* =>

                              *//**//*setState(() {
    if (_form!.currentState!.validate()) {
    *//**//*
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()))*//*
    }
    ,
    style: ElevatedButton.styleFrom(
    textStyle: TextStyle(fontWeight: FontWeight.w600),

    primary: Colors.yellow,
    onPrimary: Colors.black,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    ),),),),),),
        *//*Align(
        alignment: FractionalOffset.bottomCenter,
          child: Text('dljf')*//**//*GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Text('abcd'),
              Text('abcd')

            ],
          )*//**//*,
        )*//*
              *//*Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(padding: EdgeInsets.only(left: 17, right: 17, top: 4, bottom: 20),
                  child:   Container(

                    width: 400,
                    child: ElevatedButton(

                      child: Text("Send Message"),
                      onPressed: () {
                        *//**//* =>

                              *//**//**//**//*setState(() {
    if (_form!.currentState!.validate()) {
    *//**//**//**//*
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()))*//**//*
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
                ),)*//*
            ],
          ),
        ),
      )*/



