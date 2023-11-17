import 'dart:convert';


import 'dart:collection';
import 'package:file_picker/file_picker.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'dart:io';

import 'package:path/path.dart' as path;


import 'dart:io';

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();

  // Initialize Amplify
  await Amplify.addPlugins([AmplifyStorageS3()]);
  Map<String, dynamic> amplifyConfig = {
    'auth': {
      'identityPoolId': 'ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a',
      'region': 'APSouth1'
    },
    'storage': {
      'plugins': {
        'awsS3StoragePlugin': {
          'bucket': 'ramapuzzle',
          'region': 'APSouth1'
        }
      }
    }
  };

  String jsonString = json.encode(amplifyConfig);
  await Amplify.configure(jsonString);
  */runApp(MyApp());

  //Map<String, dynamic> data = amplifyconfig;

  /*String jsonString = *//*json.encode(data);*//*
  "{
      "auth": {
  "identityPoolId": "ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a",
  "region": "APSouth1"
  },
  "storage": {
  "plugins": {
  "awsS3StoragePlugin": {
  "bucket": 'ramapuzzle',
  "region": "APSouth1"
  }
  }
  }*/
}


/* await Amplify.configure(""auth": {
  "identityPoolId": "ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a",
      "region": "APSouth1"
  },
"storage": {
"plugins": {
"awsS3StoragePlugin": {
"bucket": 'ramapuzzle',
"region": "APSouth1"
}
}
}");*/



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
  SimpleS3 _simpleS3 = SimpleS3();
  /*getImage() async{
    FilePickerResult? result =  await FilePicker.platform.pickFiles();
    if(result != null) {
      File file = File(result.files.single.path);
      uploadTo(file);
    }
  }*/


  /*if (result != null) {
  File file = File(result.files.single.path);
  } else {
  // User canceled the picker
  }*/

  uploadTo(File file) async {
    var  result = await _simpleS3.uploadFile(
      file,
      'ramapuzzle',
      'ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a',
      AWSRegions.apSouth1,
      debugLog: true,
      s3FolderPath: "https://ramapuzzle.s3.ap-south-1.amazonaws.com/",
      accessControl: S3AccessControl.publicRead,
    );

  }

  /*ImageData imageData = ImageData("uniqueFileName", ,
      uniqueId: "uniqueIdToTrackImage", imageUploadFolder: "folder to upload inside bucket");
  Future<void> uploadImageToS3(File imageFile) async {
    String? uploadedImageUrl = await AmazonS3Cognito.upload("ramapuzzle", "ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a", "APSouth1",
        String subRegion, ImageData imageData,
        {bool needMultipartUpload = false})*/
  /*final region = 'your_s3_region';
    final bucketName = 'your_s3_bucket_name';
    final accessKey = 'your_access_key';
    final secretKey = 'your_secret_key';

    final s3 = S3(
      region: region,
      accessKey: accessKey,
      secretKey: secretKey,
    );

    final imageName = path.basename(imageFile.path);
    final uploadResponse = await s3.uploadFile(
      bucketName,
      imageName,
      imageFile.path,
    );

    if (uploadResponse.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Image upload failed');
    }*/



  @override
  void initState() {
    super.initState();
    // Initialize Amplify
    //_initializeAmplify();
  }

  /*void _initializeAmplify() async {
    try {
      await Amplify.addPlugins([AmplifyStorageS3()]);
      //await Amplify.configure(amplifyconfig as String);

      print('Amplify initialized successfully');
      Map<String, dynamic> amplifyConfig = {
        'auth': {
          'identityPoolId': 'ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a',
          'region': 'APSouth1'
        },
        'storage': {
          'plugins': {
            'awsS3StoragePlugin': {
              'bucket': 'ramapuzzle',
              'region': 'APSouth1'
            }
          }
        }
      };

      String jsonString = json.encode({
        'auth': {
          'identityPoolId': 'ap-south-1:65c7c214-e5c1-49cd-ac40-9c6e763d731a',
          'region': 'APSouth1'
        },
        'storage': {
          'plugins': {
            'awsS3StoragePlugin': {
              'bucket': 'ramapuzzle',
              'region': 'APSouth1'
            }
          }
        }
      });
      await Amplify.configure(jsonString);
    } catch (e) {
      print('Failed to initialize Amplify: $e');
    }
  }*/

  /*void uploadFileToS3(String path) async {
    final file = File(path); // Replace with the actual file path

    try {
      final uploadOptions = S3UploadFileOptions(
        accessLevel: StorageAccessLevel.private, // Set the access level
      );
      final result = await Amplify.Storage.uploadFile(
        key: 'myFileKey',
        localFile: AWSFile.fromPath(file.path),
        options: uploadOptions,
      );

     *//* if (result) {
        setState(() {
          _uploadStatus = 'File uploaded successfully';
        });
      } else {
        setState(() {
          _uploadStatus = 'File upload failed';
        });
      }*//*
    } catch (e) {
      setState(() {
       // _uploadStatus = 'Error uploading file: $e';
      });
    }
  }*/



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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
     /* floatingActionButton: FloatingActionButton(
        onPressed: getImage(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      )*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

/* getImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    uploadFileToS3(image!.path);
  }*/


/*v*oid uploadFileToS33(String path) async {
    try {

      final file = File(path); // Provide the path to the file you want to upload
      final result = await Amplify.Storage.uploadFile(
        key: "", // Specify the key to use for the uploaded file in S3
        localFile: AWSFile.fromPath(
          file.path!,
        ),
      );
      Fluttertoast.showToast(msg: result.toString());

    } catch (e) {
      print('Upload error: $e');
    }
  }*/
}
