
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rama_puzle/CustomColor.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'HttpClient.dart';
import 'VideoData.dart';
import 'ViewComments.dart';
import 'new_modules/de_addiction_community/components/view_all_comments_body.dart';

class PlayVideo extends StatefulWidget {
   final String video_url;
  final String video_id;
  final String video_topic_id;
  final VideoData video_data;
  const PlayVideo({Key? key,required this.video_url, required this.video_data, required this.video_topic_id, required this.video_id}) : super(key: key);
  @override
  State<StatefulWidget> createState()
    // TODO: implement createState
    //throw UnimplementedError();
  => VideoPlayer1(video_url: video_url, video_data: video_data, video_id: video_id, video_topic_id: video_topic_id);
}

class VideoPlayer1 extends State<PlayVideo> {
  String? video_url;
  VideoData? video_data;
  final String video_id;
  final String video_topic_id;
  String? varvi = "https://www.youtube.com/watch?v=feQhHStBVLE&t=737s";

  //Future<void>? _initializeVideoPlayerFuture;
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  VideoPlayer1({required this.video_url, required this.video_data, required this.video_id, required this.video_topic_id});

  int? index1 = 1;

  late YoutubePlayerController controller;

  /*getContact() async {
    ContactInfo data = await getContactInfo();

    setState(() {
      contactInfo = data;
      // _remainingTime = data.payload[0].topicTime;
    });
    //_startTimer();
  }*/

  /* _videoPlayerController = VideoPlayerController.network(
  url!,
  );
  _chewieController = ChewieController(
  videoPlayerController: _videoPlayerController,
  autoPlay: true, // Auto play the video
  looping: true, // Loop the video playback
  // Other ChewieController configurations as needed
  );}*/
  getVideoData2() async {
    //video_data = getVideoData(video_topic_id!, video_id!);
    /*setState(()  {
      _videoPlayerController = VideoPlayerController.network(
        //video_data?.payload.videoUrl as String,
          'http://techslides.com/demos/sample-videos/small.mp4'
      );
      */ /*_initializeVideoPlayerFuture = */ /*

      print(video_data);
    });
    await _videoPlayerController?.initialize();*/
    /*setState(() {
      video_data = video_data;
    });*/
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  getView(String url, int index) {

    /*if (payload?.postType == 'IMAGE') {
      String? url = payload?.postUrl;
      return Image.network(url!, fit: BoxFit.fill,);
    }*/


    if (index1 != 0) {
      String? url1 = url;
      _videoPlayerController = VideoPlayerController.network(
        /*url!*/
          "https://www.youtube.com/watch?v=NBODl6sTxjk.mp4"
      );
      _chewieController = ChewieController(/*fullScreenByDefault: true,*/
        videoPlayerController: _videoPlayerController,
        autoPlay: true, // Auto play the video
        looping: true, // Loop the video playback
        // Other ChewieController configurations as needed
      );
      index1 = 0;
      return Chewie(controller: _chewieController);
    }
  }


  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(video_url!)!,
        flags: const YoutubePlayerFlags(
            mute: false,
            loop: false,
            autoPlay: true
        ))
    ;
    //video_data = getVideoData(video_topic_id!, video_id!);
    //getVideoData2();
    /*  setState(() {

      controller.load(YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=GQyWIur03aw")!, startAt: 0);
      controller.play();
      //varvi = video_data?.payload.videoUrl;
      */ /*controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=GQyWIur03aw")!,
          flags: const YoutubePlayerFlags(
              mute: false,
              loop: false,
              autoPlay: true
          ));*/ /*
      //controller.load(varvi!);
    });*/
    // getVideoData2();

    /*  video_data = getVideoData(video_topic_id!, video_id!);
    setState(() {

    });*/
    /*  String? url = video_data?.payload.videoUrl;
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=feQhHStBVLE&t=737s")!,
        flags: const YoutubePlayerFlags(
            mute: false,
            loop: false,
            autoPlay: true
        ))
    ;*/

    /* setState(() {
      varvi = video_data!.payload.videoUrl;
      controller = controller;
    });*/
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  youtubeVideo(String url) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (context, player) => Scaffold(body: player,));
  }

  String formatHtmlString(String string) {
    return string
        .replaceAll("<p>", "") // Paragraphs
        .replaceAll("</p>", "").replaceAll("<br />", "") // Line Breaks
    /*.replaceAll("\"", "&quot;") // Quote Marks
        .replaceAll("'", "&apos;") // Apostrophe
        .replaceAll(">", "&lt;") // Less-than Comparator (Strip Tags)
        .replaceAll("<", "&gt;") */// Greater-than Comparator (Strip Tags)
        .trim(); // Whitespace
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    //late VideoPlayerController _videoPlayerController;
    late ChewieController _chewieController;
    String? url;
    /*_videoPlayerController = VideoPlayerController.network(
        video_data?.payload.videoUrl as String
    );*/

    //String? url = video_data?.payload.videoUrl;
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(video_url!)!,
        flags: const YoutubePlayerFlags(
            mute: false,
            loop: false,
            autoPlay: false
        ))
    ;
    return
      WillPopScope( onWillPop: () async {
        // Handle the back button press here
        // Return true to allow the back navigation, or false to prevent it
        // For example:
         Navigator.of(context).pop();  // Close the current screen
        return false;
      },child:      MaterialApp(

    home: Scaffold(body:
    Column(
      children: [
    YoutubePlayerBuilder(
    player: YoutubePlayer(
    controller: controller,
      // Other player configurations
    ),
    builder: (context, player) {
    return Column(
    children: [
    // Place the YouTube player here
    player,
    SizedBox(height: 8),
      Padding(padding: const EdgeInsets.fromLTRB(10.0, 20.0, 12.0, 6.0),child:
      Align(alignment: Alignment.topLeft,child:Text(
        video_data!.payload.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),),),// Add some spacing
    Padding(padding: const EdgeInsets.fromLTRB(10, 10.0, 12.0, 6.0),child:Align(alignment:
    Alignment.topLeft,child:Text(
      formatHtmlString(video_data!.payload.description)
    ,
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
    ),),),
      GestureDetector(
        onTap:() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewComments(post_Id: '1', choice: 1, videoId: video_id, videoTopicId: video_topic_id,)));
                     // PdfList(title: title!,study_id: topic_id)));
      },
        child:
      Padding(padding: const EdgeInsets.fromLTRB(10.0, 20.0, 12.0, 6.0),child:
      Align(alignment: Alignment.topLeft,child:Text(
        'View All Comments',
        style: TextStyle(color: ColorConstants.backgroundColor,fontSize: 16, fontWeight: FontWeight.w700),
      ),),),)

    // Other text content
    ],
    );
    }),]),),),);}}
    //return youtubeVideo(varvi!);


     // getView("url", 0);

    /*FutureBuilder(
      future: video_data,
      builder: (context, snapshot)
    {
      //getView(snapshot.data!.payload.videoUrl, 1);
      if (snapshot.data != null) {
        if (snapshot.data!.payload.videoUrl.contains(".mp4")) {
          return getView(snapshot.data!.payload.videoUrl+".mp4", 1);
        }
        return youtubeVideo(snapshot.data!.payload.videoUrl);
      }*/
        //return getView(snapshot.data!.payload.videoUrl+".mp4", 1);

     /* else {
        return CircularProgressIndicator();*/

    /*  if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _videoPlayerController?.value.aspectRatio as double,
            child: */ /*VideoPlayer(_videoPlayerController!)*/ /*
            Chewie(controller: ChewieController(fullScreenByDefault: true,
              videoPlayerController: _videoPlayerController!,
              autoPlay: true, // Auto play the video
              looping: true, // Loop the video playback
              // Other ChewieController configurations as needed
            ),),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
*/

/*_chewieController = ChewieController(fullScreenByDefault: true,
      videoPlayerController: _videoPlayerController,
      autoPlay: true, // Auto play the video
      looping: true, // Loop the video playback
      // Other ChewieController configurations as needed
    );

    return Chewie(controller: _chewieController);*/
