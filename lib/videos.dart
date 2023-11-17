/*




import 'dart:ffi';


import 'package:chewie/chewie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama_puzle/CustomColor.dart';

import 'package:html/parser.dart';
import 'HttpClient.dart';
import 'TopicData.dart';
import 'package:rama_puzle/CommunityPost.dart';

//import 'package:flutter_html/flutter_html.dart';

class Videos extends StatefulWidget {
  final int category_id;
  final String? sub_category_id;
  final String? sub_name;
  final String? description;
  const Videos({Key? key, required this.category_id, required this.sub_category_id
    , required this.sub_name, required this.description
  }) : super(key: key);

  // TODO: implement createState
  //throw UnimplementedError();
  @override
  State<Videos> createState() => VideosMaterial(category_id: category_id, sub_category_id: sub_category_id,
      sub_name: sub_name, description: description
  );
}

*/
/*
class VideoWidget extends StatefulWidget {

  final bool play;
  final String url;

  const VideoWidget({required Key key, required this.url, required this.play})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

*//*
*/
/*

*//*

*/
/*
class _VideoWidgetState extends State {
  late VideoPlayerController videoPlayerController ;
  Future<void>? _initializeVideoPlayerFuture;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  late int _numberOfPostsPerRequest = 10;
  late String token_number;
  Future<CommunityPost>? data;
*//*
*/
/*



  *//*

*/
/*@override
  void initState() {
    super.initState();
  //  final prefs =  await SharedPreferences.getInstance();
    getSharedPreference();
// set value


    _pageNumber = 1;
    _numberOfPostsPerRequest = 10;
    data = getCommunityPost(token_number, _pageNumber.toString(), _numberOfPostsPerRequest.toString());
    //videoPlayerController = new VideoPlayerController.network(widget.url);


_initializeVideoPlayerFuture = videoPlayerController?.initialize().then((_) {
      //       Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });

  } // This closing tag was missing

  @override
  void dispose() {
    videoPlayerController?.dispose();
    //    widget.videoPlayerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: homePageData,

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return new Container(

            child: Card(
              key: new PageStorageKey(widget.url),
              elevation: 5.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chewie(
                      key: new PageStorageKey(widget.url),
                      controller: ChewieController(
                        videoPlayerController: videoPlayerController,
                        aspectRatio: 3 / 2,
                        // Prepare the video to be played and display the first frame
                        autoInitialize: true,
                        looping: false,
                        autoPlay: false,
                        // Errors can occur for example when trying to play a video
                        // from a non-existent URL
                        errorBuilder: (context, errorMessage) {
                          return Center(
                            child: Text(
                              errorMessage,
                              //style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else {
          return Center(
            child: CircularProgressIndicator(),);
        }
      },
    );
  }
}*//*
*/
/*


class VideosMaterial extends State<Videos> {
  final int category_id;
  final String? sub_category_id;
  final String? sub_name;
  final String? description;
  int chapterCount =0  ;
  VideosMaterial({Key? key, required this.category_id, required this.sub_category_id, required this.sub_name
    , required this.description});

  Future<TopicList>? topicData;
  Future<CommunityPost>? communityPost;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //final prefs =  await SharedPreferences.getInstance();
    //getSharedPreferences();
    communityPost = getCommunityPost(getSharedPreferences(), "1", '10');
    //topicData = getTopicList( "$category_id", sub_category_id!);
  }

  getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string = await prefs.getString('auth-token');
    return string;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 400,
        height: double.infinity,
        margin: EdgeInsets.only(top: 130),

    child: FutureBuilder<CommunityPost>(
    future: communityPost,

    builder: (context, snapshot) {


    *//*

*/
/*ErrorWidget.builder

    if (snapshot.data?.payload.length > 0) {*//*
*/
/*

    return

    ListView.builder(

    scrollDirection: Axis.vertical,
    itemCount: snapshot.data?.payload.length,
    itemBuilder: (context, index) {
    return
    Padding(
    padding: EdgeInsets.only(left: 10, right: 10), child:
    Container(
    height: 200,
    width: 400,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
   *//*

*/
/* image: DecorationImage(

    image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl! as String),

    fit: BoxFit.cover,
    )*//*
*/
/*

    ),
    child:


   *//*

*/
/* Column(
    children: [
    //getView(snapshot, index)

*//*
*/
/*

    }
}
*//*

*/
/*
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }
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
    return MaterialApp(
      home:
      Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConstants.backgroundColor,
          centerTitle: true,
          leadingWidth: 30,

          leading: Padding(padding: EdgeInsets.only(left: 10),
            child:Image.asset(
              "assets/images/back_arrow.png", height: 10,
              width: 10,),),
          title: Text('Video',style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20, fontWeight: FontWeight.w800
          ),

          ),
          actions: [
          Padding(padding: EdgeInsets.only(left: 25),
          child: DropdownButtonHideUnderline(
          //child: Expanded(
          child: Image.asset(
            "assets/images/back_arrow.png", height: 20,
            width: 20,),)
            ],
        ),
        body:

            Container(margin: EdgeInsets.only(top:15, left:5,),

    child: FutureBuilder<HomePageData>(
    future: homePageData,

    builder: (context, snapshot) {
      return
    ListView.builder(
      scrollDirection: Axis.horizontal,
    itemCount: snapshot.data?.payload.banners.length,
      itemBuilder: (context, index) =>
      Container(
    width: double.infinity,
    height: 350.0,
    child: ,
    )
    )
    }

    }

    ErrorWidget.builder
    //if (snapshot.data) {
    return

    ListView.builder(

    scrollDirection: Axis.vertical,
    itemCount: snapshot.data?.payload.banners.length,
    itemBuilder: (context, index) {

    return
    Padding(padding: EdgeInsets.only( left: 10,right: 10),child:
    Container(
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
    //margin: EdgeInsets.only(top: 10, left: 10, right: 10),
    child: Column(
    children: [
      VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    ],
    ))
    child: ,
    height: 350,
    width: 350,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    image: DecorationImage(

    image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl! as String),

    fit: BoxFit.cover,

    )

        Column(
          children: <Widget>[
            Container(child:
            Align(
              alignment: Alignment.topCenter,
              child:
              Padding(
                padding: EdgeInsets.only(left: 10),
                child:
                Text(sub_name!, textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(color: Colors.white,
                      fontSize: 20, fontWeight: FontWeight.w800
                  ),),),),),
            style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )
             Align(
              alignment: Alignment.topLeft,
              child:
              Padding(padding: EdgeInsets.only(left: 10),child:
              Text("$chapterCount" + " " + "chapters",textAlign: TextAlign.left,
                style: GoogleFonts.poppins(color: Colors.white,
                    fontSize: 14, fontWeight: FontWeight.w800
                ),),),),

            Container(
              height:MediaQuery.of(context).size.height * .8162,
              margin: EdgeInsets.only(right:10.0, top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),

              ),

              child:
              Column(
                children:[
                  Padding(padding: EdgeInsets.only(left: 10),child:
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Text("Description",textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(color: Colors.black,
                          fontSize: 18, fontWeight: FontWeight.w800
                      ),),),),


                  Container(
                    margin: EdgeInsets.only(top: 10),

                    child:

                                     String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
    }
                    //  Html(data:description)
                    Text(formatHtmlString(description!))

                    FutureBuilder<TopicList>(
                        future: topicDatagetTopicList( "$category_id", sub_category_id!),
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
                                    height: ,
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
                                          Text(snapshot.data?.payload[index].title as String,
                                            style: GoogleFonts.poppins(color: ColorConstants.backgroundColor, fontWeight: FontWeight.w700, fontSize: 16),)),),)
                                      ],)
                                  ),

                                  );});}),),

                  Spacer(),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(padding: EdgeInsets.only(left: 17, right: 17, top: 4, bottom: 20),
                      child:   Container(

                        width: 400,
                        child: ElevatedButton(

                          child: Text("Sign In"),
                          onPressed: () {
                             =>

                              setState(() {
    if (_form!.currentState!.validate()) {

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()))
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

     image: DecorationImage(

                                image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl! as String),

                                fit: BoxFit.cover,


                              }

                          )



child: FutureBuilder<>{required String future},
                  future: ,
builder: (context, snapshot) {
                    return ListView.builder(scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.payload.latestQuiz.length,
                        itemBuilder: (Context, index) {

                        })
                  }
child:Padding(padding: EdgeInsets.only(top:10),child:
                  Text('Latest Quiz' ,
                      style: GoogleFonts.poppins(
                          fontSize: 17, fontWeight: FontWeight.w800
                      )
                    style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )),)



style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )



],
          ),
        )
    );
    throw UnimplementedError();
  }

}




import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rama_puzle/CommunityPost.dart';
import 'package:rama_puzle/HomePageData';
import 'package:rama_puzle/profile.dart';
import 'package:rama_puzle/quizGrid.dart';
import 'package:rama_puzle/studyMaterialGrid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import 'AgeModel.dart';
import 'CustomColor.dart';
import 'HttpClient.dart';
import 'Login.dart';

class VideoParent extends StatefulWidget {
  bool isLogin = false;

  VideoParent({Key? key, required this.isLogin}) : super(key: key);

  Videos createState() => Videos(pageNo: 1, limit: 10);
}

class VideoWidget extends StatefulWidget {

  final bool play;
  final String? url;

  VideoWidget({Key? key, required this.url, required this.play})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}


class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController videoPlayerController ;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController = new VideoPlayerController.network(widget.url!);

    _initializeVideoPlayerFuture = videoPlayerController?.initialize().then((_) {
      //       Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
  } // This closing tag was missing

  @override
  void dispose() {
    videoPlayerController?.dispose();
    //    widget.videoPlayerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return new Container(

            child: Card(
              key: new PageStorageKey(widget.url),
              elevation: 5.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chewie(
                      key: new PageStorageKey(widget.url),
                      controller: ChewieController(
                        videoPlayerController: videoPlayerController,
                        aspectRatio: 3 / 2,
                        // Prepare the video to be played and display the first frame
                        autoInitialize: true,
                        looping: false,
                        autoPlay: false,
                        // Errors can occur for example when trying to play a video
                        // from a non-existent URL
                        errorBuilder: (context, errorMessage) {
                          return Center(
                            child: Text(
                              errorMessage,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else {
          return Center(
            child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
//  const Body2({Key? key}) : super(key: key);

@override
  Body3 createState() => Body3( isLogin1: isLogin);

  @override
  Body1 createState() => Body1();



class Videos extends State {
  ScrollController scrollController = ScrollController();
  bool isLogin1 = false;
  Future<HomePageData>? homePageData;
  Future<CommunityPost>? communityPost;
  List<Payload2>? payload2;
  double pixel = 0;

  Videos({Key? key, required this.pageNo, required this.limit});

  AppBar? appbar;

  int pageNo;
  int limit;


  getView(AsyncSnapshot<CommunityPost> obj, int index) {
    if (obj.data?.payload[index].postType.name == 'IMAGE') {
      String? path = obj.data?.payload[index].postUrl;
      return Container(
          child:
          Image.network(path!)
      );
    }
    else {
      return VideoWidget(play: true, url: obj.data?.payload[index].postUrl);
    }
  }

   getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string = await prefs.getString('auth-token');
    return string;
  }

  void initState() {
    scrollController.addListener(_onScrollEvent);
    super.initState();

    communityPost = getCommunityPost(
getSharedPreferences()
"user_tLIlKZN6pSP5OfJ", pageNo.toString(), limit.toString());
 homePageData = fetchHomeData();
    // payload2 = getAges1();
    populateDropDowns2();



    //appbar = MyAppBar(payload: payload2, isScroll: false) as AppBar;
appbar
    AppBar(

      elevation: 0,
      actions: [
      ],
    ),


  }

  void _onScrollEvent() {
//    pixel = scrollController.position.pixels;
    //price: double.tryParse(pixels.get('pri  ce').toString()) ?? 0,
    setState(() {

    });
  }

  NetworkImage getImage(String str) {
    return NetworkImage(str);
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
      home:
      Scaffold(

        body:

        Container(
          width: 400,
          height: double.infinity,
          margin: EdgeInsets.only(top: 130),

          child: FutureBuilder<CommunityPost>(
            future: communityPost,

            builder: (context, snapshot) {


ErrorWidget.builder

              if (snapshot.data?.payload.length > 0) {
              return

                ListView.builder(

                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.payload.length,
                  itemBuilder: (context, index) {
                    return
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10), child:
                      Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
image: DecorationImage(

                                              image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl! as String),

                                              fit: BoxFit.cover,
                                            )
),
                          child:
                          Column(
                            children: [
                              getView(snapshot, index)


                            ],
                          )
                      ),);
                  }
                  ,
                );
            },
          ),) //18002100018


        ,),);
  }
}
*//*
*/
/*

*/
