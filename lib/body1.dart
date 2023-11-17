import 'dart:async';
import 'dart:async';
import 'dart:convert';

import 'package:rama_puzle/NewFile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rama_puzle/profileNew.dart';
import 'package:rama_puzle/rewardHistory.dart';
import 'package:rama_puzle/trendingMaterialGrid.dart';
import 'ProfileData.dart';

import 'RedBloodPost.dart';
import 'StaticVar.dart';
import 'application_localizations.dart';
import 'chatFunction.dart';
import 'homepagedata2.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:rama_puzle/CommunityPost.dart';
import 'package:rama_puzle/Faq.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:rama_puzle/StudyMaterialSubCategory.dart';
import 'package:rama_puzle/profile.dart';
import 'package:rama_puzle/quizGrid.dart';
import 'package:rama_puzle/rewardDisplay.dart';
import 'package:rama_puzle/studyMaterialGrid.dart';
import 'package:rama_puzle/videos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:sizer/sizer.dart';
import 'AgeModel.dart';
import 'CommunitySection.dart';
import 'CustomColor.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'HttpClient.dart';
import 'HumanWelfare.dart';
import 'Login.dart';
import 'QuizSubCategory.dart';
import 'RewardsData.dart';
import 'VideoDisplay.dart';
import 'homepagedata2.dart';
import 'amazon_s3_cognito.dart';
import 'comment.dart';
import 'contactUs.dart';
import 'demo.dart';
import 'lang_builder.dart';
import 'new_edit_profile.dart';
import 'new_modules/food_donation/list_food_donation.dart';
import 'new_modules/plant_tree/plant_a_tree.dart';
import 'noFile.dart';

class Body2 extends StatelessWidget {
  bool isLogin = false;

  Body2({Key? key, required this.isLogin}) : super(key: key);

  //Body3 createState() => Body3( isLogin1: isLogin);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      /*localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],*/
      supportedLocales: AppLocalizations.supportedLocales,
      /* supportedLocales: [
        AppLocalizations.supportedLocales,
        Locale('en'), // English
        Locale('es'), // Spanish
      ],*/
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'not',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => Body3(isLogin1: false);
}

//  const Body2({Key? key}) : super(key: key);

/*@override
  Body3 createState() => Body3( isLogin1: isLogin);*/
/*  @override
  Body1 createState() => Body1();*/



class MyPopupMenu extends StatefulWidget {
  List<Payload2> payload2 =[];
  bool loginBit;
  BuildContext context2;

  MyPopupMenu({Key? key, required this.payload2, required this.loginBit, required this.context2}) : super(key: key);
  @override
  _MyPopupMenuState createState() => _MyPopupMenuState(payload2: payload2, loginBit: loginBit, context2: context2);

}

class CommanClass {

  static String? tappedIndex = '';

// ... rest of the class ...

}
class PayloadClass {
  static List<Payload2>? payload;
}
class _MyPopupMenuState extends State<MyPopupMenu> {
  List<Payload2> payload2 = [];
  List<String> _options = [];
  bool loginBit;
  BuildContext context2;

  _MyPopupMenuState({Key? key, required this.payload2, required this.loginBit, required this.context2});

  late int tappedIndex;
  late bool bo;

  @override
  void initState() {
    super.initState();

    //_fetchOptions();
    tappedIndex = 0;
    //bo = getLoginStatus();
  }

/*
  void _fetchOptions() async {
    final response = await http.get(Uri.parse('your_api_endpoint'));
    final data = jsonDecode(response.body);
    setState(() {
      _options = List<String>.from(data['options']);
    });
  }*/

  getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
    bool? loginBit = await prefs.getBool('isLogin');
    return loginBit;
  }

  setAgeBit(String age) async {
    final prefs = await SharedPreferences.getInstance();

// set value
    /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
    bool? loginBit = await prefs.setString('ageBit',age);

  }
  @override
  Widget build(BuildContext context) {
    String? _site = "";
    payload2 = PayloadClass.payload!;

    /*if (loginBit != false) {*/
    return


      Container(

        decoration: new BoxDecoration (
          borderRadius: BorderRadius.circular(20.0),
        ),

        child:
        PopupMenuButton<Payload2>(
          offset: const Offset(0, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          onSelected: (Payload2 viewType) {
            _site = viewType.name;
            tappedIndex = viewType.id;
          },
          itemBuilder: (BuildContext context) {
            return


                  payload2.map((Payload2 option) =>


                  PopupMenuItem<Payload2>(
                    padding: EdgeInsets.only(left: 2),
                    onTap: () {
                      setState(() {
                        tappedIndex = option.id;
                        CommanClass.tappedIndex = tappedIndex.toString();
                        setAgeBit(tappedIndex.toString());
                        //ff
                      });
                    },
                    value: option,
                    child:

                    /*Container(
                width: 100,
                child:*/
                    Container(

                      decoration: new BoxDecoration (
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child:
                      Container(
                        color: tappedIndex == option.id ? ColorConstants
                            .peachColor : Colors.white,
                        child:

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              //color: tappedIndex == option.id? ColorConstants.peachColor : Colors.white,
                              height: 10,
                              width: 10,
                              margin: EdgeInsets.only(right: 10),
                              child:
                              Padding(
                                padding: EdgeInsets.only(left: 10), child:
                              Radio(

                                visualDensity: VisualDensity(
                                    horizontal: -2, vertical: -4),

                                //title: Center(child:Text(_site!, style: TextStyle(color: Colors.black),)),
                                activeColor: Colors.black,
                                value: option.name,
                                groupValue: _site,
                                onChanged: (/*value) {

                  setState(() {
                    _site = value as String?;

                  });
                },*/null),
                              ),),),

                            Text(option.name, style: TextStyle(
                                backgroundColor: tappedIndex == option.id
                                    ? ColorConstants.peachColor
                                    : Colors.white,
                                color: ColorConstants.backgroundColor),),
                          ],


                          /*title:
            leading:*/
                        ),),
                      //Text(option.name),
                    ),),)
                  .toList();
          }

          ,
          /*onSelected: (String value) {
        print('Selected: $value');
      },*/
          icon:
          Padding(padding: EdgeInsets.only(right: 0),
            child: Image.asset(
              'assets/images/ages.png',
              fit: BoxFit.contain,

              //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
              //onPressed: () => exit(0),
              /* fit: BoxFit.contain,
              icon: Image.asset('assets/images/ages.png',width: 300,height: 120,),*/
            ),),
          iconSize: 80,
        ),);

    /*else
      return  Padding(padding: EdgeInsets.only(right: 0),
        child: Image.asset(
            fit: BoxFit.contain,
            'assets/images/ages.png'
          //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
          //onPressed: () => exit(0),
          */ /* fit: BoxFit.contain,
              icon: Image.asset('assets/images/ages.png',width: 300,height: 120,),*/ /*
        ),);
  }*/
  }
}


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onButtonPressed;

  CustomAppBar({required this.onButtonPressed});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Custom AppBar'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: onButtonPressed,
        ),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget  implements PreferredSizeWidget{
  final Function()? updateValue;
  //final VoidCallback updateValue;
  bool isScroll = false;
  bool loginStatus;
  List<Payload2>? payload;
  List<String>? payload2 = ['fjfjk', 'fjkjfk'];
  String? selectedValue;
  //BuildContext? context2;
  //Body2? body;
  /*myAppBar;*/
/*
  final Function(String) updateValue;
  MyStatefulWidget({Key? key, required this.updateValue}) : super(key: key);*/

  /* @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(updateValue: updateValue);
 */ MyAppBar({Key? key, required this.isScroll, required this.payload, required this.loginStatus
    ,required this.updateValue
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(
    50,50,);

  getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
    bool? loginBit = await prefs.getBool('isLogin');
    return loginBit;
  }


  /*showDialog1(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return Container(
        child: AlertDialog(
          title: Center(child:
          Text('Please Login', *//*textAlign: TextAlign.right,*//*style: *//*GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black
                    ) *//*TextStyle(color: Colors.black, fontFamily: 'Poppins',
              fontSize: 20, fontWeight: FontWeight.w600)

          ),
          ),
          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          actions: [

            TextButton(onPressed: () {
              Navigator.pop(context);
              // runLoginApi
              //fetchAlbum();
              //Navigator.pop(context);
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyStatefulWidget()));
            }, child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: ColorConstants.bluishColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Center(child: Text("Cancel", style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors
                    .black,
                ),),
                ),),
            ),
            ),
            TextButton(onPressed: () {
              *//*Navigator.of(context, rootNavigator: true).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  MyStatefulWidget(updateValue: _updateValue,)));*//*
            }, child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 0, top: 0),
                child: Center(child: Text(
                  "Ok", style: TextStyle(fontSize: 16, fontWeight: FontWeight
                    .bold, color: Colors.black),),),
              ),
            ),),
          ],

        ),
      );
    },);
  }*/
  @override
  Widget build(BuildContext context) {

    return new AppBar(

      actions: [



        /* Container(
              margin: EdgeInsets.only(right: 12),
              width: 100,
              height: 200,
              child:
*/
/*
Container(
  width: 100,
  height: 100,*/
        /* child:DropdownButtonHideUnderline(
    child:
    ButtonTheme(*/



        /*         GestureDetector(
      onTap: () {
        return
      },*/


        if (loginStatus)


          Padding(padding: EdgeInsets.only(right: 0),
            /*child: DropdownButtonHideUnderline(*/
            //child: Expanded(
            child:


            /*loginStatus?*/
            MyPopupMenu(payload2: payload as List<Payload2>,loginBit: loginStatus, context2: context,)/*PopupMenuButton<Payload2>(
*//*onSelected: ,*//*
                itemBuilder:
                    (BuildContext context) { *//*{
                  List.generate(payload.length, (index) {
                      return PopupMenuItem(
                        child:
                      )
                  })
                  payload
                    }*//*
                    return payload.map((Payload2 e) => PopupMenuItem(child: child,
    value: ))
                    return payload?.map((String payload) => PopupMenuItem<String>(
                  value: paylo,
                  child: Text(
                    payload.title,
                  ),
                ))
                    .toList();
                );
                 *//*(context) {
                return payload?.map((e) =>
                PopupMenuItem<Payload2>(

                child: new Container(
                width: 100.0,
                child: Text(e.name)
                ),
                )
                ).toList();*//*
            //      isExpanded: true,
                 // icon: SizedBox.shrink(),
                    icon: Image.asset(
    fit: BoxFit.contain,
    'assets/images/ages.png',width: 70,height: 100
    //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
    //onPressed: () => exit(0),
    *//* fit: BoxFit.contain,
              icon: Image.asset('assets/images/ages.png',width: 300,height: 120,),*//*
    ),*/ /*items: payload?.map((e){ return new DropdownMenuItem(
                  value: "ffjfj",
    child: Container(
      margin: const EdgeInsets.all(10),
                    child: Column(
    children: [Text(e.name)],
    ),
                  *//*leading: Radio(
                    value: , groupValue: '', onChanged: (String? value) {  },

                  )*//*
                ),
    ); }).toList(),
                //value: selectedValue,
                *//*onChanged: (newVal) {

                  setState(() {
  //selectedValue = newVal as String;
                  });
                }*//*
                *//*child:Image.asset(
                    fit: BoxFit.contain,
                    'assets/images/ages.png',width: 70,height: 100
                  //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
                  //onPressed: () => exit(0),
                  *//**//* fit: BoxFit.contain,
              icon: Image.asset('assets/images/ages.png',width: 300,height: 120,),*//**//*
                )*//*

                  *//*onChanged: (String? value) {  }*//*
                  *//*return payload?.map((e){ return PopupMenuItem<e>(
                    value: e,
                    child: new Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [Text(e.name)],
                      ),
                      *//**//*leading: Radio(
                    value: , groupValue: '', onChanged: (String? value) {  },

                  )*//**//*
                    ),
                  ); }).toList();*//*
                }*/

            /*InkWell(onTap: showDialog1(context),
              child:
              Container(
                height: 20,
                width: 10,
                child:
              Image.asset(
                'assets/images/ages.png',
                fit: BoxFit.contain,

                //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
                //onPressed: () => exit(0),
                *//* fit: BoxFit.contain,
              icon: Image.asset('assets/images/ages.png',width: 300,height: 120,),*//*
              ),),)*/,
            /*IconButton(
      icon: )*/
            //AssetImage("assets/images/ages.png");
            /*Container(
              child: Row(children: [
                Icon()
              ]),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  *//*image: DecorationImage(

                    image: NetworkImage(latestquiz.imageUrl as String),

                    fit: BoxFit.cover,
                  )*//*)

            )*/) else
          GestureDetector(
            onTap: updateValue,
            /*  child: Container(
    height: 100.0, // Set the desired height here
    width: 80.0,*/ // You can adjust the width as needed
            child: Image.asset(
              height: 80,
              width: 80,
              'assets/images/ages.png',
              fit: BoxFit.contain,
              // Image.asset('assets/images/ages.png',width: 300,height: 120,),
              //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
              //onPressed: () => exit(0),
              // fit: BoxFit.contain,

            ),)

        /* Container(
                height: 40,
                width: 40,
                child:
                IconButton(
                  icon: *//*Icon(Icons.add)*//*Image.asset('assets/images/ages.png',width: 140,height: 140,),
                  onPressed: updateValue,
                ),),*/

        /*GestureDetector( onTap: () {
                updateValue;
                },
              *//*onTap: () {
              //showDialog1(context2!);
                updateValue;
  \            },*//*
                child:
                Image.asset(
                  height: 80,
                  width: 80,
                  'assets/images/ages.png',
                  fit: BoxFit.contain,
                  // Image.asset('assets/images/ages.png',width: 300,height: 120,),
                  //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
                  //onPressed: () => exit(0),
                  // fit: BoxFit.contain,

                ),)*/
      ],
      leading: loginStatus == false ?
      GestureDetector(
          onTap: updateValue,
          /*  child: Container(
    height: 100.0, // Set the desired height here
    width: 80.0,*/ // You can adjust the width as needed
          child:
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: updateValue,

            //if (loginStatus)
            // Handle the onPressed event when the user is logged in
            // For now, do nothing to disable the drawer opening


          )
        /*Image.asset(
                height: 80,
                width: 80,
                'assets/images/ages.png',
                fit: BoxFit.contain,
                // Image.asset('assets/images/ages.png',width: 300,height: 120,),
                //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
                //onPressed: () => exit(0),
                // fit: BoxFit.contain,

              ),*/):null,

      /*: null,*/
      elevation: 0,
      backgroundColor: ColorConstants.backgroundColor,
      title: Align(
        alignment: Alignment.topLeft,
        child:Text("RAMA PUZZLE"

          , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),).tr(),
      ),);

  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

/*class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onButtonPressed;

  CustomAppBar({required this.onButtonPressed});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Custom AppBar'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: onButtonPressed,
        ),
      ],
    );
  }
}*/
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => Body3(isLogin1: null);
}*/

class Body3 extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();
  final CarouselController carouselControll_ = CarouselController();
  bool isLogin1 = false;
  int? recentQuizLength = 0;
  Future<HomePageData>? homePageData;
  Future<CommunityPost>? communityPost;
  ProfileData? payload;
  List<Payload2>? payload2;
  double pixel = 0;

  Body3({Key? key, required this.isLogin1});

  AppBar? appbar;

  int? current = 0;
  String? profileName;
  bool? loginStatus = false;
  String? ageStatus;
  Locale locale = Locale('en');
  String? home;
  String? rewards;
  String? quizzes;
  String? videos;
  String? studyMaterial;
  String? chatSupport;
  String? contact;
  String? faq;
  String? logout;
  String? ages;
  String? seeAll;
  String? latestQuiz;
  String? trending;
  String? recentQuiz;
  String? changeLang;

  String? chat;
  String? profile;
  String? lang;
  bool? langDone;

  bool? langVar;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  populateDropDowns2() async {
    List<Payload2> data = await getAges();
    setState(() {
      payload2 = data;
      PayloadClass.payload = data;
    });
  }

  languageApi(String str) async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', str);


    //final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');



    //var token = string;
    var token = string;
    final response = await http.post(Uri.parse("http://www.ramapuzzle.com/api/v1/user/changeLanguage"),
        encoding: Encoding.getByName("utf-8"),
        headers: {"auth-token": token!},
        /*headers:   { 'Content-type': 'application/json',
       'Accept': 'application/json',
       *//*"Authorization": "user_2yHJ8eSsmKLED0h"*//*}*/ // user_VtPAAuNIRbQgzKT
        body: {
          'language': str,
          /*'caption':caption,
          'post_type' : 'IMAGE',
          'post_url' : imagePost,
          'latitude' : latitude,
          'longitude' : longitute*/
          /*'email': 'shachish@ajath.com',
         'password' : '123456',
         'login_type' : 'E',
         'device_type': 'A',
         'device_token': 'fjksf'*/
        }
    );
    /*setState(() {
      locale = Locale(str);
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.


    });*/
    print(response);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Body2(isLogin: false,)));
    /*SaveAnswerData saveAnswerData = saveAnswerDataFromJson(response.body);
    Fluttertoast.showToast(msg: "Post added successfully");*/
    //Navigator.pop(context);
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPost()));*/

    //return saveAnswerData;

  }
  void changeLanguage(String lang) {


    languageApi(lang);

    //home = AppLocalizations.of(context)!.home;

  }
  /*void _showRadioDialog(BuildContext context) {
    int selectedRadio = 0;
  showDialog(
  context: context,
  builder: (BuildContext context) {
  return AlertDialog(
  title: Text('Select an Option'),
  content: StatefulBuilder(
  builder: (BuildContext context, StateSetter setState) {
  return Container(
  width: double.maxFinite,
  child: ListView.builder(
  shrinkWrap: true,
  itemCount: , // Number of options
  itemBuilder: (BuildContext context, int index) {
  return RadioListTile(
  title: Text('Option $index'),
  value: index,
  groupValue: selectedRadio,
  onChanged: (int value) {
  setState(() {
  selectedRadio = value;
  });
  },
  );
  },
  ),
  );
  },
  ),
  });}
*/
  getUserProfile() async{
    //payload = await getUserProfileFun();
    final prefs = await SharedPreferences.getInstance();
    const baseURL = "http://www.ramapuzzle.com/api/v1";
    const getUserProfile = baseURL + "/user/myProfile";
// set value
    //a/wait prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;

    final response = await http.post(Uri.parse(getUserProfile),
        encoding: Encoding.getByName("utf-8"),
        /*  body: {
        'post_id':postId,
        'content': content
      }*/headers: {"auth-token": token!});
    ProfileData nationalityData =
    profileDataFromJson(response.body);

    //print(data);
    setState(() {
      payload = nationalityData;
      //SharedPreferences preferences

    });

  }
  /*getAllCommentData(String? string, String post_id, String page, String limit) async {
    //var token = string;
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');
    const baseURL = "http://www.ramapuzzle.com/api/v1";
    const commentData = baseURL + "/user/getAllComments";
    //var token = string;
    var token = string;
    final response = await http.post(Uri.parse(commentData),
        encoding: Encoding.getByName("utf-8"),
        headers: {"auth-token": token!},
        body: {
          'post_id': post_id,
          'page': page,
          'limit': limit
        });

    CommentData data = commentDataFromJson(response.body);
    print(data);
    setState(() {
      commentDataList = data;

    });
    //updateValue(data);
    return data;
  }*/

  getLang() async {

    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    /*var token = string;

    final prefs = await SharedPreferences.getInstance();*/

// set value
    //await prefs.setInt('user_id', data.payload.id);
    /*var token = string;*/
    //final prefs = await SharedPreferences.getInstance();
    //Fluttertoast.showToast(msg: 'client12');
// set value
    //await prefs.setInt('user_id', data.payload.id);
    //var string =  prefs.getString('auth-token');
    var lang = prefs.getString('lang');
    /*if (lang == null) {
      lang = 'en';
    }*/
    //if (MyStaticData.myValue== 0)
/*
    locale = Locale('hi');
    else
      locale = Locale('en')*/;

    locale= Locale(lang!);
    if (locale == null)
      locale = Locale("en");


  }

  Future<HomePageData>fetchHomeData() async {

    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;

    //final Future<Response> responses;
    bool statusBit = await getLoginStatus();
    //var token = string;
    /*final response = await http.post(Uri.parse(commentData),
      encoding: Encoding.getByName("utf-8"),
      headers: {"auth-token": token!},*/

    if (statusBit == false || statusBit == null) {
      final response = await http.post(Uri.parse(homePageData1),
          encoding: Encoding.getByName("utf-8")




        /*headers: {
    'Content-Type': 'application/json ',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  },encoding: Encoding.getByName("utf-8")*/);
      if (response.statusCode == 200) {
        //final HomePageData result = json.decode(response.body);
        HomePageData result1 = homePageDataFromJson(response.body);

        return result1!;
      }
    }

    else {
      //token = 'user_ItfRwjSEDvsXkqp';
      final response = await http.post(Uri.parse(homePageData1),
          encoding: Encoding.getByName("utf-8"),
          headers: {"auth-token": token!}


        /*headers: {
    'Content-Type': 'application/json ',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  },encoding: Encoding.getByName("utf-8")*/);
      if (response.statusCode == 200) {
        //final HomePageData result = json.decode(response.body);
        HomePageData result1 = homePageDataFromJson(response.body);
        recentQuizLength = result1.payload.recentQuiz.length;

        return result1!;
      }
    }
    throw Exception('');
    /* if (response.statusCode == 200) {
    //final HomePageData result = json.decode(response.body);
    HomePageData result1 = homePageDataFromJson(response.body);

    return result1!;
  } else {
    throw Exception('Failed to load data');
  }*/
  }

  initState() {
    //scrollController.addListener(_onScrollEvent);
    super.initState();
    //loginStatus = getLoginStatus();
    homePageData = fetchHomeData(); //
    communityPost = getCommunityPost('1', '10');
    // payload2 = getAges1();
    populateDropDowns2();
    getLoginStatus();
    getUserProfile();
    getLang();

    /*setState(() {
      profileName = profileName;
    });*/
    /* profileName = getSharedPref() as String?;f    setState(() {
      profileName = profileName;
    });*/

    //loginStatus = getLoginStatus();
    //appbar = MyAppBar(payload: payload2, isScroll: false) as AppBar;
    /*appbar
    AppBar(

      elevation: 0,
      actions: [
      ],
    ),
*/
  }

  void _onScrollEvent() {
    pixel = scrollController.position.pixels;
    //price: double.tryParse(pixels.get('pri  ce').toString()) ?? 0,
    setState(() {

    });
    // appbar :
    /*if (pixel > 100.0) {
      //appbar = MyAppBar() as AppBar;


      appbar = AppBar(
        actions: [
          */ /* Container(
              margin: EdgeInsets.only(right: 12),
              width: 100,
              height: 200,
              child:
*/ /*
          Padding(padding: EdgeInsets.only(right: 30),
            child:Image.asset(
                fit: BoxFit.contain,
                'assets/images/ages.png',width: 70,height: 100
              //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
              //onPressed: () => exit(0),
              */ /* fit: BoxFit.contain,
              icon: Image.asset('assets/images/ages.png',width: 300,height: 120,),*/ /*
            ),),
          */ /*IconButton(
      icon: )*/ /*
          //AssetImage("assets/images/ages.png");
          */ /*Container(
              child: Row(children: [
                Icon()
              ]),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  */ /**/ /*image: DecorationImage(

                    image: NetworkImage(latestquiz.imageUrl as String),

                    fit: BoxFit.cover,
                  )*/ /**/ /*)

            )*/ /*
        ],
        elevation: 0,
        backgroundColor: ColorConstants.backgroundColor,
        title: Text("RAMA PUZZLE", style: TextStyle(fontWeight: FontWeight.bold),),
      );
      //appbar.backgroundColor(ColorConstants.backgroundColor);
    }
    else {
      appbar = AppBar(
          actions: [
           */ /* Container(
              margin: EdgeInsets.only(right: 12),
              width: 100,
              height: 200,
              child:
*/ /*
            Padding(padding: EdgeInsets.only(right: 30),
            child:Image.asset(
                fit: BoxFit.contain,
              'assets/images/ages.png',width: 70,height: 100
              //constrain BoxConstraints(maxWidth: 150, minWidth: 160, maxHeight: 100, minHeight: 100),
              //onPressed: () => exit(0),
             */ /* fit: BoxFit.contain,
              icon: Image.asset('assets/images/ages.png',width: 300,height: 120,),*/ /*
            ),),
            */ /*IconButton(
      icon: )*/ /*
            //AssetImage("assets/images/ages.png");
            */ /*Container(
              child: Row(children: [
                Icon()
              ]),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  */ /**/ /*image: DecorationImage(

                    image: NetworkImage(latestquiz.imageUrl as String),

                    fit: BoxFit.cover,
                  )*/ /**/ /*)

            )*/ /*
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("RAMA PUZZLE", style: TextStyle(fontWeight: FontWeight.bold),),);
    }*/
  }

  NetworkImage getImage(String str) {
    return NetworkImage(str);
  }

  getItem4() {
    /*return Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Container(
            child:
            Row(
              children: [
                Column(
                  children: [
                    Text('Current Affairs Quiz'),
                    Text('Candidates can check the daily March current affairs 2023 from the app and website.'),
                    Text('Completed'),
                  ],
                ),
                Image.asset("assets/images/icon_lock.png")
              ],
            )
        )
    );*/
    return SizedBox.shrink();
  }

  Padding getItem3(RecentQuiz latestQuiz, int index) {
    return Padding(
        padding: EdgeInsets.only(right: 10, left: 20, top : 10),
        child: Container(
          child:
          Row(
            children: [
              Expanded(child: Column(

                children: [
                  Align(child:Padding(padding: EdgeInsets.only(top: 19, right : 20.w),child: Text(
                    maxLines: 1,latestQuiz.topicName,
                    style: TextStyle(color: ColorConstants.backgroundColor,fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ).tr(),),
                    alignment: Alignment.topLeft,),
                  Padding(padding: EdgeInsets.only(top: 18,right: 20.w),child:


                  /* FittedBox(fit: BoxFit.contain,child:*/

                  Text(
                    formatHtmlString(latestQuiz.topicDescription),
                    style: TextStyle(fontSize: 12,color: ColorConstants.backgroundColor),


                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                    /* Text(latestQuiz.topicDescription,
                      maxLines: 2,
                          fontWeight: FontWeight.w400
                      ),)*/),
                  Padding(padding: EdgeInsets.only(top: 17,bottom: 30), child:Align(child: Text(latestQuiz.topicStatus,
                    /*style:*/ /*TextStyle(color: ColorConstants.backgroundColor,fontSize: 15,
                            fontWeight: FontWeight.w800
                        )*/
                    style: TextStyle(
                      color: ColorConstants.backgroundColor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                      alignment: Alignment.topLeft),)
                ],
              ),),

            ],
          ),)

    );
  }

  /*return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child:
      Container(

        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical : 10),
        child: Padding(padding: EdgeInsets.only(top: 45),
          child: Center(
            child: Text(latestQuiz.name
            as String,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),),
        ),
        height: 80,
        width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(

            image: NetworkImage(latestQuiz.imageUrl as String),

            fit: BoxFit.cover,
          ),),),);*/


  Padding getItem2(LatestQuiz latestQuiz, int index) {
    //snapshot.data?.payload.studyMaterial[index].name as String,
    var i, j;
    if (index % 2 == 0) {
      i = 15.0;
      j = 5.0;
    } else {
      j = 15.0;
      i = 5.0;
    }
    return Padding(
      padding: EdgeInsets.only(right: j, left: i),
      child:
      Container(

        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(padding: EdgeInsets.only(top: 45),
          child: Center(
            child: Text(latestQuiz.name
            as String,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),),
        ),
        height: 80,
        width: MediaQuery
            .of(context)
            .size
            .width / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(

            image: NetworkImage(latestQuiz.imageUrl as String),

            fit: BoxFit.cover,
          ),),),);
  }

  Future<String?> getSharedPref() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
    // bool? loginBit = await prefs.getBool('isLogin');
    String? CheckValue = await prefs.getString('profile_name');
    return CheckValue;
  }

  InkWell getItem(LatestQuiz latestquiz, int index) {
    var i, j;
    if (index % 2 == 0) {
      i = 15.0;
      j = 5.0;
    } else {
      j = 15.0;
      i = 5.0;
    }
    return InkWell(
      onTap: () {
        /* final prefs = await SharedPreferences.getInstance();

// set value
        */ /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/ /*
        // bool? loginBit = await prefs.getBool('isLogin');
        bool? CheckValue = await prefs.getBool('isLogin');*/
        /*if (CheckValue == null)*/
        if (loginStatus == true) {
          if (index == 0 && (loginStatus == true))
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                //Comment1()
                CommunitySection(name:latestquiz!.name)));
          /* VideoDisplay(category_id: 0,
                  sub_category_id: "", sub_name: "",)));*/
          if (index == 1 && (loginStatus == true))
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                //Comment1()
                RedBloodPost(name: latestquiz!.name)
                  //HumanWelfareSection(title:latestquiz!.name ,)

                ));
          /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    CommunitySection(name:latestquiz!.name)
                //Comment1()
                //
                  *//*VideoDisplay(category_id: 0,
                  sub_category_id: "", sub_name: "",)*//*));*/

          if (index == 2 && (loginStatus == true))
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                //Comment1()
                PlantTree()));
          /*VideoDisplay(category_id: 0,
                  sub_category_id: "", sub_name: "",))*/

          /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>


                HumanWelfareSection(title:latestquiz!.name ,)));*/
          /*  VideoDisplay(category_id: 0,
                  sub_category_id: "", sub_name: "",)*//*));*/

          if (index == 3 && (loginStatus == true))
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                FoodDonationList()));

        }
        else
          showDialog1();
      },
      child: Padding(
        padding: EdgeInsets.only(right: j, left: i),
        child:
        Container(

          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(padding: EdgeInsets.only(top: 45),
            child: Center(
              child: Text(
                latestquiz.name as String,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),),
          ),
          height: 80,
          width: MediaQuery
              .of(context)
              .size
              .width / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(

              image: NetworkImage(latestquiz.imageUrl as String),

              fit: BoxFit.cover,
            ),),),),);
  }

  getDrawer(/*ProfileData profileData*/) async {

    if (loginStatus == false)
      return Drawer(
          child: ListView(
              padding: EdgeInsets.zero, children: [

            Padding(
              padding: EdgeInsets.only(left: 10, top: 40, right: 10),
              child:
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  /*.only(
              bottomLeft: Radius.circular(40),

              bottomRight: Radius.circular(40),),*/
                  color: Colors.white,
                ),
                height: 100,
                child:
                Row(children: [
                  Container(margin: EdgeInsets.only(left: 10),
                      width: 30,
                      height: 30,
                      child:
                      Image.asset('assets/images/icon_user.png'))
                  ,

                  Align(
                    alignment: Alignment.center,
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child:


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Align(child: Container(child: Align(
                            child: Text(/*profileName!*/ /*profileData.payload.name*/payload!.payload.name,
                              style: TextStyle(
                                  color: ColorConstants.backgroundColor),),
                            alignment: Alignment.topLeft), margin:
                        EdgeInsets.only(left: 0),), alignment: Alignment
                            .topLeft),
                          Text(/*payload!.payload.ageName*/'')
                        ],),),)
                ],)

                /*DrawerHeader(

              decoration:
              child:
              Center(   child:

                  Text("fdjlk")
              */ /*Image.asset("assets/images/icon_user.png")*/ /*)


              */ /*Row(

                  children: [
                    Container(margin: EdgeInsets.only(bottom: 0, left: 15),width: 20, height: 20,child:Image.asset("assets/images/icon_user.png"))
                    Padding(padding: EdgeInsets.only(bottom: 40),child:Align(alignment: Alignment.topCenter,child:Center(
                      child:

                Image.asset("assets/images/icon_user.png"),),),),
              ])*/ /*,
              */ /*Padding(
                padding: EdgeInsets.only(left: 10, top: 15, right: 10)
              ),*/ /*
            )*/,),),
            ListTile(
              leading: Image.asset('assets/images/dashboard_1.png', scale: 1.0,
                height: 30.0,
                width: 30.0,),

              title: const Text( 'Home'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/quizzes.png', scale: 1.0,
                height: 30.0,
                width: 30.0,),

              title: const Text('My Quiz',),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        QuizGrid()));

                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/video.png', scale: 1.0,
                height: 30.0,
                width: 30.0,),

              title: const Text('Videos',),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        VideoDisplay(category_id: 0,
                          sub_category_id: "", sub_name: "",)));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/study_material.png', scale: 1.0,
                height: 30.0,
                width: 30.0,),

              title: const Text('Study Material',),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        QuizGrid()));

                // Update the state of the app.
                // ...
              },
            ), ListTile(
              leading: Image.asset(
                'assets/images/chat_interaction.png', scale: 1.0,
                height: 30.0,
                width: 30.0,),

              title: const Text('Chat Integration',),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/reward_display.png', scale: 1.0,
                height: 30.0,
                width: 30.0,),

              title: const Text('Rewards',),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        RewardDisplay(
                        )));
              },
            ), ListTile(
              leading: Image.asset('assets/images/contact_us.png', scale: 1.0,
                height: 30.0,
                width: 30.0,),

              title: const Text('Contact Us',),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => contactUs()));
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/faq.png', scale: 1.0,
                height: 30.0,
                width: 30.0,),

              title: const Text('FAQ',),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Faq()));
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/log_out.png', scale: 1.0,
                height: 30.0,
                width: 30.0,),

              title: const Text('Logout',),

              onTap: () {
                setLoginStatus();
                // Update the state of the app.
                // ...

              },
            )
          ]
          )
      );
  }

  /*openFamilyTree()async {
    final prefs = await SharedPreferences.getInstance();
    bool? CheckValue = await prefs.getBool('isLogin');
    if (CheckValue == true)
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FamilyViewStructure(
          )));
  }*/


  @override
  Widget build(BuildContext context) {

    // It will provie us total height  and width of our screen
    Size size = MediaQuery
        .of(context)
        .size;

    //context.locale = Locale('hi', 'US');

    // it enable scrolling on small device

    return Sizer(builder: (context, orientation, deviceType) {
      return
        MaterialApp(
          debugShowCheckedModeBanner: false,
          //localizationsDelegates: AppLocalizations.localizationsDelegates,
          /*localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],*/
          //supportedLocales: AppLocalizations.supportedLocales,
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

          /* Flex(
          direction: Axis.vertical,
      //we get the number of available language configs at our custom language.dart file.
      //for this example we have 3 language options. [turkish,english,german]

      children: LanguageBuilder.getAvailableLanguages().map((e) {
             // children: LanguageBuilder.currentLanguage.map((e) {
              String? flag = LanguageBuilder.getCurrentLang();
        bool flag2 = false;
        //if (flag.contains(true))
        //if (LanguageBuilder.getCurrentLang().endsWith("other")== true)
        if (flag!.contains(e)) {
          flag2 = true;
        }

       // if ()
        return*/

          Scaffold(
            onDrawerChanged:
                (loginStatus) {
              if (loginStatus) {
                Scaffold.of(context).openEndDrawer();
              }
              /*setState(() {
                payload;
              });*/
            },
            key: _scaffoldKey,
            drawer:

            loginStatus!?
            /*GestureDetector(
      onTap: () {
        if ((loginStatus == false))
          *//*Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (
                                                        context) => const QuizGrid()));
                                              else*//*
          showDialog1();
      },*/

            Drawer(
                child: ListView(
                    padding: EdgeInsets.zero, children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) =>  NewEditProfile(marital: payload!.payload.marriedStatus,)));
                    },
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 40, right: 10),
                      child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          /*.only(
              bottomLeft: Radius.circular(40),

              bottomRight: Radius.circular(40),),*/
                          color: Colors.white,
                        ),
                        height: 100,
                        child:
                        Row(children: [
                          Container(margin: EdgeInsets.only(left: 10),
                              width: 30,
                              height: 30,
                              child:
                              /*payload!=null?
                                Image.network(payload!.payload.profileImg):null)*/
                              Image.asset('assets/images/icon_user.png'))
                          ,

                          Align(
                            alignment: Alignment.center,
                            child:
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child:


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Align(child: Container(child: Align(
                                    child: Text(/*profileName!*/ /*profileData.payload.name*//*payload!.payload.name*/
                                      payload!=null?payload!.payload.name:"",
                                      style: TextStyle(
                                          color: ColorConstants.backgroundColor),),
                                    alignment: Alignment.topLeft), margin:
                                EdgeInsets.only(left: 0),), alignment: Alignment
                                    .topLeft),

                                  //Text()
                                  //
                                  Text(payload!= null?payload!.payload.ageName:"")
                                ],),),)
                        ],)

                        /*DrawerHeader(

              decoration:
              child:
              Center(   child:

                  Text("fdjlk")
              */ /*Image.asset("assets/images/icon_user.png")*/ /*)


              */ /*Row(

                  children: [
                    Container(margin: EdgeInsets.only(bottom: 0, left: 15),width: 20, height: 20,child:Image.asset("assets/images/icon_user.png"))
                    Padding(padding: EdgeInsets.only(bottom: 40),child:Align(alignment: Alignment.topCenter,child:Center(
                      child:

                Image.asset("assets/images/icon_user.png"),),),),
              ])*/ /*,
              */ /*Padding(
                padding: EdgeInsets.only(left: 10, top: 15, right: 10)
              ),*/ /*
            )*/,),),),
                  ListTile(
                    leading: Image.asset('assets/images/dashboard_1.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    title:  Text(home!),
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/quizzes.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    //String? rewards;
                    title:  Text(quizzes!),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) => const QuizGrid()
                            //NewFile()
                          ));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/video.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    title:  Text(videos!),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>  VideoDisplay(category_id: 0,
                          sub_category_id: "", sub_name: "",)),
                      );
                      /* Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                             ));*/
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/study_material.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    title:  Text(studyMaterial!),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) => const StudyMaterialGrid()));
                    },
                  ), ListTile(
                    leading: Image.asset(
                      'assets/images/chat_interaction.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    title: Text(/*LanguageBuilder.texts!['main_page']['Chat Integration']*/chatSupport!),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) =>  ChatFunction()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/reward_display.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    title:  Text(rewards!),
                    onTap: () {

                      /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) =>  ChatFunction()));*/
                      // Update the state of the app.
                      // ...
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) => const NewFile()
                            //NewFile()
                          ));
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ChatFunction()));*/
                    },
                  ), ListTile(
                    leading: Image.asset('assets/images/contact_us.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    title:  Text(contact!),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => contactUs()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/faq.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    title: Text(/*LanguageBuilder.texts!['main_page']['FAQ']*/AppLocalizations.of(context)!.faq),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Faq()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/video.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    title:  Text(changeLang!),
                    onTap: () async {

                      _scaffoldKey.currentState?.openEndDrawer();

                      final prefs = await SharedPreferences.getInstance();
                      var str = await prefs.getString('lang');


                      //await prefs.setString('lang', 'hi');

                      if (str == 'en') {
                        changeLanguage('hi');
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Body2(isLogin: false,)));*/
                      }
                      else {
                        changeLanguage('en');
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Body2(isLogin: false,)));*/
                      }
                      /*if (MyStaticData.myValue == 0) {
                        changeLanguage('hi');
                        final prefs = await SharedPreferences.getInstance();
                        var str = await prefs.getString('lang');


                        await prefs.setString('lang', 'hi');



                        //MyStaticData.myValue = 1;
                      }*/
                    //else
                        //changeLanguage('en');
                      //final prefs = await SharedPreferences.getInstance();
                      //var str = await prefs.getString('lang');


                      /*await prefs.setString('lang', 'en');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Body2(isLogin: false,)));*/
                      //MyStaticData.myValue = 0;

                       /*if (langVar == true) {
                         langVar = false;
                         changeLanguage('en');

                         final prefs = await SharedPreferences.getInstance();
                         var str = await prefs.getString('lang');


                         await prefs.setString('lang', 'en');
// set value
                         //await prefs.setInt('user_id', data.payload.id);
                         var string =  prefs.getString('auth-token');

                         var token = string;

                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (
      context) =>   Body2(isLogin: false,)));
                       }*/
                      /*else {


                        langVar = true;
                         changeLanguage('hi');

                        final prefs1 = await SharedPreferences.getInstance();

                        await prefs1.setString('lang', 'hi');

                        final prefs = await SharedPreferences.getInstance();

// set value
                         //await prefs.setInt('user_id', data.payload.id);
                         var string =  prefs.getString('auth-token');

                         var token = string;

                         Navigator.push(
                             context,
                             MaterialPageRoute(builder: (
                                 context) =>   Body2(isLogin: false,)));
                       }*/
                      // Update the state of the app.
                      // ...
                      /*if (e != LanguageBuilder.getCurrentLang()) {
                        LanguageBuilder.changeLanguage(e, context);
                      }*/
                      //LanguageBuilder.changeLanguage(lang, context)
                    },
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/log_out.png', scale: 1.0,
                      height: 30.0,
                      width: 30.0,),

                    title:  Text(logout!,),

                    onTap: () {
                      setLoginStatus();
                      // Update the state of the app.
                      // ...

                    },
                  )
                ]
                )
            ):null,
            //getDrawer(),
            extendBodyBehindAppBar: true,

            appBar:
            /* CustomAppBar(
              onButtonPressed: _incrementCounter,
            ),*/
            MyAppBar(
                payload: payload2, isScroll: false, loginStatus: loginStatus!,updateValue: _updateAgeStatus),
            //drawer: Drawer(),

            body:
            /*Localizations.override(
              context: context,
              locale: locale,*/
            Localizations.override(
              context: context,
              locale: locale,
              // Using a Builder to get the correct BuildContext.
              // Alternatively, you can create a new widget and Localizations.override
              // will pass the updated BuildContext to the new widget.
              child: Builder(
                builder: (context) {
                  home = AppLocalizations.of(context)!.home;
                  rewards = AppLocalizations.of(context)!.rewards;
                  videos = AppLocalizations.of(context)!.videos;
                  quizzes = AppLocalizations.of(context)?.quizzes;
                  studyMaterial = AppLocalizations.of(context)!.study_material;
                  chatSupport = AppLocalizations.of(context)!.chat_support;
                  contact = AppLocalizations.of(context)!.contact_us;
                  faq = AppLocalizations.of(context)!.faq;
                  logout = AppLocalizations.of(context)!.log_out;
                  latestQuiz = AppLocalizations.of(context)!.latest_quiz;
                  trending = AppLocalizations.of(context)!.trending;
                  seeAll = AppLocalizations.of(context)!.see_all;
                  recentQuiz = AppLocalizations.of(context)!.rewards;
                  changeLang = AppLocalizations.of(context)!.change_lang;
                  /*quizzes = AppLocalizations.of(context)!.quizzes;
                  videos = AppLocalizations.of(context)!.videos;
                  studyMaterial = AppLocalizations.of(context)!.study_material;
                  chatSupport = AppLocalizations.of(context)!.chat_integration;
                  rewards = AppLocalizations.of(context)!.rewards;
                  contact = AppLocalizations.of(context)!.contact_us;
                  faq = AppLocalizations.of(context)!.faq;
                  logou*/

                  // A toy example for an internationalized Material widget.
                  return
                    InkWell(
                      onTap: () {
                        if (loginStatus!=true)
                          showDialog1();
                      },



                      // Using a Builder to get the correct BuildContext.
                      // Alternatively, you can create a new widget and Localizations.override
                      // will pass the updated BuildContext to the new widget.
                      child: Builder(
                          builder: (context) {

/*      home = AppLocalizations.of(context)!.home;
      videos = AppLocalizations.of(context)!.videos;
      quizzes = AppLocalizations.of(context)!.quizzes;*/

                            /* String? chatSupport;
      String? videos;
      String? quizzes;*/
                            //text = AppLocalizations.of(context)!.helloWorld;
                            return

                              Container(
                                width: 400,
                                height: double.infinity,
                                alignment: Alignment.center,
                                /*decoration: BoxDecoration(
         // color: Colors.deepPurple,
          borderRadius:BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/dashboard.png"
              )
          ),

        ),*/
                                /*child: Container(
          margin: EdgeInsets.only(left:20.0,right: 20,top: 40),
          child: Stack(children: Widget[

*/ /*
          Container(
            //height: size.height*0.4-10,
              decoration: BoxDecoration(color: Colors.deepPurple,
                borderRadius:BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/dashboard.png"
                    )
                ),
//
              )

          ),
*/ /*

              ])


            ], ),
        )
        child: Stack(children: Widget[], ),*/
                                child: SingleChildScrollView(
                                  //controller: scrollController,
                                  child: InkWell(
                                    child: Column(
                                      children: <Widget>
                                      [
                                        Container( // purple box
                                            child: Stack(
                                                children: <Widget>[
                                                  /*Stack(children: [*/
                                                  Container(
                                                      height: 200,
                                                      decoration: BoxDecoration(
                                                        color: Colors.deepPurple,
                                                        borderRadius: BorderRadius
                                                            .only(
                                                          bottomLeft: Radius.circular(40),

                                                          bottomRight: Radius.circular(40),),
                                                        image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: AssetImage(
                                                                "assets/images/dashboard_background.jpg"
                                                            )
                                                        ),
//
                                                      )

                                                  ),
                                                  /*],)*/


                                                  Container(

                                                    height: 200,
                                                    margin: EdgeInsets.only(top: 130), child:

                                                  FutureBuilder<HomePageData>(
                                                      future: homePageData,


                                                      builder: (context, snapshot) {
                                                        //if (snapshot.data) {
                                                        return

                                                          /*ListView.builder(

    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data?.payload.banners.length,
    // itemCount: snapshot.data?.payload.length,
    itemBuilder: (context, index) {
*/

                                                          Column(children: [

                                                            CarouselSlider(

                                                              items:

                                                              /*return*/
                                                              snapshot.data?.payload.banners.map((
                                                                  e) =>

                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      if ((loginStatus == false))
                                                                        /*Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (
                                                        context) => const QuizGrid()));
                                              else*/
                                                                        showDialog1();

                                                                    },
                                                                    child:
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left: 10, right: 10),
                                                                      child:
                                                                      Container(
                                                                        height: 370,
                                                                        width: 350,
                                                                        //child: Text("ajfjfj"),
                                                                        decoration: BoxDecoration(
                                                                            color: Colors.white,
                                                                            borderRadius: BorderRadius
                                                                                .circular(8.0),

                                                                            image: DecorationImage(

                                                                              image: NetworkImage(e
                                                                                  .imageUrl as String),

                                                                              fit: BoxFit.cover,
                                                                            )),),),),).toList(),
                                                              options:
                                                              CarouselOptions(
                                                                  height: 170.0,
                                                                  enlargeCenterPage: true,
                                                                  autoPlay: true,
                                                                  aspectRatio: 16 / 9,
                                                                  autoPlayCurve: Curves
                                                                      .fastOutSlowIn,
                                                                  enableInfiniteScroll: true,
                                                                  autoPlayAnimationDuration: Duration(
                                                                      milliseconds: 800),
                                                                  viewportFraction: 0.8,
                                                                  onPageChanged: (index, reason) {
                                                                    setState(() {
                                                                      current = index;
                                                                    });
                                                                  }
                                                              ),),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment
                                                                  .center,
                                                              children:

                                                              snapshot.data!.payload.banners.map((
                                                                  e) {
                                                                int? index = snapshot.data
                                                                    ?.payload.banners.indexOf(e);
                                                                /*if ((loginStatus == true))
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (
                                                        context) => const QuizGrid()));
                                              else
                                                showDialog1();*/

                                                                return InkWell(
                                                                  onTap: () {
                                                                    //if ((loginStatus == false))
                                                                    /* Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (
                                                            context) => const QuizGrid()));*/
                                                                    //else
                                                                    showDialog1();
                                                                  },
                                                                  child:
                                                                  Container(
                                                                    width: 8,
                                                                    height: 8,
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical: 10,
                                                                        horizontal: 3),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: current == index
                                                                            ? Color.fromRGBO(
                                                                            0, 0, 0, 0.9)
                                                                            : Color.fromRGBO(
                                                                            0, 0, 0, 0.4)
                                                                    ),
                                                                  ),);
                                                              }).toList()
                                                              ,
                                                            )
                                                          ]);
                                                      }),),


                                                  /*Container(

                          height: 160,
                          margin: EdgeInsets.only(top: 130),

                          child: FutureBuilder<HomePageData>(
                            future: homePageData,
                          */ /*child: FutureBuilder<CommunityPost>(
                            future: communityPost,*/ /*
                            builder: (context, snapshot) {


                              */ /*ErrorWidget.builder*/ /*
                              //if (snapshot.data) {
                                return

                                  ListView.builder(

                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data?.payload.banners.length,
                                   // itemCount: snapshot.data?.payload.length,
                                  itemBuilder: (context, index) {

                                    return
                                      Padding(padding: EdgeInsets.only( left: 10,right: 10),child:
                                    Container(
                                      height: 350,
                                      width: 350,
                                        //child: Text("ajfjfj"),
                                        decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8.0),

                                    image: DecorationImage(

                                    image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl! as String),

                                    fit: BoxFit.cover,
                                    )),),);}
                                   ,
                                    );
                                  },
                                ),)*/


                                                  //18002100018


                                                ]
                                            )


                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(left: 15.0),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: 10), child:
                                                  Text(latestQuiz!,
                                                      style: /*GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w800
                            )*/
                                                      TextStyle(color: Colors.black,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 17,
                                                          fontWeight: FontWeight.w800)


                                                    /*style:TextStyle(fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'Poppins'
                              )*/),),),

                                                InkWell(
                                                  onTap: () async {
                                                    /*var chk = await getLoginStatus();*/
                                                    if ((loginStatus == true))
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (
                                                              context) => const QuizGrid()));
                                                    else
                                                      showDialog1();
                                                  }, child:
                                                Container(

                                                  margin: EdgeInsets.only(right: 15.0),
                                                  child:
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 10), child:
                                                  Text(
                                                    seeAll!, textAlign: TextAlign.right, style: /*GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400,color: ColorConstants.backgroundColor
                          )*/ TextStyle(color: ColorConstants.backgroundColor,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400),),),),)

                                              ],
                                            )
                                        ),

                                        Container(
                                            height: 160,
                                            margin: EdgeInsets.only(top: 16, right: 10),
                                            child: FutureBuilder<HomePageData>(
                                              future: homePageData,
                                              builder: (context, snapshot) {
                                                //if (snapshot.data) {
                                                return

                                                  ListView.builder(

                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: snapshot.data?.payload.latestQuiz
                                                        .length,
                                                    itemBuilder: (context, index) {
                                                      int? id = snapshot.data?.payload
                                                          .latestQuiz[index].id;
                                                      String? name = snapshot.data?.payload
                                                          .latestQuiz[index].name;

                                                      return

                                                        Padding(
                                                          padding: EdgeInsets.only(left: 10),
                                                          child:
                                                          InkWell(
                                                            onTap: () async {
                                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizGrid()));
                                                              // var chk = await getLoginStatus();
                                                              if ((loginStatus == true))
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            QuizSubCategory(
                                                                              category_id: id!,
                                                                              category_name: name!,)));
                                                              else
                                                                showDialog1();

                                                              /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()));*/
                                                            },
                                                            child:
                                                            Container(
                                                              height: 350,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius
                                                                    .circular(8.0),
                                                                image: DecorationImage(

                                                                  image: NetworkImage(
                                                                      snapshot.data?.payload
                                                                          .latestQuiz[index]
                                                                          .imageUrl as String),

                                                                  fit: BoxFit.cover,
                                                                ),),
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: 100),
                                                                child: Center(
                                                                    child: Text(
                                                                      snapshot.data?.payload
                                                                          .latestQuiz[index]
                                                                          .name as String,
                                                                      textAlign: TextAlign.center,
                                                                      style:
                                                                      TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 15.0,
                                                                        fontWeight: FontWeight
                                                                            .bold,),

                                                                    )
                                                                ),
                                                              ),),),);
                                                    },);
                                              },)

                                          /*Container(
                  height: 160,
                  margin: EdgeInsets.only(top: 10),
                  child: ListView(
    child: FutureBuilder<HomePageData>(
    future: fetchHomeData(),
    builder: (context, snapshot) {
    //if (snapshot.data) {
    return

    ListView.builder(

    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data?.payload.banners.length,
    itemBuilder: (context, index) {

    return
    Container(
    height: 350,
    width: 400,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    image: DecorationImage(

    image: NetworkImage(snapshot.data?.payload.banners![index].imageUrl as String),

    fit: BoxFit.cover,
    ),),);}
*/
                                          /*child: ListView(scrollDirection: Axis.horizontal,

                    children:  <Widget> [
                      Padding(padding: EdgeInsets.only(right: 15, left: 10),child:
                      Container(
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/GK-Current-Quiz.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 100),
                              child: Text(
                                "GK and current affairs Quiz",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),)
                          ],
                        ),

                        height: 150,
                      ),),

                      Padding(padding: EdgeInsets.only(right: 10),child:
                      Container(
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Paheli-Quiz.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 100),
                              child: Text(
                                "Paheli \n quiz",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),)
                          ],
                        ),

                        height: 150,
                      ),),
                      Padding(padding: EdgeInsets.only(right: 10, left : 5),child:
                      Container(
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/YouTube-Quiz.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 100),
                              child: Text(
                                "Youtube \n Quiz",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),)
                          ],
                        ),

                        height: 150,
                      ),),
                      Padding(padding: EdgeInsets.only(right: 10, left: 5),child:
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Regional-Paheli-Quiz.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 100),
                              child: Text(
                                "Regional Paheli Quiz",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),)
                          ],
                        ),

                        height: 150,
                      ),),
                      Padding(padding: EdgeInsets.only(right: 10, left: 5),child:
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: Bordcular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Plant-Tree.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 100),
                              child: Text(
                                "Plant a Tree",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),)
                          ],
                        ),

                        height: 150,
                      ),),

                    ],
                  ),*/
                                        ),


                                        Container(
                                            margin: EdgeInsets.only(top: 15),

                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container(
                                                  margin: EdgeInsets.only(left: 15.0, top: 10),
                                                  child:

                                                  Text(trending!, style: /*GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w800
                          ) */
                                                  TextStyle(fontFamily: 'Poppins',
                                                      fontSize: 17, fontWeight: FontWeight.w800)


                                                    ,),),

                                                InkWell(

                                                  onTap: () async {
                                                    // var chk = await getLoginStatus();
                                                    if ((loginStatus == true))
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (
                                                              context) => const TrendingGrid()));
                                                    else
                                                      showDialog1();
                                                  },

                                                  child:
                                                  Container(
                                                    margin: EdgeInsets.only(right: 15.0),
                                                    child:
                                                    InkWell(
                                                      onTap: (){
                                                        if ((loginStatus == true))
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) =>  /*StudySubCategory(study_cat_id: payload.id?.toInt() ?? 0, study_name: payload.name,))*/

                                                              TrendingGrid()
                                                                /*StudyMaterialSubCategory(category_id: payload.id?.toInt() ?? 0, category_name: payload.name)*/));
                                                        else
                                                          showDialog1();

                                                        //QuizSubCategory(category_id: payload.id?.toInt() ?? 0, category_name: payload.name,))


                                                      },
                                                      child:
                                                      Text(seeAll!, textAlign: TextAlign.right,
                                                        style:
                                                        TextStyle(
                                                            color: ColorConstants.backgroundColor,
                                                            fontFamily: 'Poppins',
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400)
                                                        /*GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400,color: ColorConstants.backgroundColor
                          )*/,),),),)
                                                /*Container(
                          margin: EdgeInsets.only(right:10.0),
                          child:
                          Text('See all' ,textAlign: TextAlign.right,style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400,color: ColorConstants.backgroundColor
                          ) ,),)*/

                                              ],
                                            )
                                        ),

                                        SizedBox(height: 8,),

                                        Container(
                                          //height: 10.h,
                                          height: 30.h,
                                          padding: EdgeInsets.only(top: 0),
                                          //margin: EdgeInsets.only(top: 40),
                                          child: FutureBuilder<HomePageData>(

                                            future: homePageData,
                                            builder: (context, snapshot) {
                                              //if (snapshot.data) {
                                              return

                                                GridView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.only(top: 0, bottom: 0),
                                                  gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(

                                                    /*mainAxisSpacing: ,*/ /*maxCrossAxisExtent: 200,*/
                                                    childAspectRatio: 1.7,
                                                    crossAxisSpacing: 0, crossAxisCount: 2,


                                                  ),

                                                  itemCount: snapshot.data?.payload.tranding
                                                      .length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, index) {
                                                    String? name = snapshot.data?.payload
                                                        .tranding[index].name;
                                                    int? id = snapshot.data?.payload
                                                        .tranding[index].id;
                                                    return

                                                      //                             Text("${snapshot.data?.payload.tranding[index].name}")
                                                      InkWell(onTap: () async {
                                                        /* final prefs = await SharedPreferences.getInstance();

// set value
                                    */ /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/ /*
                                    // bool? loginBit = await prefs.getBool('isLogin');
                                    bool? CheckValue = await prefs.getBool('isLogin');
                                    if (CheckValue == null)*/
                                                        // var chk = await getLoginStatus();
                                                        if ((loginStatus == true))
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      QuizSubCategory(
                                                                        category_id: id!,
                                                                        category_name: name!,)));
                                                        else
                                                          showDialog1();
                                                      }, child:
                                                      Container(

                                                        //height: 100,
                                                        height: 100,

                                                        child:
                                                        AspectRatio(aspectRatio: 16 / 13,
                                                          child:

                                                          getItem(snapshot.data?.payload
                                                              .tranding[index] as LatestQuiz,
                                                              index)
                                                          ,),),);
                                                  },);
                                            },),),


/*
          Column(children: [
            Container(
            height: 130,
            child: Row(children:[Padding(padding: EdgeInsets.only(right: 10, left: 20),child:
            Container(
            width: 150,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                image: DecorationImage(
                  image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/GK-Current-Quiz.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                "GK and current affairs Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),),


              Row(children:[Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
              Container(
                height: 130,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                    image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/GK-Current-Quiz.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  "GK and current affairs Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),),

              ]),],),),],),

*/
                                        /*Column(children: [
                  Container(
                    height: 70,
                    child: Row(children:[Padding(padding: EdgeInsets.only(right: 10, left: 20),child:
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                          image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Community-Quiz.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(padding: EdgeInsets.only(right: 10, left: 20,top: 40),
                        child: Text(

                        "Community Post",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),),
                    ),),


                      Row(children:[Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
                      Container(
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Human-Welfare.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(padding: EdgeInsets.only(right: 10, left: 20,top: 40),
                          child: Text(

                          "Human Welfare",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),),
                      ),),

                      ]),],),),],)*/
/*

                Column(
                  children:[
                    Container(height:160,
                      child:
                      Stack(
                        children:<Widget>
                        [

                          Container(
                            child: IgnorePointer(
                              child: GridView.count(

                                crossAxisSpacing: 16.0,
                                crossAxisCount: 3,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left:10.0),

                                    decoration: BoxDecoration(

                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/gk_quiz_current.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.only(top: 60),
                                          child: Text(
                                            'GK & current '
                                                'Affair Quiz',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),)
                                      ],
                                    ),

                                    height: 150,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/paheli_quiz.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.only(top: 80),
                                          child: Text(
                                            "Paheli quiz",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),)
                                      ],
                                    ),

                                    height: 150,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left:10.0),

                                    decoration: BoxDecoration(

                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/gk_quiz_current.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.only(top: 60),
                                          child: Text(
                                            'GK & current '
                                                'Affair Quiz',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),)
                                      ],
                                    ),

                                    height: 150,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

*/
                                        SizedBox(height: 15,),
                                        Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(left: 15.0),
                                                  child:

                                                  Text(studyMaterial!, style: /*GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w800
                          )*/ TextStyle(fontFamily: 'Poppins',
                                                      fontSize: 17, fontWeight: FontWeight.w800)

                                                  ),),
                                                InkWell(

                                                  onTap: () async {
                                                    // var chk = await getLoginStatus();
                                                    if ((loginStatus == true))
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (
                                                              context) => const StudyMaterialGrid()));
                                                    else
                                                      showDialog1();
                                                  },

                                                  child:
                                                  Container(
                                                    margin: EdgeInsets.only(right: 15.0),
                                                    child:
                                                    Text(seeAll!, textAlign: TextAlign.right,
                                                      style:
                                                      TextStyle(
                                                          color: ColorConstants.backgroundColor,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400)
                                                      /*GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400,color: ColorConstants.backgroundColor
                          )*/,),),)

                                              ],
                                            )
                                        ),

                                        SizedBox(height: 8,),

                                        /*Column(children: [
                  Container(
                    height: 70,
                    child: Row(children:[Padding(padding: EdgeInsets.only(right: 10, left: 20),child:
                    Container(
                      width: 150,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                          image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/GK-Current-Quiz.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(padding: EdgeInsets.only(right: 10, left: 20,top: 30),
                        child: Text(
                        "GK and current affairs Quiz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),),
                    ),),


                      Row(children:[Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
                      Container(
                        height: 13`0,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Study-GKCurrent.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(padding: EdgeInsets.only(right: 10, left: 20,top: 40),
                          child: Text(
                          "Paheli Gyan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),),
                      ),),

                      ]),],),),],),
                SizedBox(height: 15,),
                Column(children: [
                  Container(
                    height: 70,
                    child: Row(children:[Padding(padding: EdgeInsets.only(right: 10, left: 20),child:
                    Container(
                      width: 150,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                          image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Study-YouTube-Knowledge.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(padding: EdgeInsets.only(right: 10, left: 20,top: 30),
                        child: Text(
                        "Youtube Knowledge",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),),


                      Row(children:[Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
                      Container(
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Study-Regional-Paheli.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(padding: EdgeInsets.only(right: 10, left: 20,top: 40),
                          child: Text(
                          "Regional Paheli",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),),
                      ),),

                      ]),],),),],),
*/
                                        Container(
                                          height: 35.h,
                                          /*padding: EdgeInsets.only(top: 5),*/
                                          //margin: EdgeInsets.only(top: 40),
                                          child: FutureBuilder<HomePageData>(
                                            future: homePageData,
                                            builder: (context, snapshot) {
                                              //if (snapshot.data) {
                                              return

                                                GridView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.only(top: 0, bottom: 0),
                                                  gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(

                                                    /*mainAxisSpacing: ,*/ /*maxCrossAxisExtent: 200,*/
                                                    childAspectRatio: 1.65,
                                                    crossAxisSpacing: 0, crossAxisCount: 2,


                                                  ),

                                                  itemCount: snapshot.data?.payload.studyMaterial
                                                      .length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, index) {
                                                    int? id = snapshot.data?.payload
                                                        .studyMaterial[index].id;
                                                    String? str = snapshot.data?.payload
                                                        .studyMaterial[index].name;
                                                    return

                                                      //
                                                      //                             Text("${snapshot.data?.payload.tranding[index].name}")

                                                      InkWell(onTap: () async {
                                                        // var chk = await getLoginStatus();
                                                        if ((loginStatus == true))
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      StudyMaterialSubCategory(
                                                                          category_id: id!,
                                                                          category_name: str)));
                                                        //QuizSubCategory(category_id: id!,category_name: str!,)));
                                                        else {
                                                          showDialog1();
                                                        }
                                                      }, child:
                                                      Container(

                                                        height: 50,
                                                        child:
                                                        AspectRatio(aspectRatio: 16 / 13,
                                                          child: getItem2(snapshot.data?.payload
                                                              .studyMaterial[index] as LatestQuiz,
                                                              index)
                                                          ,),),);
                                                  },);
                                            },),),



                                        Visibility(child:
                                        Container(child: Column(children: [Container(
                                            margin: EdgeInsets.only(left: 15.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(left: 15.0),
                                                  child:

                                                  Text(rewards!, style: /*GoogleFonts.poppins(
                              fontSize: 17, fontWeight: FontWeight.w800
                          )*/ TextStyle(fontFamily: 'Poppins',
                                                      fontSize: 17, fontWeight: FontWeight.w800)

                                                  ),),
                                                /*InkWell(

                                onTap: () async {
                                  // var chk = await getLoginStatus();
                                  if ((loginStatus == true))
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (
                                            context) => const StudyMaterialGrid()));
                                  else
                                    showDialog1();
                                },

                                child:
                                Container(
                                  margin: EdgeInsets.only(right: 15.0),
                                  child:
                                  Text('See all', textAlign: TextAlign.right,
                                    style:
                                    TextStyle(
                                        color: ColorConstants.backgroundColor,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)
                                    *//*GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400,color: ColorConstants.backgroundColor
                          )*//*,),),)*/

                                              ],
                                            )
                                        ),


                                          SizedBox(height: 8,),
/*
                Container(
                  height: 100,
                  margin: EdgeInsets.only(top: 40),
                  child: FutureBuilder<HomePageData>(
                    future: fetchHomeData(),
                    builder: (context, snapshot) {
                      //if (snapshot.data) {
                      return

                        GridView.builder(
                          padding: EdgeInsets.only(top: 0,bottom: 0),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(

                            */ /*mainAxisSpacing: ,*/ /* */ /*maxCrossAxisExtent: 200,*/ /*
                            childAspectRatio: 1.7,
                            crossAxisSpacing: 0, crossAxisCount: 2,



                          ),

*/ /*
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
*/ /*

                          itemCount: snapshot.data?.payload.studyMaterial.length,
                          itemBuilder: (context, index) {

                            return

                              Padding(
                                padding: EdgeInsets.only(right: 15, left: 15,top: 10),
                            child:



    Container(

        height: 100,
        child:
        AspectRatio(aspectRatio: 16 / 13,
          child: getItem(snapshot.data?.payload.tranding[index] as LatestQuiz, index)
          ,)
                                */ /*height: 350,
                                width: 100,
                                child: Padding(padding: EdgeInsets.only(top: 100),
                                  child: Center(
                                    child: Text(
                                      snapshot.data?.payload.studyMaterial[index].name as String,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(

                                    image: NetworkImage(snapshot.data?.payload.studyMaterial[index].imageUrl as String),

                                    fit: BoxFit.cover,
                                  ),),*/ /*),);},);},),)*/
/*
                Column(children: [
                  Container(
                    height: 70,

                    child: Stack(
                      children:<Widget> [
                        Container(

                          child: IgnorePointer(
                            child: GridView.count(crossAxisCount:2,
                              crossAxisSpacing: 16.0,

                              children: [
                                Container(
                                  margin: EdgeInsets.only(left:10.0),

                                  decoration: BoxDecoration(

                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/gk_quiz_current.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 50),
                                        child: Text(
                                          'GK & current '
                                              'Affair Quiz',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),)
                                    ],
                                  ),

                                  height: 150,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right:10.0,),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                      bottomRight:Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/study_regional_paheli.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 50),
                                        child: Text(
                                          'GK & current '
                                              'Affair Quiz',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),)
                                    ],
                                  ),

                                ),

                              ],
                            ),
                          ),

                        )

                      ],),
                  )
                ],),

                SizedBox(height: 15,),


                Column(children: [
                  Container(
                    height: 70,

                    child: Stack(
                      children:<Widget> [
                        Container(

                          child: IgnorePointer(
                            child: GridView.count(crossAxisCount:2,
                              crossAxisSpacing: 16.0,

                              children: [
                                Container(
                                  margin: EdgeInsets.only(left:10.0),

                                  decoration: BoxDecoration(

                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/study_youtube_knowledge.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 50),
                                        child: Text(
                                          'GK & current '
                                              'Affair Quiz',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),)
                                    ],
                                  ),

                                  height: 150,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right:10.0,),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                      bottomRight:Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/study_paheli_gyan.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 50),
                                        child: Text(
                                          'GK & current '
                                              'Affair Quiz',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),)
                                    ],
                                  ),

                                ),

                              ],
                            ),
                          ),

                        )

                      ],),
                  )
                ],),
*/




                                          Container(


                                            width: 500,
                                            margin: EdgeInsets.only(top: 20), child:

                                          FutureBuilder<HomePageData>(
                                              future: homePageData,


                                              builder: (context, snapshot) {
                                                //if (snapshot.data) {
                                                return

                                                  /*ListView.builder(

    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data?.payload.banners.length,
    // itemCount: snapshot.data?.payload.length,
    itemBuilder: (context, index) {
*/

                                                  Column(children: [

                                                    CarouselSlider(

                                                      items:

                                                      /*return*/
                                                      snapshot.data?.payload.recentQuiz.map((
                                                          e) =>
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                left: 10, right: 10),
                                                            child:
                                                            Container(

                                                                width: 600,
                                                                //child: Text("ajfjfj"),
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius
                                                                        .circular(8.0),

                                                                    image: DecorationImage(

                                                                      image: AssetImage("assets/images/recent_bck.png"),

                                                                      fit: BoxFit.cover,
                                                                    )),child:
                                                            getItem3(e, current!)
                                                            ),),).toList(),
                                                      options:
                                                      CarouselOptions(
                                                          height: 200.0,
                                                          enlargeCenterPage: true,
                                                          autoPlay: true,


                                                          aspectRatio: 16 / 16,
                                                          autoPlayCurve: Curves
                                                              .fastOutSlowIn,
                                                          enableInfiniteScroll: true,
                                                          autoPlayAnimationDuration: Duration(
                                                              milliseconds: 800),
                                                          viewportFraction: 1.0,
                                                          onPageChanged: (index, reason) {
                                                            setState(() {
                                                              current = index;
                                                            });
                                                          }
                                                      ),),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children:

                                                      snapshot.data!.payload.recentQuiz.map((
                                                          e) {
                                                        int? index = snapshot.data
                                                            ?.payload.recentQuiz.indexOf(e);
                                                        return Container(
                                                          width: 8,
                                                          height: 8,
                                                          margin: EdgeInsets.symmetric(
                                                              vertical: 10,
                                                              horizontal: 3),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: current == index
                                                                  ? Color.fromRGBO(
                                                                  0, 0, 0, 0.9)
                                                                  : Color.fromRGBO(
                                                                  0, 0, 0, 0.4)
                                                          ),
                                                        );
                                                      }).toList()
                                                      ,
                                                    )
                                                  ]);
                                              }),)],),),
                                          visible: loginStatus! && recentQuizLength! > 0,
                                          maintainState :false,
                                          maintainAnimation :false,
                                          maintainSize :false,
                                          maintainSemantics : false,
                                          maintainInteractivity : false,
                                        )

/*
                      Container(
                        height: 120,
margin: EdgeInsets.only(top: 10),
                        child:

                        //getItem4()
                        FutureBuilder<HomePageData>(
                            future: homePageData,
                            builder: (context, snapshot) {
                              //if (snapshot.data) {
                              return

                                ListView.builder(

                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data?.payload.recentQuiz
                                        .length,
                                    itemBuilder: (context, index) {
                                      *//*  FutureBuilder<HomePageData>(
                          future: homePageData,
                          builder: (context, snapshot) {*//*
                                      //if (snapshot.data) {
                                      return

                                        *//* ListView.builder(

                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data?.payload.recentQuiz.length,
                                itemBuilder: (context, index) {
                                  //int? id = snapshot.data?.payload.recentQuiz[index].id;
                                  //String? name = snapshot.data?.payload.recentQuiz[index].name;

                                  return*//*

                                        Padding(
                                          padding: EdgeInsets.only(left: 10, bottom: 10),
                                          child:
                                          InkWell(
                                            onTap: () async {
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizGrid()));
                                              // var chk = await getLoginStatus();
                                              if ((loginStatus == true)) {}
                                              *//*    Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  QuizSubCategory(category_id: id!,category_name: name!,)));*//*

                                              //showDialog1();

                                              *//*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()));*//*
                                            },
                                            child:
                                                Expanded(child:
                                            Container(

                                              width: 300,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: ColorConstants
                                                    .skyBlueColor,
                                                  borderRadius: BorderRadius
                                                    .circular(8.0),
                                                *//* image: DecorationImage(

                                            image: NetworkImage(snapshot.data?.payload.latestQuiz[index].imageUrl as String),

                                            fit: BoxFit.cover,
                                          )*//*),
                                              child:
                                              getItem3(snapshot.data!.payload
                                                  .recentQuiz[index],
                                                  index)
                                              *//*FittedBox(fit: BoxFit.scaleDown,child:getItem3(snapshot.data!.payload
                                                  .recentQuiz[index],
                                                  index),)*//*,),),),);
                                    });
                            }),)*/


                                      ],

                                    ),),),);}),);},),),
            bottomNavigationBar:
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  onTap: (value) {
                    if (value == 1) {
                      if (loginStatus == true)
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) =>  ChatFunction()));
                      else
                        showDialog1();
                    }
                    if (value == 3) {
                      if (loginStatus == true)
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) => const QuizGrid()
                              //NewFile()
                            ));
                      else
                        showDialog1();
                    }
                    if (value == 4) {
                      if (loginStatus == true)
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) =>  //RewardHistory()
                            openProfile()
                              //NewFile()
                            ));

                      //  NewFile();
                      else
                        showDialog1();
                      //if (isLogin1 == true)
                      /*final prefs = await SharedPreferences.getInstance();

// set value
          */ /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/ /*
          // bool? loginBit = await prefs.getBool('isLogin');
          bool? CheckValue = await prefs.getBool('isLogin');
          if (CheckValue == null)
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile(payload3: payload2!)));*/
                    }
                    if (value == 2) {
                      if (loginStatus == true)
                        //openRewards();
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) => const NewFile()
                              //NewFile()
                            ));

                      else
                        showDialog1();
                      /*final prefs = await SharedPreferences.getInstance();

// set value
          */ /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/ /*
          // bool? loginBit = await prefs.getBool('isLogin');
          bool? CheckValue = await prefs.getBool('isLogin');
          if (CheckValue == null)
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RewardDisplay(
          )));*/
                    }
                    /*if (value == 3) {
          if (isLogin1 == true)
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizChapter()));
        }*/
                  },
                  backgroundColor: ColorConstants.backgroundColor,
                  // <-- This works for fixed
                  selectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.white,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      label: "Home",
                      icon: Icon(Icons.home),

                    ),
                    BottomNavigationBarItem(

                      label: "Chat",
                      icon: Icon(Icons.chat),
                    ),

                    BottomNavigationBarItem(
                      icon: Icon(Icons.monetization_on),
                      label: 'Rewards',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.quiz),
                      label: 'Quiz',
                    ),

                    BottomNavigationBarItem(
                      label: "Profile",

                      icon: Icon(Icons.account_circle),
                    ),
                  ],


                )

                ,),),),);/*}).toList()*/});}



  String formatHtmlString(String string) {
    return string
        .replaceAll("<p>", "") // Paragraphs
        .replaceAll("</p>", "") // Line Breaks
    /*.replaceAll("\"", "&quot;") // Quote Marks
        .replaceAll("'", "&apos;") // Apostrophe
        .replaceAll(">", "&lt;") // Less-than Comparator (Strip Tags)
        .replaceAll("<", "&gt;") */// Greater-than Comparator (Strip Tags)
        .trim(); // Whitespace
  }


  updateLoginStatus() {
    loginStatus = true;
  }

  void _incrementCounter() {
    setState(() {
      showDialog1();
    });
  }

  void _updateAgeStatus() {
    print('AppBar action pressed');
    setState(() {
      showDialog1();
      print('AppBar action pressed');
    });
    /*setState(() {
      //_value = newValue;
      if (newValue == "1") {
        //setLoginStatus();
        //getLoginStatus();

      }
    });
    loginStatus = true;
    updateLoginStatus();
    setLoginStatus2();*/

  }

  void _updateValue(String newValue) {
    setState(() {
      //_value = newValue;
      if (newValue == "1") {
        //setLoginStatus();
        //getLoginStatus();

      }
    });
    loginStatus = true;
    updateLoginStatus();
    setLoginStatus2();


    /*homePageData = fetchHomeData();
    communityPost = getCommunityPost('1', '10');
    // payload2 = getAges1();
    populateDropDowns2();
    getLoginStatus();
    getUserProfile();*/
  }

  setLoginStatus2() async {
    loginStatus = true;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", true);
// set value
    /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
    //await prefs.setBool('isLogin', false);

  }

  showDialog1() {
    showDialog(context: context, builder: (context) {
      return Container(
        child: AlertDialog(
          title: Center(child:
          Text('Please Login', /*textAlign: TextAlign.right,*/style: /*GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black
                    ) */TextStyle(color: Colors.black, fontFamily: 'Poppins',
              fontSize: 20, fontWeight: FontWeight.w600)

          ),
          ),
          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          actions: [

            TextButton(onPressed: () {
              Navigator.pop(context);
              // runLoginApi
              //fetchAlbum();
              //Navigator.pop(context);
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyStatefulWidget()));
            }, child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: ColorConstants.bluishColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Center(child: Text("Cancel", style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors
                    .black,
                ),),
                ),),
            ),
            ),
            TextButton(onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  MyStatefulWidget(updateValue: _updateValue,)));
            }, child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 0, top: 0),
                child: Center(child: Text(
                  "Ok", style: TextStyle(fontSize: 16, fontWeight: FontWeight
                    .bold, color: Colors.black),),),
              ),
            ),),
          ],

        ),
      );
    },);
  }

  openProfile() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
    // bool? loginBit = await prefs.getBool('isLogin');
    //bool? CheckValue = await prefs.getBool('isLogin');
    if (loginStatus == true)
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) =>
          Profile(payload3: payload2!,profileData:  payload!),
              //ProfileGet(payload3: payload2!, profileData:  payload!),
          //SecondScreen(),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );

    /*Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Profile(payload3: payload2!)));*/
  }

  openRewards() async {
    final prefs = await SharedPreferences.getInstance();

// set value
/*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
// bool? loginBit = await prefs.getBool('isLogin');
    bool? CheckValue = await prefs.getBool('isLogin');
    if (CheckValue == true)
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              RewardDisplay(
              )));
  }


  getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();

// set value
    /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
    bool? loginBit = await prefs.getBool('isLogin');
    if (loginBit == null)
      loginStatus = false;
    else {
      loginStatus = loginBit;
      loginStatus = true;
    }
  }

  setLoginStatus() async {
    loginStatus = false;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", false);
// set value
    /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
    //await prefs.setBool('isLogin', false);

  }
}



