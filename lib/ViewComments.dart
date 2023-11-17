import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rama_puzle/viewAllcommentbody.dart';
import '../../CustomColor.dart';

import 'SizeConfig.dart';
import 'VideoCommentBody.dart';



class ViewComments extends StatefulWidget {
  String? post_Id;
  int? choice;
  String? videoId;
  String? videoTopicId;
  ViewComments({super.key,required this.post_Id, required this.choice, required this.videoId, required this.videoTopicId});

  @override
  State<ViewComments> createState() => _FamilyViewStructureState(choice: choice, videoId: videoId, videoTopicId: videoTopicId);
}

class _FamilyViewStructureState extends State<ViewComments> {
  int? choice;
  String? videoId;
  String? videoTopicId;
  _FamilyViewStructureState({Key? key, required this.choice, required this.videoId, required this.videoTopicId});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor:ColorConstants. backgroundColor,

      appBar: AppBar(
        title: Column(
          children: const [
            Text('Comments'),
          ],
        ),
        centerTitle: true,
        backgroundColor:ColorConstants. backgroundColor,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all( Radius.circular(25),)
          ),
          child:   choice == 0?ViewAllCommentsBody(post_Id: widget.post_Id):VideoCommentBody(post_Id: '', video_topic_id: videoTopicId, video_id: videoId,)
        ),
      ),
    );
  }
}

