

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rama_puzle/CustomColor.dart';

import 'package:rama_puzle/RewardsData.dart';
import 'package:rama_puzle/questionHistory.dart';
import 'package:rama_puzle/studyMaterial.dart';

import 'HttpClient.dart';
import 'TopicData.dart';
import 'body1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RewardDisplay3 extends StatefulWidget {

  RecentQuiz1 recentQuiz;
  RewardDisplay3({Key? key

, required this.recentQuiz

  }) : super(key: key);
  @override
  RewardDisplay4 createState() => RewardDisplay4(recentQuiz: recentQuiz
  );

}

class RewardDisplay4 extends State<RewardDisplay3> {
  RecentQuiz1 recentQuiz;
  var vari = true;
  RewardDisplay4({Key? key, required this.recentQuiz});
  //var isVisible;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return
      InkWell(
        onTap: () {
      setState(() {
        if (vari == false)
          vari = true;
        else
          vari = false;
      });

    },
    child:
      Padding(padding: EdgeInsets.only(left: 10, right: 10),child:
    Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(recentQuiz.topicName),
    Icon(Icons.remove_red_eye_rounded,color: Colors.yellow,)
    ],),Divider(
        height: 1,
        color: Colors.black,
      ),
      InkWell(
          onTap: () {
            quizHistory2(recentQuiz.topicId.toString(), context,'');
          },
          child:
      Visibility(
          visible: vari ,
          child:Container(
          height: 40,
          decoration: BoxDecoration(color: ColorConstants.skyBlueColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)


            ),
          ),
          child:Row(
          children:[

            Image.network(recentQuiz.rewardIcon,fit: BoxFit.fill),
            Text(recentQuiz.reward),
            Image.network(recentQuiz.rewardIcon,fit: BoxFit.fill),
            Text(recentQuiz.totalMarks.toString() + "/" +
                recentQuiz.totalQuestion.toString()),
            Image.network(recentQuiz.rewardIcon,fit: BoxFit.fill),
            Text(recentQuiz.userGetMarks.toString()),
          ]
      ),),),)]),),);
      /*InkWell(
      onTap: () {
        setState(() {
          if (vari == false)
            vari = true;
          else
            vari = false;
        });

      },
      child:
      Padding(padding: EdgeInsets.only(left: 10, right: 10),child:
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(recentQuiz.topicName),
              Icon(Icons.remove_red_eye_rounded,color: Colors.yellow,)
            ],),
          Divider(
            height: 1,
            color: Colors.black,
          ),

          Visibility(
            visible: vari ,
            child:
            Container(
              height: 40,
              decoration: BoxDecoration(color: ColorConstants.skyBlueColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)


                ),
              ),
              child:
              Row(
                  children:[

                    Image.network(recentQuiz.rewardIcon,fit: BoxFit.fill),
                    Text(recentQuiz.reward),
                    Image.network(recentQuiz.rewardIcon,fit: BoxFit.fill),
                    Text(recentQuiz.totalMarks.toString() + "/" +
                        recentQuiz.totalQuestion.toString()),
                    Image.network(recentQuiz.rewardIcon,fit: BoxFit.fill),
                    Text(recentQuiz.userGetMarks.toString()),
                  ]
              ),
            ),)
        ],
      ),),)*/;
  }


}

class RewardDisplay extends StatefulWidget {
 /* final int category_id;
  final String? sub_category_id;
  final String? sub_name;*/
  const RewardDisplay({Key? key/*, required this.category_id, required this.sub_category_id
    , required this.sub_name*/
  }) : super(key: key);


  // TODO: implement createState
  //throw UnimplementedError();
  @override
  State<RewardDisplay> createState() => RewardDisplay1(/*category_id: category_id, sub_category_id: sub_category_id,
      sub_name: sub_name*/
  );
}

class RewardDisplay1 extends State<RewardDisplay> {
 /* final int category_id;
  final String? sub_category_id;
  final String? sub_name;*/
  int chapterCount =0  ;
  Rewards? rewards2;
  bool vari = true;
  List<bool>? isVisibleList; /*= List.generate(5, (_) => false);*/
  RewardDisplay1({Key? key/*, required this.category_id, required this.sub_category_id, required this.sub_name*/});


  //Future<TopicList>? topicData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //populateDropDownNationality();
    getRewardHistory();

  }
  populateDropDownNationality()  {
   rewards2 = getRewardHistory();
    setState(() {
      rewards2 = rewards2;
      //isVisibleList = List.generate(rewards2!.payload.recentQuiz.length, (index) => false);
    });
  }

  getRewardHistory() async{
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;
    var res = await http.post(Uri.parse(rewardHistoy), body: {
      "page" : "1",
      "limit" : "10"
    }, headers: {"auth-token": token!});

    /*final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

  var token = string;
  final response = await http.post(Uri.parse(topicQuiz),
      encoding: Encoding.getByName("utf-8"),
      headers: {"auth-token": token!},
      body: {

        'topic_id': topic_id,
        *//* 'password' : password,
         'login_type' : 'E',
         'device_type': 'A',
         'device_token': 'fjksf'*//*
      }
  );*/
    Rewards rewards = rewardsFromJson(res.body);
    setState(() {
      rewards2 = rewards;
      //isVisibleList = List.generate(rewards2!.payload.recentQuiz.length, (index) => false);
      isVisibleList = List.generate(rewards2!.payload.recentQuiz.length, (index) => false);
    });
    //return rewards;

  }
  void _toggleVisibility(int index) {
    setState(() {
      //vari = !vari;
     /* if (vari == false) {
        vari = true;
      } else
        vari = false;*/

        isVisibleList![index] = !isVisibleList![index];

    });
  }

  @override
  Widget build(BuildContext context) {

  int? totalRewards = 0;
  int? itemLenght = 0;

  if (rewards2 != null){
    totalRewards = rewards2?.payload.totalRewards;
    itemLenght = rewards2?.payload.recentQuiz.length;
  }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
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
            /*child:Image.asset(
              "assets/images/back_arrow.png", height: 10,
              width: 10,),),*/
          title: Text("Rewards",style:
          TextStyle(color: Colors.white, fontFamily: 'Poppins',
              fontSize: 20, fontWeight:  FontWeight.w800)

          )
          /*GoogleFonts.poppins(
              color: Colors.white,
                fontSize: 20, fontWeight: FontWeight.w800
            )*/,


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
              height: 800,
              child:

                  Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(color: ColorConstants.backgroundColor,


                  ),
                        child:
                        Column(children: [
                          Text("YOUR BALANCE", style: TextStyle(color: Colors.white),),
                          Text(totalRewards.toString() + " POINTS"
                              ,
                              style: TextStyle(color: Colors.white)),
                        ],),),


                Container(
                  width: 400,
                  height: 600,
                  decoration: BoxDecoration(color: Colors.yellow,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)


                    ),
                  ),
                  child:
                  Column(children: [
                    Padding(

                        padding: EdgeInsets.only(left: 14),
                        child:Align(child:
                        Text("Earned",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)), alignment: Alignment.topLeft)),

    ListView.builder(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    scrollDirection: Axis.vertical,
    itemCount:  itemLenght != 0 ? itemLenght: 0,
    itemBuilder: (context, index) {

    return
    //SizedBox.shrink();
//Text("data");
    // RewardDisplay3( recentQuiz: snapshot.data!.payload.recentQuiz[index]);


    InkWell(
    onTap: () {
      _toggleVisibility(index);},


    /*if (vari == false)
    vari = true;
    else
    vari = false;*/
    /*setState(() {
      vari = !vari;

    });*/


    child:
    Padding(padding: EdgeInsets.only(left: 10, right: 10),child:
    Column(
    children: [


    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(rewards2!.payload.recentQuiz.elementAt(index).topicName),
    Icon(Icons.remove_red_eye_rounded,color: Colors.yellow,)
    ],),
    Text(rewards2!.payload.recentQuiz.elementAt(index).createdTime),
    Divider(
    height: 1,
    color: Colors.black,
    ),

    Visibility(
    visible: isVisibleList![index],
    child:
    Container(
    height: 40,
    decoration: BoxDecoration(color: ColorConstants.skyBlueColor,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),
    bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)


    ),
    ),
    child:
      //Text(')
    InkWell(onTap: () {
      quizHistory2(rewards2!.payload.recentQuiz[index].topicId.toString(), context, "");
      /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
          //QuestionHistory(data: rewards2.payload);
              quizHistory2(rewards2!.payload.recentQuiz[index].topicId.toString(), context)
          //Comment1()
          //CommunitySection()
            *//*VideoDisplay(category_id: 0,
                  sub_category_id: "", sub_name: "",)*//*));*/
    },child:
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:[


    //Image.network(rewards2!.payload.recentQuiz.elementAt(index).rewardIcon,/*fit: BoxFit.fill*/),
      Image.asset("assets/images/rewards_icon.png"),
    Text(rewards2!.payload.recentQuiz.elementAt(index).reward),
   // Image.network(rewards2!.payload.recentQuiz.elementAt(index).rewardIcon,fit: BoxFit.fill),
      Image.asset("assets/images/question_mark.png"),
    Text(rewards2!.payload.recentQuiz.elementAt(index).totalMarks.toString() + "/" +
    rewards2!.payload.recentQuiz.elementAt(index).totalQuestion.toString()),
   // Image.network(rewards2!.payload.recentQuiz.elementAt(index).rewardIcon,fit: BoxFit.fill),
      Image.asset("assets/images/star.png"),
      Text(rewards2!.payload.recentQuiz.elementAt(index).userGetMarks.toString() + " points"),
    ]
    ),),
    ),)])),);})]),)],),),),);}}
    /*],



                  ],
                  )
        FutureBuilder(future: rewards2,
        builder: (context, snapshot) {
          int? totalRewards = snapshot.data?.payload.totalRewards;
          return 
            //Text(snapshot.data!.payload.recentQuiz.length.toString())
            Column(

              children: [
                Text("YOUR BALANCE", style: TextStyle(color: Colors.white),),

                Text(totalRewards.toString() + " POINTS"
                   + " POINTS",
                style: TextStyle(color: Colors.white)),

                Container(
                  width: 400,
                  height: 600,
                  decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)


          ),
                ),
                child:
                  Column(children: [
                    Padding(

                        padding: EdgeInsets.only(left: 14),
                    child:Align(child:
                    Text("Earned"), alignment: Alignment.topLeft)),

                    ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount:  snapshot.data?.payload.recentQuiz.length,
                        itemBuilder: (context, index) {
                          var vari = true;
                      return
                          SizedBox.shrink();
//Text("data");
                    // RewardDisplay3( recentQuiz: snapshot.data!.payload.recentQuiz[index]);


                      InkWell(
                        onTap: () {
                          setState(() {
                            if (vari == false)
                              vari = true;
                            else
                              vari = false;
                          });

                        },
                        child:
                        Padding(padding: EdgeInsets.only(left: 10, right: 10),child:
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                        Text(snapshot.data!.payload.recentQuiz[index].topicName),
                              Icon(Icons.remove_red_eye_rounded,color: Colors.yellow,)
                            ],),
                            Divider(
                              height: 1,
                              color: Colors.black,
                            ),

                            Visibility(
                              visible: vari ,
                              child:
                            Container(
                              height: 40,
                              decoration: BoxDecoration(color: ColorConstants.skyBlueColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)


                              ),
                            ),
                              child:
                              Row(
                                children:[

                                Image.network(snapshot.data!.payload.recentQuiz[index].rewardIcon,fit: BoxFit.fill),
                                  Text(snapshot.data!.payload.recentQuiz[index].reward),
                                  Image.network(snapshot.data!.payload.recentQuiz[index].rewardIcon,fit: BoxFit.fill),
                                  Text(snapshot.data!.payload.recentQuiz[index].totalMarks.toString() + "/" +
                                      snapshot.data!.payload.recentQuiz[index].totalQuestion.toString()),
                                  Image.network(snapshot.data!.payload.recentQuiz[index].rewardIcon,fit: BoxFit.fill),
                                  Text(snapshot.data!.payload.recentQuiz[index].userGetMarks.toString()),
                                    ]
                              ),
                            ),)
                          ],
                        ),),);

                    })
                  ])
                  ,
                )

              ],
            )
            Column(
          children: [
            Text(snapshot.data?.payload.recentQuiz.length as String),
            Text(snapshot.data!.payload.totalRewards.toString()),

    Container(decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),
    bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15),  )

    image: DecorationImage(

                          image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                          fit: BoxFit.cover,
                        ),

    ),child:

        Column(
    children: [Text('Earned'),
    ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount:  snapshot.data!.payload.recentQuiz.length,
    itemBuilder:
    (context, index) {
    return

    Column(
    children: [
    Row(
    children: [
    Column(children: [
    Text(snapshot.data!.payload.recentQuiz[index].topicName),

    ],),

    Icon(Icons.remove_red_eye_rounded,color: Colors.yellow,)

    ],
    ),

    Divider(
    height: 1,
    color: Colors.black
    ),
    ],
    );
    })]),)]);}),)),);}}*/




