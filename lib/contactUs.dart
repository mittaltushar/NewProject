
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rama_puzle/body1.dart';
import 'package:rama_puzle/contactInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomColor.dart';
import 'HttpClient.dart';

class contactUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return contactUs2();
  }
}
  class contactUs2 extends State<contactUs> {
    final _form = GlobalKey<FormState>();
    ContactInfo? contactInfo;
    final myController = TextEditingController();
    final myController2 = TextEditingController();

    @override
    void initState() {
      super.initState();
      getContact();

    }

    getContact() async {
      ContactInfo data = await getContactInfo();

      setState(() {
        contactInfo = data;
       // _remainingTime = data.payload[0].topicTime;
      });
      //_startTimer();
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp (
debugShowCheckedModeBanner: false,
        home:
    Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.backgroundColor,
        centerTitle: true,
        leadingWidth: 30,

        leading:Padding(padding: EdgeInsets.only(left: 10),
          child:GestureDetector(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              //prefs = await SharedPreferences.getInstance();

              String? lang = await prefs.getString('lang');
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Body2(isLogin: false)));
            },child:

          Image.asset("assets/images/back_arrow.png", height: 20,
            width: 20,)
            ,
            //children: <Widget>[Text("fjkff")],
          ),),
        title: Text('Contact US',style: /*GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20, fontWeight: FontWeight.w800
        )*/TextStyle(color: Colors.white, fontFamily: 'Poppins',
            fontSize: 20, fontWeight:  FontWeight.w800)

        ),
        /*actions: [
          Padding(padding: EdgeInsets.only(left: 25),
          *//*child: DropdownButtonHideUnderline(*//*
          //child: Expanded(
          child: Image.asset(
            "assets/images/back_arrow.png", height: 20,
            width: 20,),)
            ],*/
      ),
      backgroundColor: ColorConstants.backgroundColor,
        body:
            Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)
                  ,bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
              ),
    child:
      Stack(
          key: _form,
          children: <Widget>[
      /*new Container(decoration: new
          BoxDecoration(image: new DecorationImage(
          image: new AssetImage("assets/images/background_img.png"))),),*/
            Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: new BoxDecoration(
      color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
      ),
      child:
          SingleChildScrollView(

          child: Form(child:
              Container(
              color: Colors.white,
              child: Column(
    children: <Widget>[

    TextFormField(
    validator: (text) {
    if (text!.isEmpty) {
    return 'Enter enter the password';
    }
    return null;
    },
    //controller: myController3,
    decoration: InputDecoration(

    prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
    child: Image.asset('assets/images/icon_user.png', width: 5,height: 5, fit: BoxFit.fill,),),
    filled: true,
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0
          ),),
    fillColor: Colors.white,
    disabledBorder: UnderlineInputBorder(

      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
          color: Colors.grey,
          width: 2.0
      ),),
    enabled: false,
    //labelText: 'Name',
        labelText: contactInfo?.payload.name,
    hintText: 'Enter the name'),
    ),

    TextFormField(
readOnly: true,
    validator: (text) {
    if (text!.isEmpty) {
    return 'Enter the mobile no';
    }
    return null;
    },

    //controller: myController3,
    decoration: InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
    child: Image.asset('assets/images/mobile_icon.png', width: 5,height: 5, fit: BoxFit.fill,),),
    filled: true,
    fillColor: Colors.white,
   /* border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0)
    ),*/
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),),
        disabledBorder: UnderlineInputBorder(

          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
              color: Colors.grey,
              width: 2.0
          ),),
    enabled: false,
    hintText: 'Mobile Number',
      labelText: contactInfo?.payload.phone
    ),
    ),

    TextFormField(
readOnly: true,
    validator: (text) {
    if (text!.isEmpty) {
    return 'Enter the Email';
    }
    return null;
    },
    //controller: myController3,
    decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
    child: Image.asset('assets/images/email.png', width: 5,height: 5, fit: BoxFit.fill,),),
    filled: true,
    fillColor: Colors.white,
    /*border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0)
    ),*/
    //labelText: 'email@gmail.com',
        disabledBorder: UnderlineInputBorder(

          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
              color: Colors.grey,
              width: 2.0
          ),),
        enabled: false,
        labelText: contactInfo?.payload.email,
    hintText: 'email@gmail.com'),
    ),
      TextFormField(
readOnly: true,
        validator: (text) {
          if (text!.isEmpty) {
            return 'Enter the Address';
          }
          return null;
        },
        //controller: myController3,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/images/location.png', width: 5,height: 5, fit: BoxFit.fill,),),
            filled: true,
            fillColor: Colors.white,
            /*border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0)
    ),*/
            //labelText: 'Address 1',
            disabledBorder: UnderlineInputBorder(

              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2.0
              ),),
            enabled: false,
            labelText: contactInfo?.payload.address,
            hintText: 'Address 1'),
      ),
      Align(alignment: Alignment.centerLeft,child: Padding(padding: EdgeInsets.only(left: 15,top: 40, bottom: 5),
      child: Text("For any enquiry email us", style:
      TextStyle(color: ColorConstants.backgroundColor, fontFamily: 'Poppins',
          fontSize: 20, fontWeight:  FontWeight.w800)

      )
      /* GoogleFonts.poppins(
          color: ColorConstants.backgroundColor,
          fontSize: 20, fontWeight: FontWeight.w800
      )*/),),

      Column(
        children: [

        Align(alignment: Alignment.centerLeft,child: Padding(padding: EdgeInsets.only(left:15,top: 15),
        child:
          Text("Subject", style: TextStyle(color: ColorConstants.backgroundColor),),),),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.only(left: 17, right: 17, top: 4),
            child: TextFormField(
      controller: myController,
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Enter Subject';
                }
                return null;
              },
              /*focusNode: focusNode,
              controller: myController,
              */decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.al),
                prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                  child: Image.asset('assets/images/personal_info.png', width: 5,height: 5, fit: BoxFit.fill,),),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0)
                  ),
                  labelText: 'Subject',
                  hintText: 'Subject'),
            ),), /*Container(
            margin: EdgeInsets.only(left: 20.0, top: 35),
            height: 50,
            width: double.infinity,
            child: Text('Password', style: TextStyle(fontSize: 12,
                fontWeight: FontWeight.w700, color: Colors.white),),
          )*/

          Align(alignment: Alignment.centerLeft,child: Padding(padding: EdgeInsets.only(left: 15,top: 15),
            child:
            Text("Message", style: TextStyle(color: ColorConstants.backgroundColor),),),),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.only(left: 17, right: 17, top: 4),
            child: TextFormField(
controller: myController2,
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Enter Message';
                }
                return null;
              },
              /*focusNode: focusNode,
              controller: myController,
              */decoration: InputDecoration(
              //prefixIcon: Icon(Icons.al),
                prefixIcon: Padding(padding: const EdgeInsets.all(15.0),
                  child: Image.asset('assets/images/personal_info.png', width: 5,height: 5, fit: BoxFit.fill,),),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0)
                ),
                labelText: 'Message',
                hintText: 'Message'),
            ),), /*Container(
            margin: EdgeInsets.only( left: 20.0, top: 35),
            height: 100,
            width: double.infinity,
            child: Text('Message', style: TextStyle(fontSize: 12,
                fontWeight: FontWeight.w700, color: Colors.white),),
          )
          ,*/
          Align(
            /*alignment: FractionalOffset.bottomCenter,*/
            child: Padding(padding: EdgeInsets.only(left: 17, right: 17, top: 70),
              child:   Container(
margin: EdgeInsets.only( bottom: 100),
                width: 400,
                child: ElevatedButton(

                  child: Text("Send Message"),
                  onPressed: () {

                    contactUsApi(myController.text, myController2.text);
                    //contactUsApi();
                    /* =>

                              *//*setState(() {
    if (_form!.currentState!.validate()) {
    *//*
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()))*/
                  }
                  ,
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontWeight: FontWeight.w600),

                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),),
            ),),



        ],
      )
    ],

    )

          ,
    )
    ),

    ),),],),),),);}}

