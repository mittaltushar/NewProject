import 'package:flutter/material.dart';
class Quiz extends StatefulWidget
{
  const Quiz ({key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();

}
class _QuizState extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade900,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: (){},
          ),

          backgroundColor: Colors.purple.shade900,
          elevation: 0,
        ),

        body: SingleChildScrollView(

            child: Column(

                children: [
                  Padding(
                    padding:EdgeInsets.only(right: 70),
                    child:Container(
                      child: Text("Rewards Received for Quiz Math"
                        ,style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20,color:
                          Colors.white,),
                        textAlign: TextAlign.left,),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20,top: 5,right: 330,),
                    child: Text("3 points",
                      style: TextStyle(
                        fontSize: 14,color:Colors.white,),),
                  ),



                  Container(
                    margin: EdgeInsets.only(top: 15,left: 5,right: 5,bottom: 0.5),
                    height: 680.0,
                    width: 600.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),

                      ),

                    ),

                    child: Column(
                        children:[ Padding(
                          padding:EdgeInsets.only(left:3,top: 20,right: 280),
                          child: Text("Earned"
                            ,style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 25,color:
                              Colors.black,),
                            textAlign: TextAlign.left,
                          ),

                        ),
                          Padding(
                            padding: EdgeInsets.only(left: 20,top: 20,right: 110),
                            child: Text("Reward points for youtube Quiz",
                              style: TextStyle(
                                fontSize: 19,fontWeight: FontWeight.bold,color:Colors.deepPurple,),),
                          ),


                          Row(
                              children:[

                                Padding(
                                  padding: EdgeInsets.only(left: 20,right: 265,bottom:4),
                                  child: Text("02/02/23",
                                    style: TextStyle(
                                      fontSize: 14,color:Colors.black87,),),
                                ),
                                Padding(
                                  padding:EdgeInsets.only(),

                                  child: IconButton(
                                    icon: Icon(Icons.remove_red_eye,color: Colors.amber,),
                                    onPressed: () {
                                      // Add your onPressed logic here
                                    },
                                  ),
                                ),

                              ]
                          ),

                          Padding(
                            padding:EdgeInsets.only(left: 20,right: 20),
                            child:Divider(
                              height: 0, // Set the height to 0 to use the default height
                              color: Colors.grey, // Set the color of the divider
                            ),
                          ),

                          Padding(
                            padding:EdgeInsets.only(top: 10,left: 20,right: 20),
                            child:Container(
                              height: 70,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(

                                  children:[
                                    SizedBox(width: 2,),
                                    CircleAvatar(

                                      backgroundColor: Colors.yellow,
                                      child: Icon(
                                        Icons.storage,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    Text(" Reward",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                                    SizedBox(width: 10,),
                                    CircleAvatar(
                                      backgroundColor: Colors.deepPurple,
                                      child: Icon(
                                        Icons.question_mark_rounded,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),

                                    Text(" 1/10",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                                    SizedBox(width: 30,),
                                    CircleAvatar(
                                      backgroundColor: Colors.yellow,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                    Text(" 3 points",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding:EdgeInsets.only(left:20,top: 30,right: 20),
                            child: Text("1. In which year of first world war germany declared war on Russia and France? "
                              ,style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 21,color:
                                Colors.black,),
                              textAlign: TextAlign.left,
                            ),

                          ),
                          SizedBox(height: 5,),

                          Padding(
                            padding:EdgeInsets.only(top: 10,left: 20,right: 20),
                            child:Container(
                              height: 50,
                              width: 400,
                              color: Colors.green,
                              child: Padding(
                                padding:EdgeInsets.only(top: 15,left: 15),
                                child:Text("A.1914",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),

                          Padding(
                            padding:EdgeInsets.only(top: 10,left: 20,right: 20),
                            child:Container(
                              height: 50,
                              width: 400,
                              color: Colors.red,

                              child: Padding(
                                padding:EdgeInsets.only(top: 15,left: 15),
                                child:Text("B.1915",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                            ),
                          ),

                          SizedBox(height: 5,),

                          Padding(
                            padding:EdgeInsets.only(top: 10,left: 20,right: 20),
                            child:Container(
                              height: 50,
                              width: 400,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                color: Colors.white,
                              ),

                              child: Padding(
                                padding:EdgeInsets.only(top: 15,left: 15),
                                child:Text("C.1916",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,color: Colors.black),),
                              ),
                            ),
                          ),

                          SizedBox(height: 5,),

                          Padding(
                            padding:EdgeInsets.only(top: 10,left: 20,right: 20),
                            child:Container(
                              height: 50,
                              width: 400,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                color: Colors.white,
                              ),

                              child: Padding(
                                padding:EdgeInsets.only(top: 15,left: 15),
                                child:Text("D.1917",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,color: Colors.black),),
                              ),
                            ),
                          ),
                          /*Padding(
                            padding:EdgeInsets.only(top: 10,left: 20,right: 20),
                            child:SizedBox(
                              height: 50,
                              width: 320,
                              child: ElevatedButton(onPressed:(){},
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                                  child: Text("Next",
                                    style:TextStyle(fontSize:18,
                                        color:Colors.black),)),
                            ),
                          )*/
                        ]
                    ),
                  ),




                ]
            )
        )



    );
  }
}