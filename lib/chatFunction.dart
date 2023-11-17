
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class ChatFunction extends StatefulWidget {

  ChatFunction({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChatFunction2();
  }
}
  class ChatFunction2 extends State {

    final key = UniqueKey();
    int pos = 1;



    ChatFunction2(
        {Key? key}
        /*{Key? key, required this.category_id, required this.sub_category_id
    , required this.sub_name, required this.description
  }*/);

    @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Live Chat',
        home: new Scaffold(
          body: IndexedStack(index: 0,children: <Widget>[
            WebView(
              initialUrl: 'https://tawk.to/chat/64a6ac2394cf5d49dc61e680/1h4lh0r91',  // Replace with your desired URL
              javascriptMode: JavascriptMode.unrestricted,


            )
           /* WebView(
              initialUrl:
            )*/
          ],),
        ),
      );
    }


}
