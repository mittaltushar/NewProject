import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:rama_puzle/CommunityPost.dart';
import 'package:rama_puzle/CustomColor.dart';
import 'package:rama_puzle/comment5.dart';
import 'package:rama_puzle/comment2.dart';
import 'package:rama_puzle/splash_screen.dart';
import 'package:rama_puzle/viewAllcommentbody.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'CommunityPostSend.dart';
import 'SizeConfig.dart';
import 'ViewComments.dart';
import 'homepagedata2.dart';
import 'package:http/http.dart' as http;

import 'HttpClient.dart';
import 'addPost.dart';
import 'body1.dart';


/*class CustomWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}*/
class RedBloodPost extends StatefulWidget{
  String? name;
  RedBloodPost({Key? key, required this.name});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return RedBloodSectionState (name: name);
  }

}

class RedBloodSectionState  extends State {
  //late VideoPlayerController videoPlayerController ;
  Future<CommunityPost>? data;
  String? name;
  RedBloodSectionState ({required this.name});
  String? comm_status;
  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  final int _numberOfPostsPerRequest = 10;
  late List<Payload> comments;
  late ScrollController _scrollController;
  final int _nextPageTrigger = 3;
  CommunityPost? communityModel;
  List<Payload15>? payload15;
  List<VideoPlayerController>? controllerList;

  getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string = await prefs.getString('auth-token');
    return string;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //String token = getSharedPreferences();
    //data = getHumanWelfarePost( '1', '10');
    //data = getCommunityPost();
    //deAddictionListApi()
    getAddCommStatus();
    controllerList = [];
    _pageNumber = 1;
    payload15 = [];
    _isLastPage = false;
    _loading = true;
    _error = false;
    _scrollController = ScrollController();
    _scrollController.addListener(() async{
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getCommunityPost();
      }
    });
    getCommunityPost();

  }

  getCommunityPost() async {
    final prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString('auth-token');
    print("authentication token is here___________$authToken");
    var headers = {
      'auth-token': '$authToken'
    };
    var request = http.MultipartRequest('POST', Uri.parse(humanWelfare));
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
        /*bool isContained = comments.any((element) => element.id.toString() == getDeAddictionListData!.payload![i].id.toString());
        print("checking is valid function here ${isContained}");
        if(isContained == true){
        }
        else{
          print("working this not");
          comments.add(getDeAddictionListData!.payload![i]);
        }*/
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
  }


  getView(Payload15? payload, int index) {
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
      _chewieController = ChewieController(/*fullScreenByDefault: true,*/
        videoPlayerController: _videoPlayerController,
        autoPlay: false, // Auto play the video
        looping: true, // Loop the video playback
        // Other ChewieController configurations as needed
      );
      controllerList?.add(_videoPlayerController);
      return Chewie(controller: _chewieController) ;
    }}
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

  getAddCommStatus() async{
    final prefs =  await SharedPreferences.getInstance();

// set value
    /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);
    await prefs.setBool('isLogin', true);
    await prefs.setString('profile_name', data.payload.name);*/
    String? com;
    com = await prefs.getString('add_community_post');
    comm_status = com;
    setState(() {

    });


//
  }

  @override
  void dispose() {
    // Dispose of the video player controller to stop video playback.
    for (int i = 0; i < controllerList!.length; i++) {
      controllerList?.elementAt(i).dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp( debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        Widget error = Text(name!, style: TextStyle(color: Colors.white),);
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
          backgroundColor: ColorConstants.backgroundColor,
          centerTitle: true,
          title: Text(name!,style: /*GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20, fontWeight: FontWeight.w800
            ),*/
          TextStyle(color: Colors.white, fontFamily: 'Poppins',
              fontSize: 20, fontWeight:  FontWeight.w800)

          ),
          leadingWidth: 30,
          actions: [

            if (comm_status != null && comm_status!.contains("YES"))
              InkWell(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommunityPostSend(i: 1,)));
              }, child:
              Icon(Icons.add_circle_outline_rounded,
                color: Colors.white,
              ),)
            /* IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  // Implement logout functionality

                },
              )*/
            /* else
              IconButton(
                icon: Icon(Icons.login),
                onPressed: () {
                  // Implement login functionality
                },
              ),*/

            /*if (comm_status!.contains("YES")) {

                InkWell(onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPost()));
                }, child:
                Icon(Icons.add_circle_outline_rounded,
                  color: Colors.white,
                ),)
              }*/
            /*prefs =  await SharedPreferences.getInstance();

// set value
            await prefs.setInt('user_id', data.payload.id);
        await prefs.setString('auth-token', data.payload.authToken);
    await prefs.setBool('isLogin', true);
    await prefs.setString('profile_name', data.payload.name);
    await prefs.setString('add_community_post', data.payload.addCommunityPost);*/
//

          ],      leading: Padding(padding: EdgeInsets.only(left: 10),
            child:GestureDetector(
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
            ),),),
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
              payload15 == null ?  const Center(
                child: CircularProgressIndicator(
                  semanticsLabel: 'Circular progress indicator',color: ColorConstants.backgroundColor,
                ),
              ):payload15!.isEmpty ? const Text("No Data Found"):Expanded(
                child:
                ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: payload15!.length + (_isLastPage ? 0 : 1),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(padding:EdgeInsets.only(left:10, right:10, top:10, bottom: 10),
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
                            SizedBox(
                              width: double.infinity,
                              height: 200,
                              child:
                              getView(payload15!.elementAt(index), index),

                            ) ,
                            Padding(padding: EdgeInsets.only(left:10, top: 10), child:
                            Row(children: [Image.network(
                              payload15![index].profileImg as String, height: 40,
                              width: 40,),
                              Padding(padding: EdgeInsets.only(left: 15), child:
                              Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text(payload15![index].name as String),
                                Align(child: Text(payload15![index].createdTime as String,textAlign: TextAlign.left,),
                                  alignment: Alignment.topLeft,
                                )],),)
                            ],),),
                            Align(child:Padding(padding: EdgeInsets.only(left: 67, right: 10, top: 10),
                                child:Text(formatHtmlString(payload15![index].caption as String))),
                              alignment: Alignment.topLeft,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                        // ViewAllCommentsBody(post_Id:  snapshot?.data!.payload[index].id.toString() )
                                        //Comment6()
                                        ViewComments(post_Id:payload15![index].id.toString(), choice: 0, videoId: '', videoTopicId: '',),));

                                    /* Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                  // ViewAllCommentsBody(post_Id:  snapshot?.data!.payload[index].id.toString() )
                                  *//*Comment6()*//*
                                  ViewComments(post_Id: snapshot?.data!.payload[index].id.toString()),));*/


                                    //Comment1(postid: snapshot?.data!.payload[index].id.toString())
                                    /*VideoDisplay(category_id: 0,
                  sub_category_id: "", sub_name: "",)*/
                                  },child:
                                Padding(padding: EdgeInsets.only( left: 10, bottom: 10, top: 10),child:
                                Text('View All' ,
                                  style: /*GoogleFonts.poppins(color: ColorConstants.backgroundColor,
                                  fontSize: 13, fontWeight: FontWeight.w600
                              )*/
                                  TextStyle(color: ColorConstants.backgroundColor, fontFamily: 'Poppins',
                                      fontSize: 13, fontWeight:  FontWeight.w600),


                                  /*style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )*/),),),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>              //Comment6()
                                        ViewComments(post_Id: payload15![index].id.toString(), choice: 0, videoId: '', videoTopicId: '',),));
                                    //Comment1(postid: snapshot?.data!.payload[index].id.toString())
                                    /*VideoDisplay(category_id: 0,
                  sub_category_id: "", sub_name: "",)*/
                                  },child:
                                Padding(padding: EdgeInsets.only(right:10, bottom: 10, top: 10),child:

                                Text('Comments ' + (payload15![index].commentsCount.toString()).toString(),
                                    style:/* GoogleFonts.poppins(color: ColorConstants.backgroundColor,
                                  fontSize: 13, fontWeight: FontWeight.w600
                              )*/
                                    TextStyle(color: ColorConstants.backgroundColor, fontFamily: 'Poppins',
                                        fontSize: 13, fontWeight:  FontWeight.w600)
                                  /*style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )*/)),)
                              ],)
                          ],


                          )
                        // child: getView(snapshot.data?.payload[index]!, index),
                      ),);
                  },),),]),),),),);}

}






class ViewWidget extends StatefulWidget{
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late String url;

  ViewWidget({required String? url});

  @override

  // TODO: implement createState
  MyViewWidget createState() => MyViewWidget(url:url!);

}

class Body4 extends StatefulWidget {
  bool isLogin = false;

  Body4({Key? key, required this.isLogin}) : super(key: key);

  Body6 createState() => Body6( isLogin1: isLogin);
}

class Body6 extends State {
  ScrollController scrollController = ScrollController();
  bool isLogin1 = false;
  Future<HomePageData>? homePageData;
  Future<CommunityPost>? communityPost;

  //List<Payload2>? payload2;
  double pixel = 0;

  Body6({Key? key, required this.isLogin1});

  AppBar? appbar;

  void initState() {
    //scrollController.addListener(_onScrollEvent);
    super.initState();
    print(/*communityPostData.payload15.length*/'axb');
    //homePageData = fetchHomeData();
    //communityPost = getCommunityPost('user_H14YjA0keNv53QZ', '1', '10');
    communityPost = getCommunityPost(/*'user_H14YjA0keNv53QZ'*/'1', '10');
    //homePageData = fetchHomeData();
    // payload2 = getAges1();
    //populateDropDowns2();


    //appbar = MyAppBar(payload: payload2, isScroll: false) as AppBar;
    /*appbar
    AppBar(

      elevation: 0,
      actions: [
      ],
    ),
*/
  }

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery
        .of(context)
        .size;

    // it enable scrolling on small device
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        Widget error = const Text(
          '    ', style: TextStyle(color: Colors.white),);
        //Widget error = Container(decoration: ,);
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw ('widget is null');
      },
      home: Scaffold(

          body: Container(

            height: 160,
            margin: EdgeInsets.only(top: 130),

            /*  child: FutureBuilder<HomePageData>(
                            future: homePageData,
*/
            child: FutureBuilder<CommunityPost>(
              future: communityPost,
              builder: (context, snapshot) {


                /*ErrorWidget.builder*/
                //if (snapshot.data) {
                return

                  ListView.builder(

                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.payload.length,
                    //   itemCount: 10,
                    itemBuilder: (context, index) {
                      String? st = snapshot.data?.payload[index].postUrl;
                      return
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10), child:
                        Container(
                          height: 350,
                          width: 350,
                          child: Text(st!),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),

                            /*image: DecorationImage(

                                    image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl! as String),

                                    fit: BoxFit.cover,
                                    )*/),),);
                    }
                    ,
                  );
              },
            ),)
        /* body: Container(
    width: 400,
    height: double.infinity,
    alignment: Alignment.center,
    ),*/
      ),);
  }
}





class MyViewWidget extends State{
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  String? url;
  MyViewWidget({required String url});
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      url!,
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true, // Auto play the video
      looping: true, // Loop the video playback
      // Other ChewieController configurations as needed
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController) ;

    /*Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }*/
  }

}
class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Future<CommunityPost> communityPost;
  Future<HomePageData>? homePageData;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      'http://techslides.com/demos/sample-videos/small.mp4',
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true, // Auto play the video
      looping: true, // Loop the video playback
      // Other ChewieController configurations as needed
    );
    homePageData = fetchHomeData();
    //communityPost = getCommunityPost('user_H14YjA0keNv53QZ', '1', '10');
  }

  getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;
  }



  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),  // this below bracket
        body:
        Container(child:
        FutureBuilder<HomePageData>(
            future: homePageData,
            builder: (context, snapshot) {
              return
                ListView.builder(

                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.payload.banners.length,
                    itemBuilder: (context, index) {
                      int? text = snapshot.data?.payload.banners[index].id;
                      Text(text.toString());

                      return
                        ViewWidget(url:snapshot.data?.payload.banners[index].imageUrl);
                    }



                );}),)
      //above bracket
    );}}

/*@override
  Widget build(BuildContext context) {
    // TODO: implement build
 //   throw UnimplementedError();

  }
}
*/

/*Center,

        child: ViewWidget()*//*Chewie(
          controller: _chewieController,
        ),*//*
      )*/

