
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rama_puzle/NationalityData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'AgeModel.dart';
import 'CustomColor.dart';
import 'HttpClient.dart';
import 'Login.dart';
import 'LoginData.dart';

import 'OccupationModel.dart';
import 'ProfileData.dart';
import 'body1.dart';
import 'new_edit_profile.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<SignUp> {
  final _form = GlobalKey<FormState>();
  String valueDropDown1 = "0";
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myContoller5 = TextEditingController();

  List<Payload1> payloadData = [];
  List<Payload2> payloadData2 = [];
  List<Payload3> payloadData3 = [];
  ProfileData? payload4;
  Payload1? payload;
  Payload2? payload2;
  Payload3? payload3;
  String? _mobileStr= "";
  /*double height = MediaQuery.of().size.height;
  double width = MediaQuery.of(context).size.width;
*/

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

  populateDropDowns2() async {
    List<Payload2> data = await getAges();
        setState(() {
          payloadData2 = data;
        });
  }

  populateDropDowns()async{
    OccupationModel data = await getCity();
    setState(() {
      payloadData = data.payload;

    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    populateDropDowns();
    populateDropDowns2();
    populateDropDownNationality();
    getUserProfile();

  }

  /*void openIsar() async {
    await Isar.open(
      // Define your Isar schema here
    );
  }*/

  getUserProfile() async {


    final isar = await openIsar();

    await isar.writeTxn((isar) async {
      await isar.write<Person>(Person()..name = 'John'..age = 25);
      await isar.write<Person>(Person()..name = 'Jane'..age = 30);
    });
        // Define your Isar schema here

    }
    //payload = await getUserProfileFun();
    /*final prefs = await SharedPreferences.getInstance();
    const baseURL = "http://www.ramapuzzle.com/api/v1";
    const getUserProfile = baseURL + "/user/myProfile";
// set value
    //a/wait prefs.setInt('user_id', data.payload.id);
    var string = prefs.getString('auth-token');

    var token = string;*/

    /*final response = await http.post(Uri.parse(getUserProfile),
        encoding: Encoding.getByName("utf-8"),
        *//*  body: {
        'post_id':postId,
        'content': content
      }*//*headers: {"auth-token": "user_sM5giA21vaWU3Ym"!});
    ProfileData nationalityData =
    profileDataFromJson(response.body);*/

    //var prefs2 = await SharedPreferences.getInstance();
    //var bool = prefs.getBool("isDone");
    //final prefs = await SharedPreferences.getInstance();

  /*  var bool = prefs.getBool("isDone");
    if (bool != null && bool == true) {*/
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewEditProfile(marital: "married",)));
      /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            */ /*NewEditProfile(marital: 'married',)*/ /*SignUp()));*/


  }


  setNameInPref(String name) async {
    final prefs =  await SharedPreferences.getInstance();

// set value
    prefs.setString('name', name);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: ColorConstants.backgroundColor,
//backgroundColor: Colors.blue,
      body: Stack(
        key: _form,
        children: <Widget>[
          new Container(decoration: new
          BoxDecoration(image: new DecorationImage(
              image: new AssetImage("assets/images/background_img.png"))),),

          SingleChildScrollView(
            child: Form(
    key: _form,

            /*reverse: true,*/
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.fromLTRB(20.0, 60.0, 12.0, 6.0),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Column(crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[

                          GestureDetector(
                            onTap: () async {

                              final prefs = await SharedPreferences.getInstance();

                              String? lang = await prefs.getString('lang');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Body2(isLogin: false)));
                            },child:

                          Image.asset("assets/images/back_arrow.png", height: 20,
                            width: 20,)
                        ,
                        //children: <Widget>[Text("fjkff")],
                      ),],),]
                      /*Padding(
                    padding:
                    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                    child: Image.asset("assets/images/back_arrow.png", height: 20, width: 20)
                )*/
                    ,

                  ),),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 20),

                  width: double.infinity,
                  child: Text('Sign Up', style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w600, color: Colors.white),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 6),

                  width: double.infinity,
                  child: Text('Create your Account now', style: TextStyle(fontSize: 11,
                      fontWeight: FontWeight.w500, color: Colors.white),),
                )
                /*Padding(
                    padding:
                    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                    child: Image.asset("assets/images/back_arrow.png", height: 20, width: 20)
                )*/,


                /*Row(
                mai
              const Text("Login", style: TextStyle(color: Colors.white, fontSize: 30,), textAlign: TextAlign.left,),
              )*/
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.start,
      children: Widget[],
      )

              Padding(
                  padding: const EdgeInsets.only(left:1,top: 20),
            child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 14),)),
*/


                /* Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10,78 , 0),
                  child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 14),)),*/

                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 20),

                  width: double.infinity,
                  child: Text('Name', style: TextStyle(fontSize: 12,
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
    value: payload2,
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
                    value: payload,
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

                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 20),

                  width: double.infinity,
                  child: Text('Nationality', style: TextStyle(fontSize: 12,
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
                    obscureText: true,
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
                    obscureText: true,
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





                /*Container(
                  margin: EdgeInsets.only(
                      top: 18, left: 20.0, right: 25, bottom: 18),
                  child: Align(alignment: Alignment.topRight,
                    child: Text("Forget Password?", style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w600)),),),
                *//*width: double.infinity,
                child: Text('Forget Password ?' ,style:TextStyle(fontSize: 12,
                    fontWeight: FontWeight.w700, color: Colors.white) ,),
              ),*/
                /*Padding(padding: const EdgeInsets.only(left: 20, top: 30),child: Text('Forget Password ?', textAlign:
              TextAlign.right,style: TextStyle(color:
              Colors.yellow, fontSize: 10),),),*/
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
     /*                 if (_mobile.length < 10 && _mobile.length > 10)
                        initState() {
    _mobileStr = "Enter 10 digit no";
    return;
    }
*/
                      var _email = myController2.text;
                      var _password = myController3.text;
                      var _confirmPassword = myController4.text;
                      var _nationality = payload3?.id.toString();
                      newUserReg(_name, childrenId!,occupationId!,_mobile, _email, _password, _confirmPassword,_nationality!,context );

                        }
                      });
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
    onPressed: () => {}/*Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MyStatefulWidget()))*/
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
    ,],),),),),  Padding( // this is new
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                ),],),),),],),);}}



/*const SizedBox(
      width: 200.0,
      height: 300.0,

      )
,

                  Center(
      child: Row(children: [Text("fdsk"), Text("fdkfj")],),
      ),],),),],),);}}*/

/*Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.end, //<---Change
      children: [

      Container(
      // margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Text(
      'How many?',
      style: TextStyle(fontSize: 18),
      ),
      ),],),)*/
/*Expanded(child: Align(alignment: FractionalOffset.bottomCenter,
      child: Text("Did't have an accoutn?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),),)*/

/*Container(
      margin: EdgeInsets.only(top: 18,left:20.0,right:25, bottom: 18),
      child: Align(alignment: Alignment.bottomLeft,
      child: Text("Did't have an account?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),),)
*/

/*Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              */ /*Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));*/ /*
            },
            child: Text(
              'Log In',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),),
        */ /*Column(mainAxisSize: MainAxisSize.min, children: [
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
*/
/*  ],
              ),),
*/

/*Expanded(child:
            Align(alignment: FractionalOffset.bottomCenter,
              child: Container(alignment : Alignment.bottomCenter,child: Row(children: [Text("Didt"), Text("djk")],),),),)
          ],),);*/
/* child: Container(
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
      )*/
//),),),),),),],),);


/*Row(
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
*/


/*child: MaterialButton(
                onPressed: () => {},
                child: Text('REGISTERLOGIN'),
              ),
            ),)*/
/*Expanded(
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



