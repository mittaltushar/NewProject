
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rama_puzle/NationalityData.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'AgeModel.dart';
import 'CustomColor.dart';
import 'HttpClient.dart';
import 'Login.dart';
import 'LoginData.dart';

import 'OccupationModel.dart';
import 'ProfileData.dart';
import 'body1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EditProfile extends StatefulWidget {
  String? name;
  String? dob;
  int? age;
  Payload2? payload;
  int? index;
  ProfileData? profile;

  EditProfile({Key? key, required this.profile,required this.name,  required this.age,required this.dob, required this.payload}) : super(key: key);

  @override
  State<EditProfile> createState() => EditProfile2(profileData: profile,name: name, dob: dob, age: age,givePayload: payload);
}
class EditProfile2 extends State<EditProfile> {
  final _form = GlobalKey<FormState>();
  String valueDropDown1 = "0";
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myContoller5 = TextEditingController();
  var updateProfile = "http://www.ramapuzzle.com/api/v1" + "/user/updateProfile";
  List<Payload1> payloadData = [];
  List<Payload2> payloadData2 = [];
  List<Payload3> payloadData3 = [];
  Payload2? givePayload;
  String? name;
  String? dob;
  int? age;
  int? occIndex;
  Payload1? payload;
  Payload2? payload2;
  Payload3? payload3;
  List<Payload2>? payload4;
  DateTime? fromDate = DateTime.now();
  String? _mobileStr= "";
  ProfileData? profileData;
  Locale? locale;
  //String? name;
//double height = MediaQuery.of().size.height;
  //double width = MediaQuery.of(context).size.width;

  EditProfile2({required this.profileData,required this.name, required this.dob, required this.age, required this.givePayload});



  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }

  populateDropDownNationality() async {
    NationalityData data = await getNationality();
    setState(() {
      payloadData3 = data.payload;
    });
  }

  populateAges() async {
    List<Payload2> data = await getAges();
    setState(() {
      payloadData2 = data;
    });
  }

  Payload2? getAge(int? ageId) {
    int? listLength = payload4?.length;

    for (int i = 0 ; i < listLength!; i++ ) {

      if (ageId == payload4?.elementAt(i).id) {
        return payload4?.elementAt(i);
      }
    }
    //throw
  }

  populateDropDowns()async{
    OccupationModel data = await getCity();
    setState(() {
      payloadData = data.payload;
      for (int i = 0; i < payloadData.length; i++) {
        if (profileData?.payload.ageId == payloadData.elementAt(i).id) {
          payload = payloadData.elementAt(i);
        }
      }
      //profileData
    });
  }

  @override
  Future<void> initState() async {
    // TODO: implement initState
    populateDropDowns();
    populateAges();
    populateDropDownNationality();
    myController.text  = name!;
    final prefs = await SharedPreferences.getInstance();

    String? lang = await prefs!.getString('lang');
    locale = Locale(lang!);
    setState(() {

    });
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Call your function here after the widget has been built
      myFunction();

    });
    super.initState();
  }

  void myFunction() {
    print('Function called after build');
    /*numbers.contains(targetNumber)*/
    /*for (int i = 0 ; i < payloadData2.length; i++) {
      if (payloadData2.contains(payload2)) {
        occIndex = i;
      }
    }*/

      setState(() {
        myController.text = name!;
        payload2 = givePayload;


        //my
      });
    }

    gotoUpdate() {

    }

  setNameInPref(String name) async {
    final prefs =  await SharedPreferences.getInstance();

// set value
    prefs.setString('name', name);

  }

  Future<void> selectDateFrom(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      //initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100), initialDate: DateTime.now(),
    );
    if (picked != null
        && picked != fromDate
    ) {
      fromDate = picked;
      setState(() {
        myController.text= name!;
        //myController1.text = dob!;

      });
      // selectedValue.add(categoryValue!);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar:  AppBar(elevation: 0,
          backgroundColor: ColorConstants.backgroundColor,
          centerTitle: true,
          leadingWidth: 30,
          title: Text("Edit Profile"),
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
          /*actions: [
            IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        EditProfile()));
                *//*Body2(isLogin: true)startQuiz20(data1: quizHIstoryData,name:name)*//**//*
          //Body2(isLogin: true)

            //action coe when button is pressed
          )*//*},
              icon: Icon(Icons.add_chart_outlined),
            ),
            *//*Image.asset("assets/images/", height: 20,
          width: 20,)*//*

          ],*/
        ),
        backgroundColor: ColorConstants.backgroundColor,
//backgroundColor: Colors.blue,
        body:
    Localizations.override(
    context: context,
    locale: locale,
    // Using a Builder to get the correct BuildContext.
    // Alternatively, you can create a new widget and Localizations.override
    // will pass the updated BuildContext to the new widget.
    child: Builder(
    builder: (context) {
      name = AppLocalizations.of(context).name;
        return
        Stack(
            key: _form,
            children: <Widget>[
        new Container(decoration: new
            BoxDecoration(image: new DecorationImage(
            image: new AssetImage("assets/images/background_img.png"))),),

    SingleChildScrollView(
    child: Form(
    key: _form,

    child: Column(
    children: <Widget>[
    Padding(
    padding:
    const EdgeInsets.fromLTRB(20.0, 20.0, 12.0, 6.0),

    child: Column(

    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[

    /*Column(crossAxisAlignment: CrossAxisAlignment.start,

    children: <Widget>[

    GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Body2(isLogin: false)));
    },child:

    Image.asset("assets/images/back_arrow.png", height: 20,
    width: 20,)
    ,
    //children: <Widget>[Text("fjkff")],
    ),],)*/
    /*Padding(
    padding:
    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
    child: Image.asset("assets/images/back_arrow.png", height: 20, width: 20)
    )

    ,
*/

    /*Padding(
    padding:
    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
    child: Image.asset("assets/images/back_arrow.png", height: 20, width: 20)
    )
    ,

    Container(
    margin: EdgeInsets.only(left: 20.0, top: 20),

    width: double.infinity,
    child: Text('Update Profile', style: TextStyle(fontSize: 20,
    fontWeight: FontWeight.w600, color: Colors.white),),
    ),*/

    /*Row(

    const Text("Login", style: TextStyle(color: Colors.white, fontSize: 30,), textAlign: TextAlign.left,),
    ),*/

    /*Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: Widget[],
    )*/
/*
    Padding(
    padding: const EdgeInsets.only(left:1,top: 20),
    child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 14),)),*/




    /*Padding(
    padding: const EdgeInsets.fromLTRB(0, 10,78 , 0),
    child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 14),)),*/


    Container(
    margin: EdgeInsets.only(left: 20.0, top: 20),

    width: double.infinity,
    child: Text(name!, style: TextStyle(fontSize: 12,
    fontWeight: FontWeight.w700, color: Colors.white),),
    )
    ,
    Padding(
    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
    child: TextFormField(

    validator: (text) {
    if (text!.isEmpty) {
    return 'Enter enter name';
    }
    return null;
    },
    controller: myController,
    decoration: InputDecoration(

    floatingLabelBehavior: FloatingLabelBehavior.never,
    prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
    child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),)
    ,
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0)
    ),
    labelText: 'Name',

    ),
    ),),
    Container(
    margin: EdgeInsets.only(left: 20.0, top: 20),

    width: double.infinity,
    child: Text('Ages', style: TextStyle(fontSize: 12,
    fontWeight: FontWeight.w700, color: Colors.white),),
    ),
    Padding (
    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
    child:DropdownButtonFormField<Payload2>(

    value: payloadData2.elementAt(0),

    decoration: InputDecoration(
    prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
    child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
    hint: Text('Children (0 to 18)'),
    items: payloadData2.map((Payload2 value) {
    return DropdownMenuItem<Payload2>(
    value: value,
    child: Text(value.name),
    );
    }).toList(),
    onChanged: (newValue) {
      //payload2 = newValue;
    setState(() {
    payload2 = newValue;

    //getCity();
    });
    },
    ),),

      Container(
        margin: EdgeInsets.only(left: 20.0, top: 20),

        width: double.infinity,
        child: Text('Occupation', style: TextStyle(fontSize: 12,
            fontWeight: FontWeight.w700, color: Colors.white),),
      ),
      Padding (
        padding: EdgeInsets.only(left: 17, right: 17, top: 4),
        child:DropdownButtonFormField<Payload1>(
          value: payloadData.elementAt(0),

          decoration: InputDecoration(
            prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          hint: Text('Occupation'),
          items: payloadData.map((Payload1 value) {
            return DropdownMenuItem<Payload1>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              payload = newValue;

              //getCity();
            });
          },
        ),),


    /*Container(
    margin: EdgeInsets.only(left: 20.0, top: 20),
    width: double.infinity,
    child: Text('DOB', style: TextStyle(fontSize: 12,
    fontWeight: FontWeight.w700, color: Colors.white),),
    ),

    GestureDetector(
    onTap :(){
    selectDateFrom(context);
    },
      child:
      Padding(

        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
        padding: EdgeInsets.only(left: 17, right: 17, top: 4),
        child: TextFormField(
enabled: false,
          validator: (text) {
            if (text!.isEmpty) {
              return 'Enter enter mobile';
            }
            if (text.length != 10 && payload3?.name == 'Indian')
              return 'Enter correct mobile no';
            return null;
          },
          controller: myController1,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/images/mobile_icon.png', width: 5,height: 5, fit: BoxFit.fill,),),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),

              labelStyle: TextStyle(
                color: Colors.black, // Change label text color here
              ),
              hintText: "Enter 10 digit m"),
        ),),),
*/

      Container(
        margin: EdgeInsets.only(left: 20.0, top: 20),

        width: double.infinity,
        child: Text('Nationality', style: TextStyle(fontSize: 12,
            fontWeight: FontWeight.w700, color: Colors.white),),
      ),
      Padding (
        padding: EdgeInsets.only(left: 17, right: 17, top: 4),
        child:DropdownButtonFormField<Payload3>(
          value: payloadData3.elementAt(0),

          decoration: InputDecoration(
            prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          hint: Text('Nationality'),
          items: payloadData3.map((Payload3 value) {
            return DropdownMenuItem<Payload3>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              payload3 = newValue;

              //getCity();
            });
          },
        ),),

      Container(
        margin: EdgeInsets.only(left: 20.0, top: 20),

        width: double.infinity,
        child: Text('Email', style: TextStyle(fontSize: 12,
            fontWeight: FontWeight.w700, color: Colors.white),),
      )
      ,
      Padding(
        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
        padding: EdgeInsets.only(left: 17, right: 17, top: 4),
        child: TextFormField(

          validator: (text) {
            if (text!.isEmpty) {
              return 'Enter enter name';
            }
            return null;
          },
          controller: myContoller5,
          decoration: InputDecoration(

            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),)
            ,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            labelText: 'Name',

          ),
        ),),


      Container(
        margin: EdgeInsets.only(left: 20.0, top: 20),

        width: double.infinity,
        child: Text('Phone', style: TextStyle(fontSize: 12,
            fontWeight: FontWeight.w700, color: Colors.white),),
      )
      ,
      Padding(
        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
        padding: EdgeInsets.only(left: 17, right: 17, top: 4),
        child: TextFormField(

          validator: (text) {
            if (text!.isEmpty) {
              return 'Enter enter name';
            }
            return null;
          },
          controller: myController4,
          decoration: InputDecoration(

            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),)
            ,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            labelText: 'Name',

          ),
        ),),
      Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 25),
        child: ElevatedButton(
          onPressed: () {
            setState(() async {


            if (_form!.currentState!.validate()) {
              var _name = myController.text;
              //setNameInPref(_name);
              //var ageId = payload2?.id.toString();
              var childrenId = payload2?.id.toString();
              var occupationId = payload2?.id.toString();
              var occuId = payload?.id.toString();
              var nationality = payload3?.id.toString();
              var email = myContoller5?.text;
              //var dob = myController1.text;
              var phone = myController4.text;
              updateProfil(_name!, childrenId!, "", "8126863184", email!, occuId!, nationality!);

              //final prefs = await SharedPreferences.getInstance();

// set value
              //await prefs.setInt('user_id', data.payload.id);
              //var string =  prefs.getString('auth-token');
              /*final response = await http.post(Uri.parse(quizHistory),
      body: {
        'topic_id': topic_id,
      },encoding: Encoding.getByName("utf-8"),
      headers: {'auth-token': string!}
  );*/


              /*Map<String , String> body = {'name': name,
      'age_id': ageId, 'phone': phone, 'email': email,
      'occupation_id': occupation_id,
      'nationality': nationality
    };*/

              /*final response = await http.post(Uri.parse(updateProfile),
                  body: {
                    'name': name,
                    'age_id': '1', 'phone': phone, 'email': email,
                    'occupation_id': occupationId,
                    'nationality': nationality
                  },encoding: Encoding.getByName("utf-8"),
                  headers: {'auth-token': string!}
              );*/

             
              //updateProfile2(_name!, childrenId!, "", "8126863184", email!, occuId!, nationality!);
            }
            });

            /*setState(() {
            *//*  if (_form!.currentState!.validate()) {*//*




                *//*                 if (_mobile.length < 10 && _mobile.length > 10)
                        initState() {
    _mobileStr = "Enter 10 digit no";
    return;
    }
*//*
                //var _email = myController2.text;
                //var _password = myController3.text;
                //var _confirmPassword = myController4.text;
                //var _nationality = payload3?.id.toString();
                //updateProfile2(_name, ,_mobile);
                //newUserReg(_name, childrenId!,occupationId!,_mobile, _email, _password, _confirmPassword,_nationality!,context);


            });*/
          },
          child: Text("Update"),

          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontWeight: FontWeight.w600),
            minimumSize: const Size.fromHeight(50),
            primary: Colors.yellow,
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      )
      /*Padding (
        padding: EdgeInsets.only(left: 17, right: 17, top: 4),
        child:DropdownButtonFormField<Payload2>(
          value: payload2,
          decoration: InputDecoration(
            prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          hint: Text(DateFormat('dd-MM-yyyy').format(fromDate!)),
          items: payloadData2.map((Payload2 value) {
            return DropdownMenuItem<Payload2>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              payload2 = newValue;

              //getCity();
            });
          },
        ),)*/

    /*GestureDetector(
    onTap :(){
    selectDateFrom(context);
    },
    child:
    Container(
      height: 60,
    margin: EdgeInsets.only(left: 17,right: 17),
    child: Text(fromDate.toString(), style: TextStyle(fontSize: 12,
    fontWeight: FontWeight.w700, color: Colors.black),),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15), // Half of the width/height for a circle
    ),
    ),)*/]))])))]);}),));}updateProfil(String name, String ageId, String dob, String phone, String email, String occupation_id, String nationality/*, BuildContext context1*/) async{
    final prefs = await SharedPreferences.getInstance();

// set value
    //await prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');
    /*final response = await http.post(Uri.parse(quizHistory),
      body: {
        'topic_id': topic_id,
      },encoding: Encoding.getByName("utf-8"),
      headers: {'auth-token': string!}
  );*/


    /*Map<String , String> body = {'name': name,
      'age_id': ageId, 'phone': phone, 'email': email,
      'occupation_id': occupation_id,
      'nationality': nationality
    };*/

    final response = await http.post(Uri.parse(updateProfile),
        body: {
          'name': name,
          'age_id': ageId, 'phone': phone, 'email': email,
          'occupation_id': occupation_id,
          'nationality': nationality
        },encoding: Encoding.getByName("utf-8"),
        headers: {'auth-token': string!}
    );

    /*Navigator.push(
      context1,
      MaterialPageRoute(builder: (context) => *//*VerifyOtp(text: resendOtpData.message,phoneNo: phone,email: "",any:false)*//*
      Body2(isLogin: true)
      ));*/


    //String jsonBody = json.encode(body);
    //final encoding = Encoding.getByName("utf-8");
    /*final response = await http.post(Uri.parse(updateProfile),encoding: encoding, body:
    body, headers: {'auth-token': string!}
      *//*{
      'name': name,
      'age_id': ageId,
      'occupation_id': occupationId,
      'phone': phone,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
      'nationality' : 'Indian',
      'device_type' : 'BTC',
      'login_type': "E", *//**//*jsonBody*//**//*
      'device_token' : 'abcd',
*//**//*      body: {
        'name': email,
        'age_id' : ageId,
        'occupation_id' : occupationId,
        'phone' : phone,
        'email' : email,
        'password' : password,
        'confirm_password' : confirmPassword,

        'login_type' : "E",
      }*//**//* *//**//*,headers: { 'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": 'user_ED0hiyR6enmy0BK'}*//**//*
    }*//*
    );*/
    /*final response = await http.post(Uri.parse(quizHistory),
      body: {
        'topic_id': topic_id,
      },encoding: Encoding.getByName("utf-8"),
      headers: {'auth-token': string!}
  );*/
  }
}



/*
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Row(
    children: [
    GestureDetector(

    child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 5),
    decoration: const BoxDecoration(
    // color:AppColors.datecontainer,
    ),
    child: Row(
    children: [
    const Icon(Icons.date_range,size: 33,),
    const SizedBox(width:10 ,),
    Text(
    DateFormat('dd-MM-yyyy').format(fromDate!)
    '${DateFormat('dd-MM-yyyy').format(fromDate!)}' *//*!= null
    ? ' ${DateFormat('dd-MM-yyyy').format(fromDate!)}'

        : 'From'
,style: const TextStyle(fontSize: 16,fontFamily: 'poppins',fontWeight: FontWeight.w400),
    ),
    ],
    ),
    ),
    ),
    ],),
    )]),

                  Container(

                  decoration: InputDecoration(
                    prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                      child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  )
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child: Text(

validator: (text) {
                        if (text!.isEmpty) {
                          return 'Enter enter name';
                        }
                        return null;
                      },

                      //controller: myController,
decoration: InputDecoration(

                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon:
Padding(padding: const EdgeInsets.all(15.0),
                          child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),)


                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        labelText: 'Name',
                      ),

                    ),),


                  Padding (
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child:DropdownButtonFormField<Payload1>(
                      value: payload,
                      decoration: InputDecoration(
                        prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                          child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                      hint: Text('Mobile'),
                      items: payloadData.map((Payload1 value) {
                        return DropdownMenuItem<Payload1>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          payload = newValue;

                          //getCity();
                        });
                      },
                    ),),

                  Container(
                    margin: EdgeInsets.only(left: 20.0, top: 20),

                    width: double.infinity,
                    child: Text('Address', style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w700, color: Colors.white),),
                  ),

                  Padding (
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child:DropdownButtonFormField<Payload3>(
                      value: payload3,
                      decoration: InputDecoration(
                        prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                          child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      ),
                      hint: Text('Address'),
                      items: payloadData3.map((Payload3 value) {
                        return DropdownMenuItem<Payload3>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          payload3 = newValue;

                          //getCity();
                        });
                      },
                    ),),


                  Container(
                    margin: EdgeInsets.only(left: 20.0, top: 20),

                    width: double.infinity,
                    child: Text('Mobile', style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w700, color: Colors.white),),
                  ),
                  Padding(

                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child: TextFormField(

                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Enter enter mobile';
                        }
                        if (text.length != 10 && payload3?.name == 'Indian')
                          return 'Enter correct mobile no';
                        return null;
                      },
                      controller: myController1,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/images/mobile_icon.png', width: 5,height: 5, fit: BoxFit.fill,),),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          labelText: "Enter mobile no",

                          hintText: "Enter 10 digit m"),
                    ),),
Container(
                    margin: EdgeInsets.only(left: 20.0, top: 20),

                    width: double.infinity,
                    child: Text('Email', style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w700, color: Colors.white),),
                  )
                  ,
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child: TextFormField(

                      validator: (text) {
                        if (text!.isEmpty) {

                          return 'Enter the email';
                        }
                        if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").
                        hasMatch(text) == false) {
                          return 'Enter valid email';
                        };
                        return null;
                      },
                      controller: myController2,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/images/email.png', width: 5,height: 5, fit: BoxFit.fill,),),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          labelText: 'Email',
                          hintText: 'Enter valid email id'),
                    ),),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, top: 20),

                    width: double.infinity,
                    child: Text('Password', style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w700, color: Colors.white),),
                  )
                  ,
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child: TextFormField(

                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Enter enter the password';
                        }
                        return null;
                      },
                      controller: myController3,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/images/icon_lock.png', width: 5,height: 5, fit: BoxFit.fill,),),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          labelText: 'Password',
                          hintText: 'Enter min 6 digit password'),
                    ),),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, top: 20),

                    width: double.infinity,
                    child: Text('Confirm Password', style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w700, color: Colors.white),),
                  )
                  ,
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                    child: TextFormField(

                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Enter enter the password';
                        }
                        return null;
                      },
                      controller: myController4,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/images/icon_lock.png', width: 5,height: 5, fit: BoxFit.fill,),),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          labelText: 'Confirm Password',
                          hintText: 'Enter same password as above'),
                    ),),






Container(
                  margin: EdgeInsets.only(
                      top: 18, left: 20.0, right: 25, bottom: 18),
                  child: Align(alignment: Alignment.topRight,
                    child: Text("Forget Password?", style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w600)),),),

width: double.infinity,
                child: Text('Forget Password ?' ,style:TextStyle(fontSize: 12,
                    fontWeight: FontWeight.w700, color: Colors.white) ,),
              ),

Padding(padding: const EdgeInsets.only(left: 20, top: 30),child: Text('Forget Password ?', textAlign:
              TextAlign.right,style: TextStyle(color:
              Colors.yellow, fontSize: 10),),),

                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_form!.currentState!.validate()) {




                            var _name = myController.text;
                            setNameInPref(_name);
                            var childrenId = payload?.id.toString();
                            var occupationId = payload2?.id.toString();
                            var _mobile = myController1.text;
                 if (_mobile.length < 10 && _mobile.length > 10)
                        initState() {
    _mobileStr = "Enter 10 digit no";
    return;
    }


                            var _email = myController2.text;
                            var _password = myController3.text;
                            var _confirmPassword = myController4.text;
                            var _nationality = payload3?.id.toString();
                            newUserReg(_name, childrenId!,occupationId!,_mobile, _email, _password, _confirmPassword,_nationality!,context );

                          }
                        });;
                      },
                      child: Text("Sign Up"),

                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontWeight: FontWeight.w600),
                        minimumSize: const Size.fromHeight(50),
                        primary: Colors.yellow,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
Center(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(padding: EdgeInsets.only(left: 17, right: 17, top: 4, bottom: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children : [
                            Padding(padding: EdgeInsets.only(right: 20), child:Text("Have an account ?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),)
                            ,
                            ElevatedButton(
                              child: Text("Login"),
                              onPressed: () => {}
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MyStatefulWidget()))
                              ,
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontWeight: FontWeight.w600),

                                primary: Colors.yellow,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            )
                            ,],),),),)
  Padding( // this is new
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                  ),],),),),],),);}}



const SizedBox(
      width: 200.0,
      height: 300.0,

      )
,

                  Center(
      child: Row(children: [Text("fdsk"), Text("fdkfj")],),
      ),],),),],),);}}


Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.end, //<---Change
      children: [

      Container(
      // margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Text(
      'How many?',
      style: TextStyle(fontSize: 18),
      ),
      ),],),)

Expanded(child: Align(alignment: FractionalOffset.bottomCenter,
      child: Text("Did't have an accoutn?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),),)


Container(
      margin: EdgeInsets.only(top: 18,left:20.0,right:25, bottom: 18),
      child: Align(alignment: Alignment.bottomLeft,
      child: Text("Did't have an account?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),),)



Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {

Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
            child: Text(
              'Log In',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),),

Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                const Expanded(child: Text("Did't have an account", style: TextStyle(fontSize: 15.0),),),
                ElevatedButton(style: ,)
              ],)
            ],)

            Center(
              child: Container(
                  Text(
                    'Log In',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  )))
              child: TextButton(
                onPressed: () {

                },
              )
            )
              Container(
                height: 50,
                  ,
              )
              TextButton(
                onPressed: (){
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),


  ],
              ),),



Expanded(child:
            Align(alignment: FractionalOffset.bottomCenter,
              child: Container(alignment : Alignment.bottomCenter,child: Row(children: [Text("Didt"), Text("djk")],),),),)
          ],),);

 child: Container(
        child : Row(children:
      Text("Didn't have an account"),
      ElevatedButton(
      child: Text("Log In"),
      onPressed: () => print("it's pressed"),
      style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontWeight: FontWeight.w600),
      //minimumSize: const Size.fromHeight(50),
      primary: Colors.yellow,
      onPrimary: Colors.black,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      )

//),),),),),),],),);


Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: ,


      children: <Widget>[
        Text("Didn't have an account"),
      Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 4),
      child:ElevatedButton(
      child: Text("Log In"),
      onPressed: () => print("it's pressed"),
      style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontWeight: FontWeight.w600),
      //minimumSize: const Size.fromHeight(50),
      primary: Colors.yellow,
      onPrimary: Colors.black,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      ),
      ),
      ),
      ),

        ],),),],),);}}




child: MaterialButton(
                onPressed: () => {},
                child: Text('REGISTERLOGIN'),
              ),
            ),)

Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
      children: Text("Forget Password?", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w600)),),


      child:ElevatedButton(
      child: Text("Log In"),
      onPressed: () => print("it's pressed"),
      style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontWeight: FontWeight.w600),
      minimumSize: const Size.fromHeight(50),
      primary: Colors.yellow,
      onPrimary: Colors.black,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      ),

      ),),

      )
                child: MaterialButton(
                  onPressed: () => {},
                  child: Text(_register ? 'REGISTER' : 'LOGIN'),
                ),
              ),
            ),],



*/

