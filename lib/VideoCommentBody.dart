import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rama_puzle/commentData.dart';
import 'package:rama_puzle/VideoCommentData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../CustomColor.dart';

import 'package:http/http.dart'as http;

import 'SizeConfig.dart';





class VideoCommentBody extends StatefulWidget {
  String? post_Id;
  String? video_topic_id;
  String? video_id;
  VideoCommentBody({super.key,required this.post_Id, required this.video_topic_id, required this.video_id});

  @override
  State<VideoCommentBody> createState() => VideoCommentBody2(post_Id: post_Id, video_topic_id: video_topic_id, video_id: video_id
  );
}

class VideoCommentBody2 extends State<VideoCommentBody> {
  String? post_Id;
  String? video_topic_id;
  String? video_id;
  TextEditingController addCommentController = TextEditingController();
  TextEditingController addReplyController = TextEditingController();
  late CommentData commentData;
  late VideoCommentData videoCommentData;
  //ViewAllCommentsModel? getAllCommentsData;
  VideoCommentBody2({required this.post_Id, required this.video_topic_id, required this.video_id});
  //List<Reply>? getData;
  String? commentId;
  allVideos() async {
    //print("++++++++++++++++++++++++++++++++++$getData");
    print("_________________This is post id${widget.post_Id}");
    final prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString('auth-token');
    print("authantication token is here___________$authToken");
    var headers = {
      'auth-token': authToken!
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://www.ramapuzzle.com/api/v1/user/getAllVideoComments'));
    request.fields.addAll({
      'video_topic_id': widget.video_topic_id!,
      'video_id': widget.video_id!,
      'page': '1',
      'limit': '10'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      // final jsonResponse = ViewAllCommentsModel.fromJson(jsonDecode(finalResponse));
      //jsonResponse =
      //CommentData data = CommentData.fromJson(jsonDecode(finalResponse));
      VideoCommentData data = VideoCommentData.fromJson(jsonDecode(finalResponse));
      setState(() {
        videoCommentData = data;
        //commentData= data;
        //getData;
        //print('this is over reply___________$getData');
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }


  clear(){
    addCommentController.clear();
    addReplyController.clear();
  }


  addCommentComuPostApi(String postId, String content, Function function) async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //a/wait prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;
    final response = await http.post(Uri.parse('https://www.ramapuzzle.com/api/v1/user/addVideoComment'),
        encoding: Encoding.getByName("utf-8"),
        body: {
          'post_id':postId,
          'content': content
        }, headers: {"auth-token": token!});

    //SubmissionSuccess nationalityData =
    //submissionSuccessFromJson(response.body);
    //getAllCommentData(postId, '1', '1', '10', function);
    //deAddictionCommentListApi();
    allVideos();
    //return nationalityData;
  }

  addReplay() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    //a/wait prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;
    final response = await http.post(Uri.parse('http://www.ramapuzzle.com/api/v1/user/addVideoComment'),
        encoding: Encoding.getByName("utf-8"),
        body: {
          'post_id':widget.post_Id!,
          'content': addReplyController.text,
        }, headers: {"auth-token": token!});

    //SubmissionSuccess nationalityData =
    //submissionSuccessFromJson(response.body);
    //getAllCommentData(postId, '1', '1', '10', function);
    //deAddictionCommentListApi();
    allVideos();
    if (response.statusCode == 200) {
      setState(() {
      });
      Fluttertoast.showToast(msg: 'Replay added successfully');
    }else{
      Fluttertoast.showToast(msg: 'Not added');
    }
  }

  addCommentsApi() async {
    final prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString('auth-token');
    print("authantication token is here___________$authToken");
    var headers = {
      'auth-token': authToken!
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://www.ramapuzzle.com/api/v1/user/addVideoComment'));
    request.fields.addAll({
      'video_topic_id': widget.video_topic_id!,
      'video_id': widget.video_id!,
      'content': addCommentController.text,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var finalResponse = await response.stream.bytesToString();
      final jsonResponse =  json.decode(finalResponse);
      if(jsonResponse ['type'] == 'SUCCESS'){
        clear();
        //deAddictionCommentListApi();
        allVideos();
        setState(() {
        });
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
      }else{
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
      }
    }
    else {
      print(response.reasonPhrase);
    }

  }
  addReplyCommentsApi() async {
    final prefs = await SharedPreferences.getInstance();
    var authToken = await prefs.getString('auth-token');
    print("authantication token is here___________$authToken");
    var headers = {
      'auth-token': authToken!
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://www.ramapuzzle.com/api/v1/user/addReplyOnComments'));
    request.fields.addAll({
      'post_id': widget.post_Id!,
      'comment_id': commentId.toString(),
      'content': addReplyController.text,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var finalResponse = await response.stream.bytesToString();
      final jsonResponse =  json.decode(finalResponse);
      if(jsonResponse ['type'] == 'SUCCESS'){
        clear();
        //deAddictionCommentListApi();
        allVideos();
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
      }else{
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
      }
    }
    else {
      print(response.reasonPhrase);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //deAddictionCommentListApi();
    allVideos();
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
                  controller: addCommentController,
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20), // add padding to adjust text
                    isDense: true,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                      child: InkWell(
                          onTap: (){
                            if(addCommentController.text.isEmpty ){
                              Fluttertoast.showToast(msg: 'Please Enter Some Text');

                            }else{
                              addCommentsApi();
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
              videoCommentData == null ?  const Center(
                child: CircularProgressIndicator(
                  semanticsLabel: 'Circular progress indicator',color: ColorConstants.backgroundColor,
                ),
              ):videoCommentData!.payload!.isEmpty ?  const Text(""):SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: videoCommentData?.payload!.length,
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
                                Image.network('${videoCommentData!.payload![index].profileImg}',scale: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${videoCommentData!.payload![index].name}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                                ),
                                Text('${videoCommentData!.payload![index].createdTime}'),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text("${videoCommentData!.payload![index].content}",style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,fontSize: 14),),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 40.0),
                            //   child: Text("${getAllCommentsData!.payload![index].reply![index].content}",style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,fontSize: 14),),
                            // ),
                            /*Padding(
                              padding: EdgeInsets.only(top: 8.0,left: 40),
                              child: InkWell(
                                  onTap: (){
                                    //print('This is prticular post id ==>>${videoCommentData!.payload![index].postId.toString()}');
                                    commentId = commentData!.payload![index].postId.toString();
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
                                                  controller: addReplyController,
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.only(top: 15), // add padding to adjust text
                                                    isDense: true,
                                                    suffixIcon: Padding(
                                                      padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                                                      child: InkWell(
                                                          onTap: (){
                                                            if(addReplyController.text.isEmpty ){
                                                              Fluttertoast.showToast(msg: 'Please Enter Some Text');
                                                            }else{
                                                              addReplyCommentsApi();
                                                              //addReplay();
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
                            )*/
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
