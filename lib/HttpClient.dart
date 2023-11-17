import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:rama_puzle/NationalityData.dart';
import 'package:rama_puzle/QuizSubCategory.dart';
import 'package:rama_puzle/ResendOtpData.dart';
import 'package:rama_puzle/RewardsData.dart';
import 'package:rama_puzle/StudyMaterialDataList.dart';
import 'package:rama_puzle/contactInfo.dart';
import 'package:rama_puzle/faqData.dart';
import 'package:rama_puzle/new_edit_profile.dart';
import 'package:rama_puzle/profile.dart';
import 'package:rama_puzle/questionHistory.dart';
import 'package:rama_puzle/questionHistory2.dart';
import 'package:rama_puzle/quiz.dart';
import 'package:rama_puzle/quizHistoryData.dart';
import 'package:rama_puzle/rewardHistory.dart';
import 'package:rama_puzle/sign_up.dart';
import 'package:rama_puzle/studyMaterialData.dart';
import 'package:rama_puzle/submissionSuccess.dart';
import 'package:rama_puzle/topicQuizData.dart';

import 'package:rama_puzle/verifyOtp.dart';
import 'package:rama_puzle/videoPlayer.dart';
import 'package:rama_puzle/videoTopic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RewardHistoryData.dart';
import 'homepagedata2.dart';
import 'AgeModel.dart';
import 'CommunityPost.dart';
import 'GiveAnswerData.dart';
import 'homepagedata2.dart';

import 'Login.dart';
import 'LoginData.dart';


import 'OccupationModel.dart';
import 'ProfileData.dart';
import 'QuizGridItem.dart';
import 'QuizSubCategoryData.dart';
import 'ResetPassword.dart';

import 'StudyMaterialSubCatData.dart';
import 'TopicData.dart';
import 'VideoData.dart';
import 'VideoMaterialData.dart';
import 'body1.dart';
import 'commentData.dart';
import 'forgetPasswordVerifyData.dart';
import 'forgetpasswordData.dart';


 const baseURL = "http://www.ramapuzzle.com/api/v1";
 const postsEndpoint = baseURL + "/userLogin";
 const occupationList = baseURL + "/occupation";
 const ageList = baseURL + "/age";
 const userSignUp = baseURL + "/userRegister";
 const verifyTheOtp = baseURL + "/verifyOtpLogin";
 const homePageData1 = baseURL + "/getHomePage";
 const forgetPassword = baseURL + "/forgotPassword";
 const forgetPasswordVerify = baseURL + "/forgotPasswordOtpVerified";
 const resetPassword = baseURL + "/resetPassword";
 //const resetPassword = baseURL + "/"
  //const resendOtp = baseURL + "/resetPassword";
const resendOtp = baseURL + "/reSendOtp";
const nationality = baseURL + "/nationality";
const quizGrid = baseURL + "/socialCategory";
const studyMaterialGrid = baseURL + "/studyMaterial";
const subQuiz = baseURL + "/socialSubCategory";
const studySubMaterial = baseURL + "/studyMaterialSubCategory";
const topicList = baseURL + "/topicList";

const studyMaterial = baseURL + "/getStudyMaterial";
const profileData = baseURL + "/user/getUsersDetails";
const communityPost = baseURL + "/user/communityPost";
const videoTopicList = baseURL + "/videoList";
const videoMaterial = baseURL + "/videoMaterial";
const videoData = baseURL + "/videoDetails";
const commentData = baseURL + "/user/getAllComments";
const topicQuiz = baseURL + "/user/topicQuiz";
const faq = baseURL + "/faq";
const rewardHistoy = baseURL + "/user/rewardHistory";
const humanWelfare = baseURL + "/user/humanWelfarePost";
const saveAnswer = baseURL + "/user/saveAnswer";
const submitQuiz = baseURL + "/user/submitQuiz";
const addComment = baseURL + "/user/addComments";
const addPost = baseURL + "/user/addCommunityPost";
const addPostUrl = baseURL + "/user/addCommunityPostHumanWelfare";
const sendInfo = baseURL + "/user/contactForm";
const getContact = baseURL + "/contactUs";
const quizHistory = baseURL + "/user/quizHistory";
const studyMaterialFile = baseURL + "/getStudyMaterial";
const addCommentComuPost = baseURL + "/user/addComments";
const getUserProfile = baseURL + "user/myProfile";
const getUserProfile2 = baseURL + "/user/getUsersDetails";
const updateProfile = baseURL + "/user/updateProfile";
const studyMaterialTopicList = baseURL + "/studyMaterialTopicList";


  Future<StudyMaterialDataList>getStudyMaterialList(int study_cat_id, String sub_cat_id) async{
    final prefs = await SharedPreferences.getInstance();

// set value
    //a/wait prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;

    final response = await http.post(Uri.parse(studyMaterialTopicList),
        encoding: Encoding.getByName("utf-8"),
          body: {
        'study_category_id':study_cat_id.toString(),
        'study_subcategory_id': sub_cat_id
      }/*,headers: {"auth-token": token!}*/);
    StudyMaterialDataList nationalityData =
        studyMaterialDataListFromJson(response.body);
    //studyMaterialDataListToJson(response.body);
    return nationalityData;
  }
  getUserProfileFun() async {
  final prefs = await SharedPreferences.getInstance();

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
  return nationalityData;
}
getUserRewardHistory() async {


  final prefs = await SharedPreferences.getInstance();
  var authToken =  prefs.getString('auth-token');
  print("authentication token is here___________$authToken");
  var headers = {
    'auth-token': '$authToken'
  };
  var request = http.MultipartRequest('POST',
      Uri.parse("http://www.ramapuzzle.com/api/v1/user/getMyRewardHistory"));
  /*request.fields.addAll({
      'page': '$_pageNumber',
      'limit': '10'
    });*/
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var finalResponse = await response.stream.bytesToString();
    final jsonResponse = RewardHistoryData.fromJson(
        jsonDecode(finalResponse));
    //final jsonResponse = DeAddictionListModel.fromJson(jsonDecode(finalResponse));

    return jsonResponse;
    print(finalResponse);
    /*setState(() {
      rewardHistoryData = jsonResponse;
    });*/

    /* for(var i=0;i< communityModel!.payload!.length;i++){
        */ /*bool isContained = comments.any((element) => element.id.toString() == getDeAddictionListData!.payload![i].id.toString());
        print("checking is valid function here ${isContained}");
        if(isContained == true){
        }
        else{
          print("working this not");
          comments.add(getDeAddictionListData!.payload![i]);
        }*/ /*
        payload15?.add(communityModel!.payload.elementAt(i));
      }
      setState(() {
        _isLastPage = payload15!.length < _numberOfPostsPerRequest;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        // _posts.addAll(_posts);
      });
    }
    else {
      print(response.reasonPhrase);
    }*/
  }
}

 getUserProfileFun2() async {
  final prefs = await SharedPreferences.getInstance();

// set value
  //a/wait prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');


  int postId = prefs.getInt("user_id")!;


  var token = string;

  final response = await http.post(Uri.parse(getUserProfile2),
      encoding: Encoding.getByName("utf-8"),
        body: {
        'user_id':postId.toString(),

      },headers: {"auth-token": token!});
  ProfileData nationalityData =

  profileDataFromJson(response.body);
  return nationalityData;
}
addCommentComuPostApi(String postId, String content, Function function) async {
  final prefs = await SharedPreferences.getInstance();

// set value
  //a/wait prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

  var token = string;
  final response = await http.post(Uri.parse(addCommentComuPost),
      encoding: Encoding.getByName("utf-8"),
      body: {
    'post_id':postId,
    'content': content
  }, headers: {"auth-token": token!});

  SubmissionSuccess nationalityData =
  submissionSuccessFromJson(response.body);
  getAllCommentData(postId, '1', '1', '10', function);
  return nationalityData;
}


Future<StudyMaterialData> getStudyMaterialFile(String study_topic) async {
  final response = await http.post(Uri.parse(studyMaterialFile),
      body: {

        'study_topic_id': study_topic,

      }
  );
  StudyMaterialData data = studyMaterialDataFromJson(response.body);
  //parivar ke survey
  if (data.code == 1) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    /*final prefs =  await SharedPreferences.getInstance();

// set value
    await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);
    await prefs.setBool('isLogin', true);
    await prefs.setString('profile_name', data.payload.name);
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
      Navigator.of(context1).pop(true);
      //Navigator.pop(context1);
      updateValue("1");

    }*/
    /*Navigator.pushAndRemoveUntil(
        context1,
        MaterialPageRoute(builder: (context) => Body2(isLogin: true)), ModalRoute.withName("/Home"));*/

    // return LoginData.fromJson(jsonDecode(respo
    //nse.body));
    //return data.payload;
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



getContactInfo() async{
  var res = await http.get(Uri.parse(getContact));
  var data;
  //attache countryname on parameter country in url

  ContactInfo nationalityData = contactInfoFromJson(res.body);
  if (nationalityData.code == 1) {

    //OccupationModel data = occupationModelFromJson(res.body);
    return nationalityData;

  }else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
/*
getStudyMaterialFiles(String study_topic_id) async {
  final response = await http.post(Uri.parse(studyMaterialFile),
      body: {

        'study_topic_id': study_topic_id,

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
      Navigator.of(context1).pop(true);
      //Navigator.pop(context1);
      updateValue("1");

    }
    *//*Navigator.pushAndRemoveUntil(
        context1,
        MaterialPageRoute(builder: (context) => Body2(isLogin: true)), ModalRoute.withName("/Home"));*//*

    // return LoginData.fromJson(jsonDecode(respo
    //nse.body));
    //return data.payload;
    return data.code;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}*/

  contactUsApi(String topic_id, String message) async{
    final prefs = await SharedPreferences.getInstance();

// set value
    //a/wait prefs.setInt('user_id', data.payload.id);
    var string =  prefs.getString('auth-token');

    var token = string;
    final response = await http.post(Uri.parse(sendInfo),
        encoding: Encoding.getByName("utf-8"),
        headers: {"auth-token": token!},
        body: {

          'subject': topic_id,
          'message': message,
          /* 'password' : password,
         'login_type' : 'E',
         'device_type': 'A',
         'device_token': 'fjksf'*/
        }
    );
    SaveAnswerData saveAnswerData = saveAnswerDataFromJson(response.body);

  }
  getTopicQuiz(String topic_id) async {
   final prefs = await SharedPreferences.getInstance();

// set value
   //a/wait prefs.setInt('user_id', data.payload.id);
   var string =  prefs.getString('auth-token');

   var token = string;
   final response = await http.post(Uri.parse(topicQuiz),
       encoding: Encoding.getByName("utf-8"),
       headers: {"auth-token": token!},
       body: {

         'topic_id': topic_id,
        /* 'password' : password,
         'login_type' : 'E',
         'device_type': 'A',
         'device_token': 'fjksf'*/
       }
   );
  TopicQuizData topicQuizData = topicQuizDataFromJson(response.body);
  return topicQuizData;
 }

 quitQuiz (String topic_id, String time_spent) async{
   //var res = await http.get(Uri.parse(submitQuiz));

   final prefs = await SharedPreferences.getInstance();

// set value
   //await prefs.setInt('user_id', data.payload.id);
   var string =  prefs.getString('auth-token');

   var token = string;
   /*final response = await http.post(Uri.parse(topicQuiz),*/


   final response = await http.post(Uri.parse(submitQuiz),
       encoding: Encoding.getByName("utf-8"),
       headers: {'auth-token': string!}, body: {'topic_id': topic_id,
         'time_spent': time_spent,
         });
   SaveAnswerData saveAnswerData = saveAnswerDataFromJson(response.body);

   return saveAnswerData.code;
 }

Future<CommentData> getAllCommentData(String? string, String post_id, String page, String limit, Function function) async {
  //var token = string;
  final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

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
  return data;
}
 getNationality() async {

  var res = await http.get(Uri.parse(nationality));
  var data;
  //attache countryname on parameter country in url

    NationalityData nationalityData = nationalityDataFromJson(res.body);
    if (nationalityData.code == 1) {

    //OccupationModel data = occupationModelFromJson(res.body);
    return nationalityData;

  }else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
}
 fetchAlbum(String email, String password, String login_type, BuildContext context1, Function(String) updateValue) async {

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
      Navigator.pop(context1);
      /*Navigator.push(
          context1,
          MaterialPageRoute(builder: (context) => *//*Body2(isLogin: true)*//**//*startQuiz20(data1: quizHIstoryData,name:name)*//*
          Body2(isLogin: true)
          ));*/
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

submitAnswer(String topic_id1, String question_id, String user_ans) async {
  final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

  var token = string;
  /*final response = await http.post(Uri.parse(topicQuiz),*/


  final response = await http.post(Uri.parse(saveAnswer),
      encoding: Encoding.getByName("utf-8"),
      headers: {'auth-token': string!}, body: {'topic_id': topic_id1,
      'question_id': question_id,
        'user_answer': user_ans,});
  //CommunityPost communityPostData = communityPostFromJson(response.body);


/*  final response = await http.post(Uri.parse(saveAnswer),headers:
  {"auth-token": string!},encoding: Encoding.getByName("utf-8"),
      body: {
      'topic_id': topic_id1,
      'question_id': question_id,
      'user_answer': user_ans,
      });*/

  SaveAnswerData resendOtpDat = saveAnswerDataFromJson(response.body);
  return resendOtpDat.code;
}

quizHistory2(String topic_id, BuildContext context, String name) async {
  final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');
  final response = await http.post(Uri.parse(quizHistory),
      body: {
        'topic_id': topic_id,
      },encoding: Encoding.getByName("utf-8"),
      headers: {'auth-token': string!}
  );

  QuizHIstoryData quizHIstoryData = quizHIstoryDataFromJson(response.body);
  if (quizHIstoryData.code == 1) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => /*Body2(isLogin: true)*/startQuiz20(data1: quizHIstoryData,name:name)));

  }
}
resetPassword2(String password, String password2, String email, BuildContext context) async {
  final response = await http.post(Uri.parse(resetPassword),
  body: {
    'password': password,
    'confirm_password': password2,
    'email': email,
  }


  );

  ResendOtpData resendOtpData = resendOtpDataFromJson(response.body);
  if (resendOtpData.code == 1) {
    final prefs = await SharedPreferences.getInstance();

    String? lang = await prefs.getString('lang');
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Body2(isLogin: true)));
    return LoginData.fromJson(jsonDecode(response.body));
  }
}


Future<String> resendOtp1(String phone, BuildContext context) async {
  final response = await http.post(Uri.parse(resendOtp),
      body: {
        'phone': phone,
        'login_type': "E",
      }
  );
  if (response.statusCode == 200) {

    ResendOtpData resendOtpData = resendOtpDataFromJson(response.body);
    String text = resendOtpData.message;
    //text = text.replaceAll(new RegExp(r'[^0-9]'), ''); // '23
    //int otp = int.parse(text);
    //text = int.parse(text) as String;
    Fluttertoast.showToast(msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
    //return response.body;
    return text;
    //return LoginData.fromJson(jsonDecode(response.body));
  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


forgetPassword2(String email, BuildContext context) async {
  final response = await http.post(Uri.parse(forgetPassword),
      body: {
        'email': email,
        'login_type' : "E",
      }
  );
  //parivar ke survey // sccoty khadi krni h
  ResendOtpData resendOtpData = resendOtpDataFromJson(response.body);
  //LoginData.fromJson(jsonDecode(response.body));
  if (resendOtpData.code == 1) {
    // If the server did return a 200 OK response,
    /*// then parse the JSON.
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Body2(isLogin: true)));*/


   // ForgetPasswordData var  = response.body;

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VerifyOtp(text: resendOtpData.message, phoneNo : "",email: email, any: true)));
    return LoginData.fromJson(jsonDecode(response.body));
    /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPassword( email: email)));
*/
   /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VerifyOtp(text: response.body,phoneNo: "", email: email)));
   */
    /*String text  = response.body.replaceAll(new RegExp(r'[^0-9]'),''); // '23

    int otp = int.parse(text);
    Fluttertoast.showToast(msg: "$otp", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue, textColor: Colors.white, fontSize: 16.0);
*/
    return ForgetPasswordData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

updateProfile2(String name, String ageId, String dob, String phone, String email, String occupation_id, String nationality, String status,BuildContext context1) async{
  final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');


  final response = await http.post(Uri.parse(updateProfile),
      body: {
        'name': name,
        'age_id': ageId, 'phone': phone, 'email': email,
        'occupation_id': occupation_id,
        'nationality': nationality,
        'married_status': status
      },encoding: Encoding.getByName("utf-8"),
      headers: {'auth-token': "user_sM5giA21vaWU3Ym"}
  );

  final prefs2 = await SharedPreferences.getInstance();
  //prefs = await SharedPreferences.getInstance();

  String? lang = await prefs2.getString('lang');

  Fluttertoast.showToast(msg: "Successfully done",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
  /*Navigator.push(
      context1,
      MaterialPageRoute(builder: (context) => *//*VerifyOtp(text: resendOtpData.message,phoneNo: phone,email: "",any:false)*//*
      *//*Body2(isLogin: true)*//*
        SignUp())
      );*/


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

Future<LoginData> newUserReg(String name, String ageId, String occupationId, String phone
, String email, String password, String confirmPassword, String nationality, BuildContext context1) async {
  Map<String, String> body = {'name': name,
    'age_id' : ageId,
    'occupation_id' : occupationId,
    'phone' : phone,
    'email' : email,
    'password' : password,
    'nationality' : nationality,
    'confirm_password' : confirmPassword,
     'device_type' : 'A',
    'login_type' : 'E',};
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName("utf-8");
  final response = await http.post(Uri.parse(userSignUp),encoding: encoding, body: {
    'name': name,
    'age_id': ageId,
    'occupation_id': occupationId,
    'phone': phone,
    'email': email,
    'password': password,
    'confirm_password': confirmPassword,
    'nationality' : 'Indian',
    'device_type' : 'BTC',
    'login_type': "E", /*jsonBody*/
'device_token' : 'abcd',
/*      body: {
        'name': email,
        'age_id' : ageId,
        'occupation_id' : occupationId,
        'phone' : phone,
        'email' : email,
        'password' : password,
        'confirm_password' : confirmPassword,

        'login_type' : "E",
      }*/ /*,headers: { 'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": 'user_ED0hiyR6enmy0BK'}*/
  }
  );
  //parivar ke survey

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    ResendOtpData resendOtpData = resendOtpDataFromJson(response.body);
    Navigator.push(
        context1,
        MaterialPageRoute(builder: (context) => VerifyOtp(text: resendOtpData.message,phoneNo: phone,email: "",any:false)));
    return LoginData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


 getCity() async {
  var res = await http.get(Uri.parse(occupationList));
  var data;
  //attache countryname on parameter country in url
  if (res.statusCode == 200) {
    OccupationModel data = occupationModelFromJson(res.body);
    return data;
    }

}
//'device_type' : 'BTC',

//'device_token' : 'abcd'


/*'login_type' : "E",},
        'Accept': 'application/json',
        "Authorization": 'user_ED0hiyR6enmy0BK'}*/


/*sendAnswer() async{
  final encoding = Encoding.getByName("utf-8");
  final response;
  response = await http.post(Uri.parse(forgetPasswordVerify),encoding: encoding, body: {'email': email,
    'otp' : otp,
    'login_type' : 'E',

  }
  );
}*/

getFaq() async{

}
verifyForgetPasswordOtp(
String email, String otp, BuildContext context1) async {

  /*Map<String, String> body =
  //String jsonBody = json.encode(body);*/
  final encoding = Encoding.getByName("utf-8");
  final response;
  if (email.length > 0) {
  response = await http.post(Uri.parse(forgetPasswordVerify),encoding: encoding, body: {'email': email,
  'otp' : otp,
  'login_type' : 'E',

  }
  );
  ForgetPasswordVerifyData str = forgetPasswordVerifyDataFromJson(response.body);
  if (str.code == 1) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Navigator.push(
        context1,
        MaterialPageRoute(builder: (context) => ResetPassword(email: email,)));
    return LoginData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  }
  /*response = await http.post(Uri.parse(verifyTheOtp),encoding: encoding, body: {'phone': phone,
  'otp' : otp,


  'device_type' : 'BTC',

  'device_token' : 'abcd'
  ,

  *//*'login_type' : "E",},
        'Accept': 'application/json',
        "Authorization": 'user_ED0hiyR6enmy0BK'}*//*
  }
  );}
*/  //parivar ke survey

}

verfiyResendOtp(String phone, String otp, BuildContext buildContext) async {
  final encoding = Encoding.getByName("utf-8");
  final response;
  response = await http.post(
      Uri.parse(resendOtp), encoding: encoding, body: {'phone': phone,
    'otp': otp,

    'login_type': 'E',
    'device_type': 'BTC',

    'device_token': 'abcd'

    ,

      /*'login_type' : "E",},
        'Accept': 'application/json',
        "Authorization": 'user_ED0hiyR6enmy0BK'}*/
  }
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final prefs = await SharedPreferences.getInstance();
    //prefs = await SharedPreferences.getInstance();

    String? lang = await prefs.getString('lang');
    Navigator.push(
        buildContext,
        MaterialPageRoute(builder: (context) => Body2(isLogin: true, )));
    return LoginData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
verifyOtp1(
  String phone, String otp,String gmail,BuildContext context1) async {
  /*Map<String, String> body =
  //String jsonBody = json.encode(body);*/
  final encoding = Encoding.getByName("utf-8");
  final response;
  if (gmail.length > 0) {
     response = await http.post(Uri.parse(verifyTheOtp),encoding: encoding, body: {'email': gmail,
      'otp' : otp,
      'login_type' : 'E',

      'device_type' : 'BTC',

      'device_token' : 'abcd'
      ,

      /*'login_type' : "E",},
        'Accept': 'application/json',
        "Authorization": 'user_ED0hiyR6enmy0BK'}*/
    }
    );
  } else {
   response = await http.post(Uri.parse(verifyTheOtp),encoding: encoding, body: {'phone': phone,
  'otp' : otp,


  'device_type' : 'BTC',
     'login_type' : 'E',
  'device_token' : 'abcd'
  ,

  /*'login_type' : "E",},
        'Accept': 'application/json',
        "Authorization": 'user_ED0hiyR6enmy0BK'}*/
  }
  );

  }

  ResendOtpData variable = resendOtpDataFromJson(response.body);
  //parivar ke survey
  if (variable.code == 1) {
  // If the server did return a 200 OK response,
  // then parse the JSON.
    final prefs = await SharedPreferences.getInstance();
    //prefs = await SharedPreferences.getInstance();

    String? lang = await prefs.getString('lang');
    final prefs2 = await SharedPreferences.getInstance();
    var bool = prefs.setBool("isDone", true);
  Navigator.push(
  context1,
  MaterialPageRoute(builder: (context) => /*Body2(isLogin : true)*//*NewEditProfile(marital: 'Married')*/
  MyStatefulWidget(updateValue: (String ) {  },)
  ));
  return LoginData.fromJson(jsonDecode(response.body));
  } else {
  // If the server did not return a 200 OK response,
  // then throw an exception.
  throw Exception('Failed to load album');
  }
}

Future<VideoMaterialData> getVideoMaterial(String video_topic_id1) async {
  final encoding = Encoding.getByName("utf-8");
  var res = await http.post(Uri.parse(videoMaterial), encoding: encoding,
      body:{
        'video_topic_id' : video_topic_id1,

      });
  VideoMaterialData videoTopic = VideoMaterialData.fromJson(json.decode(res.body));
  print( videoTopic);
  return videoTopic;
}

Future<VideoTopic> getVideoTopic(String page, String limit) async {
  print("abcd");
  final encoding = Encoding.getByName("utf-8");
  var res = await http.post(Uri.parse(videoTopicList), encoding: encoding,
  body:{
    'page' : page,
    'limit' : limit,
  });
  VideoTopic videoTopic = VideoTopic.fromJson(json.decode(res.body));
  print(videoTopic);
  return videoTopic;
}

Future<StudyMaterialData> getStudyMaterial(String studyTopicId) async {
  final encoding = Encoding.getByName("utf-8");

  var res = await http.post(Uri.parse(studyMaterial), encoding: encoding, body: {'study_topic_id' : studyTopicId,});
  StudyMaterialData list = studyMaterialDataFromJson(res.body);
  return list;

}
Future<TopicList> getTopicList(String category_id, String sub_category_id) async {
  final encoding = Encoding.getByName("utf-8");

  final prefs = await SharedPreferences.getInstance();

// set value
  /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
  String? age_group = await prefs.getString('ageBit');
  if (age_group == null)
    age_group = 1.toString();
  var res = await http.post(Uri.parse(topicList), encoding: encoding, body: {'category_id' : category_id, 'subcategory_id': sub_category_id
  ,'age_group': age_group
  });
  TopicList list = topicListFromJson(res.body);
  //response = await http.post(Uri.parse(verifyTheOtp),encoding: encoding, body: {'phone': phone,
  /*'otp' : otp,


  'device_type' : 'BTC',
  'login_type' : 'E',
  'device_token' : 'abcd'
  ,*/
  return list;
}
/*getCity() async {
  var res = await http.get(Uri.parse(occupationList));
  var data;
  //attache countryname on parameter country in url
  if (res.statusCode == 200) {
    OccupationModel data = occupationModelFromJson(res.body);
    return data;

  }
}*/
getVideoData(String video_topic_id, String video_id, BuildContext context) async {
  final res = await http.post(Uri.parse(videoData), encoding:
  Encoding.getByName("utf-8"), body: {
    'video_topic_id': video_topic_id,
    'video_id' : video_id
  });
  VideoData data = videoDataFromJson(res.body);

  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayVideo(video_url:data.payload.videoUrl, video_data: data,video_topic_id: video_topic_id, video_id: video_id,))
  );
 // return data;
}

Future<CommunityPost> getCommunityPost( String pageNo, String limit, ) async {
  final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

  var token = string;
  //if (token == null)

  final response = await http.post(Uri.parse(communityPost),
      encoding: Encoding.getByName("utf-8"),
      headers: {'auth-token': token!}, body: {'page': pageNo,
        'limit': limit});
  CommunityPost communityPostData = communityPostFromJson(response.body);
  print(/*communityPostData.payload15.length*/'axb');
  return communityPostData;
}



Future<CommunityPost> getHumanWelfarePost( String pageNo, String limit, ) async {
  final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

  var token = string;
  //token = 'user_X4ORjMjprvrI4w5';
  final response = await http.post(Uri.parse(humanWelfare),
  encoding: Encoding.getByName("utf-8"),
  headers: {'auth-token': token!}, body: {'page': pageNo,
      'limit': limit});
  CommunityPost communityPostData = communityPostFromJson(response.body);
  print(/*communityPostData.payload15.length*/'axb');
  return communityPostData;
}

submitComment(String post_id, String content) async {
  final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

  final response = await http.post(Uri.parse(commentData),
      encoding: Encoding.getByName("utf-8"),
      headers: {"auth-token": string!},
      body: {
        'post_id': post_id,
        'content': content,

      });

  CommentData data = commentDataFromJson(response.body);
  return data;
}

 /*getAllCommentData(String? string, String post_id, String page, String limit, Function updateValue) async {
  //var token = string;
  final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

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
  //updateValue(data);
  return data;
}*/

addPost3(String caption, String title, String imagePost, String latitude, String longitute, BuildContext vont) async {
  final prefs = await SharedPreferences.getInstance();
  //Fluttertoast.showToast(msg: 'client12');
// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

  //var token = string;
  var token = string;
  //Fluttertoast.showToast(msg: 'client12');
  final response = await http.post(Uri.parse(addPostUrl),
      encoding: Encoding.getByName("utf-8"),
      headers: {"auth-token": token!},
      /*headers:   { 'Content-type': 'application/json',
       'Accept': 'application/json',
       *//*"Authorization": "user_2yHJ8eSsmKLED0h"*//*}*/ // user_VtPAAuNIRbQgzKT
      body: {
        'title':title,
        'caption':caption,
        'post_type' : 'IMAGE',
        'post_url' : imagePost,

        'latitude' : latitude,
        'longitude' : longitute
        /*'email': 'shachish@ajath.com',
         'password' : '123456',
         'login_type' : 'E',
         'device_type': 'A',
         'device_token': 'fjksf'*/
      }
  );
  //Fluttertoast.showToast(msg: 'client12');
  SaveAnswerData saveAnswerData = saveAnswerDataFromJson(response.body);
  Fluttertoast.showToast(msg: "Post added successfully");
  Navigator.pop(vont);
  /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPost()));*/

  return saveAnswerData;

}

addPost2(String caption, String title, String imagePost, String latitude, String longitute, BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

// set value
  //await prefs.setInt('user_id', data.payload.id);
  var string =  prefs.getString('auth-token');

  //var token = string;
  var token = string;
  final response = await http.post(Uri.parse(addPost),
      encoding: Encoding.getByName("utf-8"),
      headers: {"auth-token": token!},
      /*headers:   { 'Content-type': 'application/json',
       'Accept': 'application/json',
       *//*"Authorization": "user_2yHJ8eSsmKLED0h"*//*}*/ // user_VtPAAuNIRbQgzKT
      body: {
        'title':title,
        'caption':caption,
        'post_type' : 'IMAGE',
        'post_url' : imagePost,
        'latitude' : latitude,
        'longitude' : longitute
        /*'email': 'shachish@ajath.com',
         'password' : '123456',
         'login_type' : 'E',
         'device_type': 'A',
         'device_token': 'fjksf'*/
      }
  );
SaveAnswerData saveAnswerData = saveAnswerDataFromJson(response.body);
Fluttertoast.showToast(msg: "Post added successfully");
  Navigator.pop(context);
  /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPost()));*/

return saveAnswerData;

}

//contactUsApi()
 getProfile(int id, String? string) async {
   var token = string;
   final response = await http.post(Uri.parse(profileData),
       encoding: Encoding.getByName("utf-8"),
       headers: {"auth-token": token!},
       /*headers:   { 'Content-type': 'application/json',
       'Accept': 'application/json',
       *//*"Authorization": "user_2yHJ8eSsmKLED0h"*//*}*/ // user_VtPAAuNIRbQgzKT
       body: {
         'user_id':id.toString(),
         /*'email': 'shachish@ajath.com',
         'password' : '123456',
         'login_type' : 'E',
         'device_type': 'A',
         'device_token': 'fjksf'*/
       }
   );
   //LoginData data = loginDataFromJson(response.body);
   ProfileData data = profileDataFromJson(response.body);
   return data;
/*
   var headers = {
     'auth-token': 'user_2yHJ8eSsmKLED0h'
   };
   var request = http.MultipartRequest('POST', Uri.parse('http://www.ramapuzzle.com/api/v1/user/getUsersDetails'));
   request.fields.addAll({
     'user_id': '1'
   });

   request.headers.addAll(headers);

   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
     print(await response.stream.bytesToString());
   }
   else {
     print(response.reasonPhrase);
   }

*/

/*
  var token = "user_2yHJ8eSsmKLED0h";
// Try reading data from the counter key. If it doesn't exist, return 0.
  final user_id = */
/*prefs.getString('user_id') ?? '1'*//*
id;
  final encoding = Encoding.getByName("utf-8");
  //var res = await http.post(Uri.parse(profileData),encoding: e);
  var res = await http.post(Uri.parse(profileData),encoding: encoding, headers : {*/
/*'Content-Type': 'application/json',
    'Accept': 'application/json',*//*
'Content-type': 'application/json',
    'Accept': 'application/json',
  'Authorization':
  */
/*HttpHeaders.authorizationHeader*//*
*/
/*'auth-token'*//*
*/
/*'Bearer '+ '$token'*//*
'Bearer '+'user_2yHJ8eSsmKLED0h' }, body: {
    'user_id': user_id.toString(),
    //category_id: category_id.toString(),
    */
/*'' : otp,
  'login_type' : 'E',*//*


  });
  ProfileData data = profileDataFromJson(res.body);
  return data;
*/
}

getAges1() async {
  var res = await http.get(Uri.parse(ageList));
  var data;
  //attache countryname on parameter country in url
  if (res.statusCode == 200) {
    AgeModel data = ageModelFromJson(res.body);
    return data.payload;
  } else {
    throw Exception('Failed to load data');
  }
  }

Future<List<Payload2>>getAges() async {

  var res = await http.get(Uri.parse(ageList));
  var data;
  //attache countryname on parameter country in url
  if (res.statusCode == 200) {
    AgeModel data = ageModelFromJson(res.body);
    return data.payload;
    //return data.payload;
  } else {
    throw Exception('Failed to load data');
  }
}

/*
fetchSubQuizItem() async {
  final response = await http.post(Uri.parse(quizGrid), );
  final encoding = Encoding.getByName("utf-8");
  http.post(Uri.parse(forgetPasswordVerify),encoding: encoding, body: {: email,
    'otp' : otp,
    'login_type' : 'E',

  }
  );
}
*/

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
  return rewards;

}
Future<FaqData> getFaq2() async {
  var res = await http.get(Uri.parse(faq));
  var data;
  //attache countryname on parameter country in url
  FaqData faqData = faqDataFromJson(res.body);
  return faqData;
 /* NationalityData nationalityData = nationalityDataFromJson(res.body);
  if (nationalityData.code == 1) {
    //OccupationModel data = occupationModelFromJson(res.body);
    return nationalityData;
  }*/
}
Future<QuizSubCategoryData> fetchQuizSubCategory(int category_id) async {
  //final response = await http.post(Uri.parse(subQuiz));
  final encoding = Encoding.getByName("utf-8");
  final response = await http.post(Uri.parse(subQuiz),encoding: encoding, body: {
    'category_id': category_id.toString(),
    //category_id: category_id.toString(),
  /*'' : otp,
  'login_type' : 'E',*/

  });
  if (response.statusCode == 200) {
    QuizSubCategoryData result1 = QuizSubCategoryData.fromJson(jsonDecode(response.body));
    return result1;
  }
  else {
    throw Exception('Failed to load data');
  }
}



Future<StudyMaterialSubCatData> fetchStdSubCatMaterial(int study_cat_id) async {
  final response = await http.post(Uri.parse(studySubMaterial),body: {
    'study_category_id': study_cat_id.toString()
  });
  if (response.statusCode == 200) {
      StudyMaterialSubCatData result3 = StudyMaterialSubCatData.fromJson(jsonDecode(response.body)) ;
      return result3;
  }
  else {
    throw Exception('Failed to load data');
  }
}

Future<QuizGridItem> fetchQuizGridItem() async {
  final response = await http.post(Uri.parse(quizGrid));
  if (response.statusCode == 200) {
  //final HomePageData result = json.decode(response.body);

    //QuizSubCategory result1 = QuizSubCategory.fromJson(jsonDecode(response.body));
    QuizGridItem result2 = QuizGridItem.fromJson(jsonDecode(response.body));

  //return HomePageData.fromJson(jsonDecode(response.body));
  return result2;
  } else {
  throw Exception('Failed to load data');
  }
}

getLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();

// set value
  /*await prefs.setInt('user_id', data.payload.id);
    await prefs.setString('auth-token', data.payload.authToken);*/
  bool? loginBit = await prefs.getBool('isLogin');
  if (loginBit == null)
    return false;
  else
    return true;
}

Future<QuizGridItem> fetchStudyMaterialItem() async {
  final response = await http.post(Uri.parse(studyMaterialGrid));
  if (response.statusCode == 200) {
    //final HomePageData result = json.decode(response.body);

    QuizGridItem result1 = QuizGridItem.fromJson(jsonDecode(response.body));


    //return HomePageData.fromJson(jsonDecode(response.body));
    return result1;
  } else {
    throw Exception('Failed to load data');
  }
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

  if (statusBit == false) {
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


