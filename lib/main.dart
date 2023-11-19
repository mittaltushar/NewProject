// @dart=2.9
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:rama_puzle/quiz.dart';
import 'package:rama_puzle/sign_up.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'amazon_s3_cognito.dart';
import 'application_localizations.dart';
import 'body1.dart';
import 'chceck.dart';
import 'demo.dart';
import 'lang_builder.dart';
import 'languages.dart';
import 'newnew.dart';
import 'splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';


/*Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  //runApp( MyApp());
  runApp( MyApp());
}*/
main() async {
  /*WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(
      EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('hi', 'US')], path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: MyApp(),
        
      ),
      );*/
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Allow only portrait orientation
  ]);

  runApp(
MyApp());
      /*MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Language Builder Example',
          initialRoute: 'body',
          routes: {
            //'splash_screen': (context) => SplashScreen(),
            'body': (context) => Body2(isLogin: false,),
            //'body': (context) => /*VideoWidget( url: '', play: true,)*/VideoPlayerApp(),
            //'body': (context) => Quiz(),
          }
       /* home: LanguageBuilder(
          useDeviceLanguage: false,
          defaultLanguage: 'en',
          languagesMap: Languages.languages,
          child: MyApp()*//*MyHomePage22()*//*,
          splash: Container(),
        ),*/
      ),

      );*/
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pashupati',
        initialRoute: 'body',
      routes: {
        //'splash_screen': (context) => SplashScreen(),

        'body': (context) =>
        SignUp()
        ,
        //'body': (context) => /*VideoWidget( url: '', play: true,)*/VideoPlayerApp(),
        //'body': (context) => Quiz(),
      }
      /*supportedLocales: [
        Locale( 'en' , 'US' ),
        Locale( 'es' , 'ES' ),
        Locale( 'fr' , 'FR' ),
      ],

      localizationsDelegates: [
        ApplicationLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale?.languageCode &&
              supportedLocaleLanguage.countryCode == locale?.countryCode) {
            return supportedLocaleLanguage;
          }
        }
        return supportedLocales.first;*/

      //home: Body2(isLogin: false,),

      );}}

      /*theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      debugShowCheckedModeBanner: false,
     /*   initialRoute: 'body',*/
        /*routes: {*/
          //'splash_screen': (context) => SplashScreen(),
          /*'body': (context) => Body2(isLogin: false,),*/
          //'body': (context) => /*VideoWidget( url: '', play: true,)*/VideoPlayerApp(),
          //'body': (context) => Quiz(),
        /*}*/
    );
  }
}
*/
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String _platformVersion = 'Unknown';

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await AmazonS3Cognito.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 0),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Body2(isLogin: false,)
            )
        )
    );
    initPlatformState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("GeeksForGeeks")),
      body: Center(
          child:Text("Home page",textScaleFactor: 2,)
      ),
    );
  }
}


/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pashupati',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      *//*theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),*//*
      initialRoute: 'body',
      routes: {//8210614766
    //'splash_screen': (context) => MyApp2(),
    'body': (context) => Body2(isLogin: false,),},
      //home: Splash()
      );
    *//*return MaterialApp(
      title: 'Rama puzzle',
        initialRoute: 'splash screen',

        routes: {
          'splash_screen': (context) => SplashScreen(),
          'body': (context) => Body(),
        },);*//*
        //body: InAppWebView(initialUrlRequest:
        //URLRequest(url: Uri.parse("https://xd.adobe.com/view/3963d34a-be9a-42cb-9a54-e0c659f17077-6c30/specs/"),),

        *//*return MaterialApp(
      title: 'Pashupati',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => SplashScreen(),
        'body': (context) => Body(),
      },
      // home: Quiz(),
    );*//*

  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator(), Text('Welcome..')],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Text('GeeksForGeeks'),
      ),
    );
  }
}*/
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  */
/*Widget buildCard() => Container(

  )

*//*


  }@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: Scaffold(body:

      Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

      ListView.separated(scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(12),
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (context, index) =>
          buildCard()
        ,),),);
  */
/*Widget buildCard(int index) => Container(
    color: Colors.blue,
  )*//*


}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build metho  d of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
      ListView.separated(scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(12),
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (context, index) =>
        {
        return
      },),);
  }


    buildCa
    */
/*buildCard(index)},),);*//*


    Widget buildCard(int index) => Column(mainAxisSize: MainAxisSize.min,children: [ClipRRect(borderRadius:
      BorderRadius.circular(20),child: Image.network('src'), height: 150, width: 150)],)

   */
/* },)
      Widget buildCard

*//*

      */
/*ListView.builder(itemBuilder: (BuildContext context, int index) {
        retrun
      },)
      Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
