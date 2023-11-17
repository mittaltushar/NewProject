/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rama_puzle/viewAllcommentbody.dart';
import '../../CustomColor.dart';
import 'SizeConfig.dart';
*/
/*import '../../classes/size_config.dart';
import 'components/view_all_comments_body.dart';*//*



class ViewAllComments extends StatefulWidget {
  String post_Id;

   ViewAllComments({super.key,required this.post_Id});

  @override
  State<ViewAllComments> createState() => _FamilyViewStructureState();
}

class _FamilyViewStructureState extends State<ViewAllComments> {


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
          child:   ViewAllCommentsBody(post_Id: widget.post_Id),
        ),
      ),
    );
  }
}

*/
