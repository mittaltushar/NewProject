import 'dart:async';

import 'package:flutter/material.dart';

import 'package:rama_puzle/CommunityPost.dart';
import 'package:rama_puzle/CustomColor.dart';
import 'package:rama_puzle/comment.dart';
import 'package:rama_puzle/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


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
class CommunitySection1 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return CommunitySectionState2();
  }
}

class CommunitySectionState2 extends State {
  //late VideoPlayerController videoPlayerController;
  Future<CommunityPost>? data;
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string = await prefs.getString('auth-token');
    return string;
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //String token = getSharedPreferences();
    data = getCommunityPost( '1', '10');
  }

  getView(Payload15? payload, int index) {
   /* late VideoPlayerController _videoPlayerController;
    late ChewieController _chewieController;
*/
   /* if (payload?.postType == 'IMAGE') {
      String? url = payload?.postUrl;
      return Image.network(url!, fit: BoxFit.fill,);
    }*/
      String? url = payload?.postUrl;
      _videoPlayerController = VideoPlayerController.network(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"
      );
      _chewieController = ChewieController(/*fullScreenByDefault: true,*/
        videoPlayerController: _videoPlayerController,
        autoPlay: false, // Auto play the video
        looping: false, // Loop the video playback
        // Other ChewieController configurations as needed
      );
      return Chewie(controller: _chewieController) ;
    }
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
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


      home:
      Scaffold(
        appBar:  AppBar(elevation: 0,
          backgroundColor: ColorConstants.backgroundColor,
          centerTitle: true,
          leadingWidth: 30,
          actions: [
            InkWell(onTap:()  {

             /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPost(i: 0,)));*/

            },child:
            Icon(Icons.add_circle_outline_rounded,
              color: Colors.white,
            ),)
          ],      leading: Padding(padding: EdgeInsets.only(left: 10),
            child:GestureDetector(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                //prefs = await SharedPreferences.getInstance();

                String? lang = await prefs.getString('lang');
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Body2(isLogin: false, )));
              },child:

            Image.asset("assets/images/back_arrow.png", height: 20,
              width: 20,)
              ,
              //children: <Widget>[Text("fjkff")],
            ),),),
        body:
        Container(
          height: 800,

          child: /*getView(null, 0)*/ FutureBuilder<CommunityPost>(
              future: data,
              builder: (context, snapshot) {
                //String count = snapshot.data?.payload.length as String,
                return

                  getView(snapshot.data?.payload.first, 0);
                    }),),),);}

}






/*
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
    print(*/
/*communityPostData.payload15.length*//*
'axb');
    //homePageData = fetchHomeData();
    //communityPost = getCommunityPost('user_H14YjA0keNv53QZ', '1', '10');
    communityPost = getCommunityPost(*/
/*'user_H14YjA0keNv53QZ'*//*
'1', '10');
    //homePageData = fetchHomeData();
    // payload2 = getAges1();
    //populateDropDowns2();


    //appbar = MyAppBar(payload: payload2, isScroll: false) as AppBar;
    */
/*appbar
    AppBar(

      elevation: 0,
      actions: [
      ],
    ),
*//*

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

            */
/*  child: FutureBuilder<HomePageData>(
                            future: homePageData,
*//*

            child: FutureBuilder<CommunityPost>(
              future: communityPost,
              builder: (context, snapshot) {


                */
/*ErrorWidget.builder*//*

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

                            */
/*image: DecorationImage(

                                    image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl! as String),

                                    fit: BoxFit.cover,
                                    )*//*
),),);
                    }
                    ,
                  );
              },
            ),)
        */
/* body: Container(
    width: 400,
    height: double.infinity,
    alignment: Alignment.center,
    ),*//*

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

    */
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
  }*//*

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
        title: Text('Video Player'),
      ),
      body:
      Container(child:
      FutureBuilder<HomePageData>(
          future: homePageData*/
/*getCommunityPost('user_H14YjA0keNv53QZ', '1', '10')*//*
,
          builder: (context, snapshot) {
            return
              ListView.builder(

                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.payload.banners.length,
                  itemBuilder: (context, index) {
                    int? text = snapshot.data?.payload.banners[index].id;
                    Text(text.toString());
                    */
/*if (snapshot.data?.payload[index].postUrl == 'VIDEO') {
    return
    ViewWidget(url:snapshot.data?.payload[index].postUrl);
    }*//*

                  }


              );}),),);}}

*/
/*@override
  Widget build(BuildContext context) {
    // TODO: implement build
 //   throw UnimplementedError();

  }
}
*//*


*/
/*Center,

        child: ViewWidget()*//*
*/
/*Chewie(
          controller: _chewieController,
        ),*//*
*/
/*
      )*//*


*/
