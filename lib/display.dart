import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/placeData.dart';
import 'package:test_project/placeData2.dart';
import 'package:test_project/placeData3.dart';
import 'package:test_project/placeData3.dart';


/*class CustomWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}*/
class CommunitySection2 extends StatefulWidget{
  String? id;
  CommunitySection2({Key? key, required this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return CommunitySectionState2(id: id);
  }
}

class CommunitySectionState2 extends State {
  //late VideoPlayerController videoPlayerController;
  //Future<CommunityPost>? data;
  String? id;

  PlaceData3? placeData3;
  CommunitySectionState2({required this.id});
  /*String? comm_status;
  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  final int _numberOfPostsPerRequest = 10;
  //late List<Payload> comments;
  late ScrollController _scrollController;
  final int _nextPageTrigger = 3;
  List<PlaceData>? placeData;
  List<PlaceData2>? placeData2;*/
  /*CommunityPost? communityModel;
  List<Payload15>? payload15;
  List<VideoPlayerController>? controllerList;
*/
  /*getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string = await prefs.getString('auth-token');
    return string;
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //String token = getSharedPreferences();
    //data = getHumanWelfarePost( '1', '10');
    //data = getCommunityPost();
    //deAddictionListApi()
    /*getPosts();
    getPosts2();*/
    //controllerList = [];

    //getCommunityPost();
    getPosts();
  }

  getPosts() async {
    //var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var request = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/" + id!));
    /*request.fields.addAll({
      'page': ,
      'limit': '100'
    });*/
    //request.headers.addAll(headers);

    //http.StreamedResponse response = await request.send();



    if (request.statusCode == 200) {
      //var finalResponse = await response.stream.bytesToString();
      placeData3= placeData3FromJson(request.body);
      //final jsonResponse = PlaceData3.fromJson(((jsonDecode(finalResponse))));
      //final jsonResponse = DeAddictionListModel.fromJson(jsonDecode(finalResponse));

      print(placeData3);
      setState(() {
        //placeData3  = jsonResponse;
      });

      /*for(var i=0;i< communityModel!.payload!.length;i++){
    *//*bool isContained = comments.any((element) => element.id.toString() == getDeAddictionListData!.payload![i].id.toString());
    print("checking is valid function here ${isContained}");
    if(isContained == true){
    }
    else{
    print("working this not");
    comments.add(getDeAddictionListData!.payload![i]);
    }*//*
    payload15?.add(communityModel!.payload.elementAt(i));
    }*/
      /*setState(() {
    _isLastPage = payload15!.length < _numberOfPostsPerRequest;
    _loading = false;
    _pageNumber = _pageNumber + 1;
    // _posts.addAll(_posts);
    });*/
    }
    /*else {
      print(response.reasonPhrase);
    }*/
  }

  /*getPosts2() async {

    var request = http.MultipartRequest('POST', Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    request.fields.addAll({
      'page': '$_pageNumber',
      'limit': '100'
    });
    //request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = List<PlaceData2>.from((jsonDecode(finalResponse)));
      //final jsonResponse = DeAddictionListModel.fromJson(jsonDecode(finalResponse));

      print(finalResponse);
      setState(() {
        placeData2  = jsonResponse;
      });

      *//*for(var i=0;i< communityModel!.payload!.length;i++){
    *//**//*bool isContained = comments.any((element) => element.id.toString() == getDeAddictionListData!.payload![i].id.toString());
    print("checking is valid function here ${isContained}");
    if(isContained == true){
    }
    else{
    print("working this not");
    comments.add(getDeAddictionListData!.payload![i]);
    }*//**//*
    payload15?.add(communityModel!.payload.elementAt(i));
    }*//*
      *//*setState(() {
    _isLastPage = payload15!.length < _numberOfPostsPerRequest;
    _loading = false;
    _pageNumber = _pageNumber + 1;
    // _posts.addAll(_posts);
    });*//*
    }
    else {
      print(response.reasonPhrase);
    }
  }*/

  /*getCommunityPost() async {
    final prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString('auth-token');
    print("authentication token is here___________$authToken");
    var headers = {
      'auth-token': '$authToken'
    };
    var request = http.MultipartRequest('POST', Uri.parse(communityPost));
    request.fields.addAll({
      'page': '$_pageNumber',
      'limit': '10'
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = CommunityPost.fromJson(jsonDecode(finalResponse));
      //final jsonResponse = DeAddictionListModel.fromJson(jsonDecode(finalResponse));

      print(finalResponse);
      setState(() {
        communityModel  = jsonResponse;
      });

      for(var i=0;i< communityModel!.payload!.length;i++){
        *//*bool isContained = comments.any((element) => element.id.toString() == getDeAddictionListData!.payload![i].id.toString());
        print("checking is valid function here ${isContained}");
        if(isContained == true){
        }
        else{
          print("working this not");
          comments.add(getDeAddictionListData!.payload![i]);
        }*//*
        payload15?.add(communityModel!.payload.elementAt(i));
      }
      setState(() {
        _isLastPage = payload15!.length < _numberOfPostsPerRequest;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        // _posts.addAll(_posts);
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }*/


  /*getView(Payload15? payload, int index) {
    late VideoPlayerController _videoPlayerController;
    late ChewieController _chewieController;
    String? url;
    if (payload?.postType == 'IMAGE') {
      String? url = payload?.postUrl;
      return Image.network(url!, fit: BoxFit.fill,);
    } else if (payload?.postType == 'VIDEO') {
      String? url = payload?.postUrl;
      _videoPlayerController = VideoPlayerController.network(
          url!
      );
      _chewieController = ChewieController(*//*fullScreenByDefault: true,*//*
        videoPlayerController: _videoPlayerController,
        autoPlay: false, // Auto play the video
        looping: true, // Loop the video playback
        // Other ChewieController configurations as needed
      );
      controllerList?.add(_videoPlayerController);
      return Chewie(controller: _chewieController) ;
    }}*/
  /*_videoPlayerController = VideoPlayerController.network(
      ,
    );
*/    //MyViewWidget({required String url});
  /*@override
    void initState() {
      super.initState();
      _videoPlayerController = VideoPlayerController.network(
        url!,
      );

    }
*/
  /*@override
    Widget build(BuildContext context) {
      return Chewie(controller: _chewieController) ;
      return
      {

        if (payload.postType == 'IMAGE') {

        } else if (payload.postType == 'VIDEO') {

        }
      }
  }
*/
  String formatHtmlString(String string) {
    return string
        .replaceAll("<p>", "") // Paragraphs
        .replaceAll("</p>", "") // Line Breaks
        .replaceAll("\"", "&quot;") // Quote Marks
        .replaceAll("'", "&apos;") // Apostrophe
        .replaceAll(">", "&lt;") // Less-than Comparator (Strip Tags)
        .replaceAll("<", "&gt;") // Greater-than Comparator (Strip Tags)
        .trim(); // Whitespace
  }

  /*getAddCommStatus() async{
    final prefs =  await SharedPreferences.getInstance();

// set value
    *//*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);
    await prefs.setBool('isLogin', true);
    await prefs.setString('profile_name', data.payload.name);*//*
    String? com;
    com = await prefs.getString('add_community_post');
    comm_status = com;
    setState(() {

    });


//
  }*/

  /*getLikes() {

  }

  getUserProfileFun2() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //a/wait prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');


    int postId = prefs.getInt("user_id")!;


    var token = string;

    final response = await http.post(Uri.parse("http://www.ramapuzzle.com/api/v1/user/communityPostLikeDislike"),
        encoding: Encoding.getByName("utf-8"),
        body: {
          'user_id':postId.toString(),

        },headers: {"auth-token": token!});
    SubmissionSuccess nationalityData =

    submissionSuccessFromJson(response.body);
    return nationalityData;
  }

  getDislikes() {

  }
*/
  @override
  void dispose() {
    // Dispose of the video player controller to stop video playback.
    /*for (int i = 0; i < controllerList!.length; i++) {
      controllerList?.elementAt(i).dispose();
    }*/

    super.dispose();
  }

  /*sendLike(String post_id, String is_like) async {


    final prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString('auth-token');
    print("authentication token is here___________$authToken");
    var headers = {
      'auth-token': '$authToken'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://www.ramapuzzle.com/api/v1/user/communityPostLikeDislike'));
    request.fields.addAll({
      'post_id': post_id,
      'is_like': is_like
      *//*'page': '$_pageNumber',
      'limit': '10'*//*
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = CommunityPost.fromJson(jsonDecode(finalResponse));
      //final jsonResponse = DeAddictionListModel.fromJson(jsonDecode(finalResponse));

      print(finalResponse);
      setState(() {
        communityModel  = jsonResponse;
      });

      for(var i=0;i< communityModel!.payload!.length;i++){
        *//*bool isContained = comments.any((element) => element.id.toString() == getDeAddictionListData!.payload![i].id.toString());
        print("checking is valid function here ${isContained}");
        if(isContained == true){
        }
        else{
          print("working this not");
          comments.add(getDeAddictionListData!.payload![i]);
        }*//*
        payload15?.add(communityModel!.payload.elementAt(i));
      }
      setState(() {
        _isLastPage = payload15!.length < _numberOfPostsPerRequest;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        // _posts.addAll(_posts);
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return MaterialApp( debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        Widget error = Text("", style: TextStyle(color: Colors.white),);
        //Widget error = Container(decoration: ,);
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw ('widget is null');
      },


      home:
      Scaffold(
        appBar:  AppBar(elevation: 0,
          //backgroundColor: ColorConstants.backgroundColor,
          centerTitle: true,
          title: Text("",style: /*GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20, fontWeight: FontWeight.w800
            ),*/
          TextStyle(color: Colors.white, fontFamily: 'Poppins',
              fontSize: 20, fontWeight:  FontWeight.w800)

          ),
          leadingWidth: 30,
          /*actions: [

            if (comm_status != null && comm_status!.contains("YES"))
             *//* InkWell(onTap: () {
                *//**//*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommunityPostSend(i: 0,)));*//**//*
              }, child:
              Icon(Icons.add_circle_outline_rounded,
                color: Colors.white,
              ),)*//*
            *//* IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  // Implement logout functionality

                },
              )*//*
            *//* else
              IconButton(
                icon: Icon(Icons.login),
                onPressed: () {
                  // Implement login functionality
                },
              ),*//*

            *//*if (comm_status!.contains("YES")) {

                InkWell(onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPost()));
                }, child:
                Icon(Icons.add_circle_outline_rounded,
                  color: Colors.white,
                ),)
              }*//*
            *//*prefs =  await SharedPreferences.getInstance();

// set value
            await prefs.setInt('user_id', data.payload.id);
        await prefs.setString('auth-token', data.payload.authToken);
    await prefs.setBool('isLogin', true);
    await prefs.setString('profile_name', data.payload.name);
    await prefs.setString('add_community_post', data.payload.addCommunityPost);*//*
//

          ],*/      leading: Padding(padding: EdgeInsets.only(left: 10),
            /*child:GestureDetector(
              onTap: () {
                Navigator.pop(context);
                *//* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Body2(isLogin: false)));*//*
              },child:

              ,
              //children: <Widget>[Text("fjkff")],
            )*/),),
        body:
        SafeArea(
          child:Padding(padding:const EdgeInsets.all(10.0),
            /* FutureBuilder<CommunityPost>(
        future: data,
        builder: (context, snapshot) {
          //String count = snapshot.data?.payload.length as String,
          return*/

            child:Column(children: [
              const SizedBox(height: 10,),
              /*payload15 == null ?  const Center(
                child: CircularProgressIndicator(
                  semanticsLabel: 'Circular progress indicator',color: ColorConstants.backgroundColor,
                ),
              ):payload15!.isEmpty ? const Text("No Data Found"):*/Expanded(
                child:

                Padding(padding:EdgeInsets.only(left:10, right:10, top:10, bottom: 10),
                  child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape:
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      elevation: 50,
                      shadowColor: Colors.grey,
                      child: Column(children: [
                        /*SizedBox(
                              width: double.infinity,
                              height: 200,
                              child:
                              //getView(payload15!.elementAt(index), index),

                            ) ,*/
                        Padding(padding: EdgeInsets.only(left:10, top: 10), child:
                        /*Row(children: [*//*Image.network(
                              placeData![index]. as String, height: 40,
                              width: 40,),*/
                          Padding(padding: EdgeInsets.only(left: 15), child:
                          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text(placeData3== null?'':placeData3!.title as String),
                            Align(child: Text(placeData3== null?'':placeData3!.body as String,textAlign: TextAlign.left,),
                              alignment: Alignment.topLeft,
                            ),
                            /*Align(child: Text(placeData2![index].body as String,textAlign: TextAlign.left,),
                              alignment: Alignment.topLeft,
                            )*/

                          ],),)
                        /*],)*/,),

                      ],


                      )
                    // child: getView(snapshot.data?.payload[index]!, index),
                  ),)

                /*ListView.builder(

                  scrollDirection: Axis.vertical,
                  itemCount: placeData3,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => *//*Body2(isLogin: false)*//*

                              ))
                        },
                        child:
                        Padding(padding:EdgeInsets.only(left:10, right:10, top:10, bottom: 10),
                          child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape:
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              elevation: 50,
                              shadowColor: Colors.grey,
                              child: Column(children: [
                                *//*SizedBox(
                              width: double.infinity,
                              height: 200,
                              child:
                              //getView(payload15!.elementAt(index), index),

                            ) ,*//*
                                Padding(padding: EdgeInsets.only(left:10, top: 10), child:
                                Row(children: [*//*Image.network(
                              placeData![index]. as String, height: 40,
                              width: 40,),*//*
                                  Padding(padding: EdgeInsets.only(left: 15), child:
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text(placeData?.elementAt(index).username as String),
                                    Align(child: Text(placeData2![index].title as String,textAlign: TextAlign.left,),
                                      alignment: Alignment.topLeft,
                                    ),
                                    Align(child: Text(placeData2![index].body as String,textAlign: TextAlign.left,),
                                      alignment: Alignment.topLeft,
                                    ),

                                  ],),)
                                ],),),

                              ],


                              )
                            // child: getView(snapshot.data?.payload[index]!, index),
                          ),),);
                  },)*/,),]),),),),);}

}






