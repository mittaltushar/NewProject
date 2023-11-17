import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rama_puzle/sign_up.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'CustomColor.dart';
import 'HttpClient.dart';
import 'body1.dart';



class Method {
  late String email;
  late String otp;
  Method({required this.email, required this.otp});
}

class VerifyOtp extends StatefulWidget {
  final String text;
  final String phoneNo;
  final String email;
  final bool any;

  const VerifyOtp({Key? key,required this.text, required this.phoneNo, required this.email, required this.any}) : super(key: key);


  @override
  State<VerifyOtp> createState() => _VerifyOtpState(text: text, phoneNo: phoneNo, email: email, any: any);
}
class _VerifyOtpState extends State<VerifyOtp> {
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  String hintText = 'Email';
  String hintText2 = 'Password';

  String text;
  bool any = false;
  String phoneNo;
  String email;
  bool touchResendOtp= false;
  String otpVerificationCode = "";
  String otp = "";
  _VerifyOtpState({Key? key,required this.text, required this.phoneNo, required this.email, required this.any });
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  //final otpController = List.generate(5, (index) => HandleControllers());

  void setEmailId() {

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String text1 = text.replaceAll(new RegExp(r'[^0-9]'),''); // '23
    otp = text1;

    //text = int.parse(text) as String;
    Fluttertoast.showToast(msg: text, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,
    backgroundColor: Colors.blue, textColor: Colors.white, fontSize: 16.0);
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

  bool isNumericUsing_tryParse(String st) {
    if (st == null || st.isEmpty) {
      return false;
    }
    final number = num.tryParse(st);
    if (number == null) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
        body: Stack(
            children: <Widget>[
        new Container(decoration: new
            BoxDecoration(image: new DecorationImage(
            image: new AssetImage("assets/images/background_img.png"))),),

    SingleChildScrollView(
    reverse: true,
    child: Column(
    children: <Widget>[
    Padding(
    padding:
    const EdgeInsets.fromLTRB(20.0, 60.0, 12.0, 6.0),

    child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      GestureDetector(
        onTap: () async {
          final prefs = await SharedPreferences.getInstance();
          //prefs = await SharedPreferences.getInstance();

          String? lang = await prefs.getString('lang');
          /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Body2(isLogin: true,)));*/
        },


        child:
      Image.asset(
        "assets/images/back_arrow.png", height: 20,
        width: 20,)
        ,
        //children: <Widget>[Text("fjkff")],
      ),
    SizedBox(height :20),

    Text("Email Verification", style: TextStyle(fontSize: 12,
                fontWeight: FontWeight.w700, color: Colors.white),),
            const SizedBox(height: 30),
      Container(
        margin: EdgeInsets.only(
            top: 18, left: 20.0, right: 25, bottom: 18),
        child: Align(alignment: Alignment.center,
          child: Text("Enter your OTP code here", style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500)),),),


            OtpTextField(
              numberOfFields: /*any ? otp.length + 1: otp.length*/ otp.length,
              borderColor: Colors.white,
              focusedBorderColor: Colors.white,
              onSubmit: (String verficationCode) {
                  otpVerificationCode = verficationCode;
              },
              textStyle: TextStyle(color: Colors.yellow),
                 ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 4),
              child: ElevatedButton(
                onPressed: () {
                  //var _email = myController.text;
                  var _password = myController1.text;


                  if (touchResendOtp == true) {
                    verfiyResendOtp(phoneNo, otp.toString(), context);
                  }
                  else if (email.length > 0 && touchResendOtp == false) {
                    verifyForgetPasswordOtp(email, otp.toString(),  context);
                  } else {
                    verifyOtp1(phoneNo, otp.toString(), email, context);
                  }
                  //     fetchAlbum(_email, _password, "login_type",context);
                },
                child: Text("Verify"),

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
    Padding(
    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
    padding: EdgeInsets.only(left: 17, right: 17, top: 10),

      child:Container(
        margin: EdgeInsets.only(
            top: 18, left: 20.0, right: 25, bottom: 18),
        child: Align(alignment: Alignment.center,
          child: TextButton(child: Text("Resend OTP", style: TextStyle(decoration: TextDecoration.underline,
              color: Colors.white,
              fontWeight: FontWeight.w600),) ,onPressed: () {
            touchResendOtp = true;
            if (email.length > 0)
              forgetPassword2(email, context);
            else {
              var str = resendOtp1(phoneNo,context) as String ;
              String text1 = str.replaceAll(new RegExp(r'[^0-9]'),''); // '2
              otp = text1;
            /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => resendOtp1(phoneNo)*//*Body2(isLogin: true)*//*));
*/}
          },),),),


   /* child:Center(

        child: Text("Resend OTP"
                , style: TextStyle(fontSize: 15,
                    fontWeight: FontWeight.w500, color: Colors.white,decoration: TextDecoration.underline))
            ),*/)
            ,
          ],
        ),),],),),],),);
  }
}

