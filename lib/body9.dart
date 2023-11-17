/*
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rama_puzle/forget_password.dart';

import 'CustomColor.dart';
import 'Login.dart';

class LanguageSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LanguageSelectionState();
  }
}

class LanguageSelectionState extends State<LanguageSelection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
      alignment: Alignment.center,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        elevation: 25.0,
        backgroundColor: Colors.white,
        child: dialogContent(context),
      ),
    );
  }
}



class MyDialogContent extends StatefulWidget {
  @override
  _MyDialogContentState createState() => new _MyDialogContentState();
}

class CustomRowModel {
  bool selected;
  String title;
  CustomRowModel({required this.selected, required this.title});
}

class NeoText extends StatelessWidget {
  final String text;

final double size;
  final FontWeight fontWeight;
  final Color color;
  final double wordSpacing;
  final VoidCallback onClick;


  const NeoText({
    required this.text,
  required this.size,
    required this.fontWeight,
    required this.color,
    required this.wordSpacing,
    required this.onClick,

  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
 @override
  Widget build(BuildContext context) {
    return Container(
      child: onClick == null
          ? Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
          wordSpacing: wordSpacing,
        ),
      )
          : TextButton(
        onPressed: () {
          onClick.call();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: fontWeight,
            color: color,
            wordSpacing: wordSpacing,
          ),
        ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final CustomRowModel model;
  CustomRow(this.model);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0, bottom: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
// I have used my own CustomText class to customise TextWidget.
          NeoText(
        text: model.title,
          ),
          this.model.selected
              ? Icon(
            Icons.radio_button_checked,
            color: Colors.amber,
          )
              : Icon(Icons.radio_button_unchecked),
        ],
      ),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
    child: Column(
      children: <Widget>[
 Container(
          margin: EdgeInsets.all(5.0),
          alignment: Alignment.topRight,
          child: Icon(
            Icons.close,
            color: Colors.grey,
            size: 20.0,
          ),
        ),

Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          color: Colors.white,

child: Text(

            label: "Select your preferred language",
            labelColor: AppColors.dialogTitleColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        Flexible(
          child: new MyDialogContent(),//Custom ListView
        ),
SizedBox(
          height: 50,
          width: double.infinity,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            onPressed: () {},
            color: AppColors.dialogTitleColor,
            textColor: Colors.black,
            child: CustomText(
              label: "Submit",
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),

      ],
    ),
  );
}

class _MyDialogContentState extends State<MyDialogContent> {
  List<CustomRowModel> sampleData = <CustomRowModel>[];

  @override
  void initState() {
    super.initState();
    sampleData.add(CustomRowModel(title: "Children (Below 20 Years))", selected: false));
    sampleData.add(CustomRowModel(title: "Parents (Above 20 Years)", selected: false));
    sampleData.add(CustomRowModel(title: "Teacher (Above 20 Years)", selected: false));
sampleData.add(CustomRowModel(title: "Kannada", selected: false));
    sampleData.add(CustomRowModel(title: "Telugu", selected: false));
    sampleData.add(CustomRowModel(title: "Gujarathi", selected: false));
        sampleData.add(CustomRowModel(title: "Rajsthani", selected: false));
    sampleData.add(CustomRowModel(title: "Punjabi", selected: false));

  }

  @override
  Widget build(BuildContext context) {
    return sampleData.length == 0
        ? Container()
        : Container(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            //splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.selected = false);
                sampleData[index].selected = true;
              });
            },
            child: new CustomRow(sampleData[index]),
          );
        },
      ),
    );
  }
}
Widget setupAlertDialoadContainer() {
  return Container(
    height: 300.0, // Change as per your requirement
    width: 300.0, // Change as per your requirement
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Gujarat, India'),
        );
      },
    ),
  );
}

class LanguageSelectionState extends State<LanguageSelection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
      alignment: Alignment.center,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        elevation: 25.0,
        backgroundColor: Colors.white,
        child: dialogContent(context),
      ),
    );
  }
}
class Body2 extends StatefulWidget {
  bool isLogin = false;
   Body2({Key? key, required this.isLogin}) : super(key: key);


  @override
  Body3 createState() => Body3( isLogin1: isLogin);
}

class Body3 extends State {
  bool isLogin1 = false;
  Body3({Key? key, required  this.isLogin1}) ;
  //_VerifyOtpState({Key? key, required this.text, required this.phoneNo});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run((){
      showDialog(barrierDismissible: false, context: context, builder: (_) =>
            AlertDialog(
                title: Text("Please Login"),
                actions: [
                  TextButton(onPressed:() {
                    Fluttertoast.showToast(msg: "Upcoming! under development, Press Ok", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.redAccent, textColor: Colors.white, fontSize: 16.0);
                    // Navigator.pop(context);
                  }, child:Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15,top: 15),
                      child: Text("Cancel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                  ),
                  TextButton(onPressed:(){

if (isLogin1 == false) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyStatefulWidget()));

}
                  }, child:Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30,top: 15),
                      child: Text("Ok",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),),],),);
    }) ;

  }
showAlertDialog(BuildContext context) {

    // set up the list options
    Widget optionOne = SimpleDialogOption(
      child: ,
      onPressed: () {
        print('horse');
        Navigator.of(context).pop();
      },
    );
    Widget optionTwo = SimpleDialogOption(
      child: const Text('cow'),
      onPressed: () {
        print('cow');
        Navigator.of(context).pop();
      },
    );
    Widget optionThree = SimpleDialogOption(
      child: const Text('camel'),
      onPressed: () {
        print('camel');
        Navigator.of(context).pop();
      },
    );
    Widget optionFour = SimpleDialogOption(
      child: const Text('sheep'),
      onPressed: () {
        print('sheep');
        Navigator.of(context).pop();
      },
    );
    Widget optionFive = SimpleDialogOption(
      child: const Text('goat'),
      onPressed: () {
        print('goat');
        Navigator.of(context).pop();
      },
    );

    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Choose an animal'),
      children: <Widget>[
        optionOne,
        optionTwo,
        optionThree,
        optionFour,
        optionFive,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

 class LanguageSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return LanguageSelectionState();
  }
  }

  class LanguageSelectionState extends State<LanguageSelection> {
  @override
  void initState() {
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return Container(
  margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
  alignment: Alignment.center,
  child: Dialog(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
  Radius.circular(20.0),
  ),
  ),
  elevation: 25.0,
  backgroundColor: Colors.white,
  child: dialogContent(context),
  ),
  );
  }
  }

  class CustomRowModel {
  bool selected;
  String title;
  CustomRowModel({this.selected, this.title});
  }



  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(

        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConstants.backgroundColor,
          title: Text("RAMA PUZZLE", style: TextStyle(fontWeight: FontWeight.bold),),
          actions: [],),
GestureDetector(
              onTap: () => Dialog(child: dialogContent(context))),

AlertDialog(
          title: Text("Please Login"),
          content: Container(
          width: double.maxFinite,
          child: ListView(
            children: <Widget>[

            ]
        ),
      ),
      actions: [
        TextButton(onPressed:() {
          Fluttertoast.showToast(msg: "Upcoming! under development, Press Ok", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,
              backgroundColor: Colors.redAccent, textColor: Colors.white, fontSize: 16.0);
          // Navigator.pop(context);
        }, child:Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15,top: 15),
            child: Text("Cancel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
        ),
        ),
        TextButton(onPressed:(){


if (isLogin1 == false) {

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyStatefulWidget()));


}

        }
              ,
              child: Icon(Icons.back_hand_sharp),

            ),

          ],

        ),),],
],),

        drawer: Drawer(),

        body:
        Container(
          width: 400,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(

          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/dashboard.png"
            ),

          ),
        ),
        child: SingleChildScrollView(
          child: InkWell(

            child: Column(
              children: <Widget>
              [
                Container(// purple box
                  child: Stack(
                    children: <Widget>[
                      Container(
color: Color.fromARGB(100, 22, 44, 33),
                          child: Text("This is an upcoming screen, kindly click for logIn",
            style: TextStyle(fontSize: 25, color: Colors.white),),
                          height: size.height*0.2-20,

                          decoration: BoxDecoration(color: Colors.deepPurple,
                              borderRadius:BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),)
            
                          )

                      ),

    Container(
    height: 160,
      margin: EdgeInsets.only(left:20.0,right: 20,top: 40),
    child: ListView(scrollDirection: Axis.horizontal,

    children:  <Widget> [
    Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
    Container(
    width: 300,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    image: DecorationImage(
    image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/banner1.png"),

    fit: BoxFit.cover,
    ),
    ),),), Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
      Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/banner2.jpeg"),
            fit: BoxFit.cover,
          ),
        ),),), Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
      Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/banner3.jpeg"),
            fit: BoxFit.cover,
          ),
        ),),)],),)

Positioned//red box
                        (child:
                      Container(

                        margin: EdgeInsets.symmetric(horizontal: 35,
                              vertical: 30),

                        height: 138,
                        decoration:BoxDecoration
                          (
                            color: Colors.red,
                            borderRadius: BorderRadius.only
                              (
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )
                        ),

                      )
                      )
,
                    ],

                  ),),
                Container(
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:10.0),
                        child:

                      Text('Latest Quiz' ,style:TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold) ,),),
                      Container(
                        margin: EdgeInsets.only(right:10.0),
                        child:
                        Text('See all' ,textAlign: TextAlign.right,style:TextStyle(fontSize: 14,
                            fontWeight: FontWeight.bold) ,),),

                    ],
                  )
                ),



                Container(
                  height: 160,

                    child: ListView(scrollDirection: Axis.horizontal,

                    children:  <Widget> [
                      Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
                      Container(
                        width: 100,
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
                            Padding(padding: EdgeInsets.only(top: 80),
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
                        width: 100,
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
                      ),),
        Padding(padding: EdgeInsets.only(right: 10),child:
                      Container(
                        width: 100,
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
                            Padding(padding: EdgeInsets.only(top: 80),
                              child: Text(
                                "Youtube Quiz",
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
                            Padding(padding: EdgeInsets.only(top: 80),
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
            Padding(padding: EdgeInsets.only(right: 10),child:
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Plant-Tree.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 80),
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
Padding(padding: EdgeInsets.only(right: 10),child:
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/Plant-Tree.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 80),
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
                      ),


              ),
],
                    ),
                ),





                Container(
                    child : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:10.0),
                          child:

                          Text('Tranding' ,style:TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold) ,),),
                        Container(
                          margin: EdgeInsets.only(right:10.0),
                          child:
                          Text('See all' ,textAlign: TextAlign.right,style:TextStyle(fontSize: 14,
                              fontWeight: FontWeight.bold) ,),),

                      ],
                    )
                ),

                SizedBox(height: 15,),

                Column(children: [
                  Container(
                    height: 70,

                    child: Stack(
                      children:<Widget> [

                        Row(children: [
                          Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
                          Container(

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              image: DecorationImage(
                                image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/GK-Current-Quiz.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 80),
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


                          Container(



                            margin: EdgeInsets.only(left:10.0),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage('https://ramapuzzle.s3.ap-south-1.amazonaws.com/Community-Quiz.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 30),
                                  child: Text(
                                    'Community Post',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),)
                              ],
                            ),


                          ),

                        ],),

                        SizedBox(height: 15,),
                        Row(children: [      Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
                        Container(

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            image: DecorationImage(
                              image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/GK-Current-Quiz.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(top: 80),
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


                          Container(



                            margin: EdgeInsets.only(left:10.0),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage('https://ramapuzzle.s3.ap-south-1.amazonaws.com/Community-Quiz.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 30),
                                  child: Text(
                                    'Community Post',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),)
                              ],
                            ),


                          ),
                        ],)
Container(

                          child: IgnorePointer(
                            child: GridView.count(crossAxisCount:2,
                              crossAxisSpacing: 16.0,
                        childAspectRatio: 1.5,
                              children: [
                                Padding(padding: EdgeInsets.only(right: 10, left: 10),child:
                                Container(

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    image: DecorationImage(
                                      image: NetworkImage("https://ramapuzzle.s3.ap-south-1.amazonaws.com/GK-Current-Quiz.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 80),
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


                                Container(



                                  margin: EdgeInsets.only(left:10.0),

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage('https://ramapuzzle.s3.ap-south-1.amazonaws.com/Community-Quiz.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 30),
                                        child: Text(
                                          'Community Post',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),)
                                    ],
                                  ),


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
                                      image: NetworkImage('https://ramapuzzle.s3.ap-south-1.amazonaws.com/Human-Welfare.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 30),
                                        child: Text(
                                          'Human Welfare',
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

,
                SizedBox(height: 15,),

                Container(
                    child : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:10.0),
                          child:

                          Text('Study Material' ,style:TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold) ,),),
                        Container(
                          margin: EdgeInsets.only(right:10.0),
                          child:
                          Text('See all' ,textAlign: TextAlign.right,style:TextStyle(fontSize: 14,
                              fontWeight: FontWeight.bold) ,),),

                      ],
                    )
                ),

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
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                      bottomRight:Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),),
                                    image: DecorationImage(
                                      image: NetworkImage('https://ramapuzzle.s3.ap-south-1.amazonaws.com/Study-GKCurrent.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 30),
                                        child: Text(
                                          'GK & Current Affairs',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),)
                                    ],
                                  ),


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
                                      image: NetworkImage('https://ramapuzzle.s3.ap-south-1.amazonaws.com/Study-Paheli-Gyan.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 30),
                                        child: Text(
                                          'Paheli Gyan',
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
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                      bottomRight:Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),),
                                    image: DecorationImage(
                                      image: NetworkImage('https://ramapuzzle.s3.ap-south-1.amazonaws.com/Study-YouTube-Knowledge.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 30),
                                        child: Text(
                                          'Youtube Knowledge',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),)
                                    ],
                                  ),


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
                                      image: NetworkImage('https://ramapuzzle.s3.ap-south-1.amazonaws.com/Study-Regional-Paheli.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(top: 30),
                                        child: Text(
                                          'Regional Paheli',
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

                SizedBox(height: 10,),
                Visibility(
                    visible: isLogin1,
                    child: Column(children: [


                      Container(
                          child : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left:10.0),
                                child:

                                Text('Recent Quiz' ,style:TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.bold) ,),),
                              Container(
                                margin: EdgeInsets.only(right:10.0),
                                child:
                                Text('See all' ,textAlign: TextAlign.right,style:TextStyle(fontSize: 14,
                                    fontWeight: FontWeight.bold) ,),),

                            ],
                          )
                      ),


                Container(

                  margin: EdgeInsets.symmetric(horizontal: 5,
                      vertical: 5),

                  height: 90,
                  decoration:BoxDecoration
                    (
                      image: DecorationImage(
                        image: AssetImage('assets/images/latest_quiz.png'),
                        fit: BoxFit.cover,
                      ),

                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only
                        (
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )

                  ),

                )
                ],)),
              ],
            ),
  }

            onTap: (){
              if (isLogin1 == false)
              showDialog(context: context, builder: (context){
                return Container(
                  child: AlertDialog(
                    title: Text("Please Login"),
                    actions: [
                      TextButton(onPressed:(){
                        Navigator.pop(context);
                      }, child:Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15,top: 15),
                          child: Text("Cancel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                      ),
                      ),
                      TextButton(onPressed:(){
                        if (isLogin1 == false)
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyStatefulWidget()));
                      }, child:Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30,top: 15),
                          child: Text("Ok",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                      ), ),
                    ],

                  ),
                );
              },);
            },
          ),
        ),),
         bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      boxShadow: [
                  BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  backgroundColor: ColorConstants.backgroundColor, // <-- This works for fixed
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
                    ),                  ],

bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorConstants.backgroundColor, // <-- This works for fixed
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items:  const [

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

            onTap: (int indexOfItem) {
              if(indexOfItem==0){
                Navigator.pushNamed(context, '/login');
              }
            }
        ),

      ),

    ),
    ),);

  }

}
*/
