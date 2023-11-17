

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rama_puzle/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'CustomColor.dart';
import 'HttpClient.dart';
import 'new_edit_profile.dart';
import 'LoginData.dart';
import 'body1.dart';
import 'forget_password.dart';
import 'new_edit_profile.dart';

class MyStatefulWidget extends StatefulWidget {
   final Function(String) updateValue;
   MyStatefulWidget({Key? key, required this.updateValue}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(updateValue: updateValue);
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late final Function(String) updateValue;
  final _form = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  String hintText = 'Email';
  String hintText2 = 'Password';

  _MyStatefulWidgetState({Key? key, required this.updateValue}) ;

  final myController = TextEditingController();
  final myController1 = TextEditingController();


  bool _onKey(KeyEvent event) {

    final key = event.logicalKey.keyLabel;

    if (event is KeyDownEvent) {
      print("Key down: $key");

    } else if (event is KeyUpEvent) {
      print("Key up: $key");
    } else if (event is KeyRepeatEvent) {
      print("Key repeat: $key");
    }

    return false;
  }

  @override
  void dispose() {
    ServicesBinding.instance.keyboard.removeHandler(_onKey);
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = 'Email';
      }
      setState(() {});
    });

    focusNode1.addListener(() {
      if (focusNode1.hasFocus) {
        hintText2 = '';

      } else {
        hintText2 = 'Password';
      }
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstants.backgroundColor,
appBar:  AppBar(elevation: 0,
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
          ),),),
//backgroundColor: Colors.blue,
      body: Stack(
        children: <Widget>[
         /* new Container(decoration: new
          BoxDecoration(image: new DecorationImage(
              image: new AssetImage("assets/images/background_img.png"))),),*/

          Container(child:
          SingleChildScrollView(
    child: Form (
    key: _form,
            child: Column(
              children: <Widget>[
                /*Padding(
                  padding:
                  const EdgeInsets.fromLTRB(20.0, 60.0, 12.0, 6.0),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Column(crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          *//*GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Body2(isLogin: false)));
                            },
                            child:
                            Image.asset(
                              "assets/images/back_arrow.png", height: 20,
                              width: 20,),)*//*
                        ],
                        //children: <Widget>[Text("fjkff")],
                      )
                      *//*Padding(
                    padding:
                    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                    child: Image.asset("assets/images/back_arrow.png", height: 20, width: 20)
                )*//*,
                    ],

                  ),)*/
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 15),

                  width: double.infinity,
                  child: Text('Login', style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w600, color: Colors.white),),
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
                  margin: EdgeInsets.only(left: 20.0, top: 35),

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
                        return 'Enter MailId';
                      }
                      return null;
                    },
                    focusNode: focusNode,
                    controller: myController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                  ),), Container(
                  margin: EdgeInsets.only(left: 20.0, top: 35),

                  width: double.infinity,
                  child: Text('Password', style: TextStyle(fontSize: 12,
                      fontWeight: FontWeight.w700, color: Colors.white),),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.only(left: 17, right: 17, top: 4),
                  child: TextFormField(
                    obscureText: true,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Enter password';
                      }
                      return null;
                    },
                    focusNode: focusNode1,
                    controller: myController1,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),),


                Container(
                  margin: EdgeInsets.only(
                      top: 10, left: 20.0, right: 25, bottom: 10),
                  child: Align(alignment: Alignment.topRight,
                    child: TextButton(child: Text("Forget Password?", style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w600),) ,onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgetPassword()/*Body2(isLogin: true)*/));

                    },),),),
                /*width: double.infinity,
                child: Text('Forget Password ?' ,style:TextStyle(fontSize: 12,
                    fontWeight: FontWeight.w700, color: Colors.white) ,),
              ),*/
                /*Padding(padding: const EdgeInsets.only(left: 20, top: 30),child: Text('Forget Password ?', textAlign:
              TextAlign.right,style: TextStyle(color:
              Colors.yellow, fontSize: 10),),),*/
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
    setState(() async {
    if (_form!.currentState!.validate()) {


    var _email = myController.text;
                      var _password = myController1.text;
                       fetchAlbum2(_email, _password, "login_type",context, updateValue);

    }});},

                    child: Text("Log In"),

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
              ],),),),), Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(padding: EdgeInsets.only(left: 17, right: 17, top: 4, bottom: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children : [
                    Padding(padding: EdgeInsets.only(right: 20), child:Text("Didn't have an account ?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),)
                    ,
                    ElevatedButton(

                      child: Text("Sign In"),
                      onPressed: () =>

    /*setState(() {
    if (_form!.currentState!.validate()) {
    */                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUp()))
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
                    ,],),),),),],),);}

  fetchAlbum2(String email, String password, String login_type, BuildContext context1, Function(String) updateValue) async {

    final response = await http.post(Uri.parse(postsEndpoint),
        body: {
          'email': email,
          'password' : password,
          'login_type' : 'E',
          'device_type': 'A',
          'device_token': 'fjksf'
        }
    );
    LoginData data = loginDataFromJson(response.body);
    //parivar ke survey
    if (data.code == 1) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final prefs =  await SharedPreferences.getInstance();

// set value
      await prefs.setInt('user_id', data.payload.id);
      await prefs.setString('auth-token', data.payload.authToken);
      await prefs.setBool('isLogin', true);
      await prefs.setString('profile_name', data.payload.name);
      await prefs.setString('add_community_post', data.payload.addCommunityPost);
//    Navigator.pop(context1);
      Fluttertoast.showToast(
          msg: "Login successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
      if (data.code == 1) {
        Navigator.of(context).pop();
        final prefs = await SharedPreferences.getInstance();

        String? lang = await prefs.getString('lang');
        Navigator.push(
          context1,
          MaterialPageRoute(builder: (context1) => /*Body2(isLogin: true)*/
          //NewEditProfile("married")
              NewEditProfile(marital: "married")
          ));

        //Navigator.of(context1).pop(true);
        //Navigator.pop(context1);
        updateValue("1");

      }
      /*Navigator.pushAndRemoveUntil(
        context1,
        MaterialPageRoute(builder: (context) => Body2(isLogin: true)), ModalRoute.withName("/Home"));*/

      // return LoginData.fromJson(jsonDecode(respo
      //nse.body));
      //return data.payload;
      return data.code;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}



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
      child: Text("Did't have an acco
      unt?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),),)
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



