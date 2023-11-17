
import 'package:docx_to_text/docx_to_text.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:open_document/open_document.dart';
import 'package:open_document/open_document_exception.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:dio/dio.dart';
import 'package:wakelock/wakelock.dart';
import 'package:permission_handler/permission_handler.dart';
class PermissionService {
  static Future<PermissionStatus> requestStoragePermission() async {
    return await Permission.storage.request();
  }
}

class OpenDoc extends StatefulWidget {
  late String pdf;
  OpenDoc({Key? key, required this.pdf});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OpenDoc2(pdf:  pdf);
  }
}
class OpenDoc2 extends State {
  late String pdf;
  bool _isLoading = true;
  String? _pdfPath;
  String? filePath;
  String _platformVersion = 'Unknown';
  var result;
  var _openResult;
  String? text = '';

  OpenDoc2({Key? key, required this.pdf});

  Future<void> _loadPdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/myPdf.pdf';

    final response = await http.get(
        Uri.parse("https://africau.edu/images/default/sample.pdf"));
    final file = File(path);
    await file.writeAsBytes(response.bodyBytes);

    setState(() {
      _isLoading = false;
      _pdfPath = path;
    });
  }

  /*Future<void> openFile() async {
    const filePath = '/data/user/0/com.pashupati.rama_puzzle.rama_puzzle_8/cache/document.docx';
    final result = await OpenFilex.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }*/
   downloadAndOpenDocx() async {
    final response = await http.get(Uri.parse(pdf!));

    if (response.statusCode == 200) {
      final Uint8List bytes = response.bodyBytes;

      // Get the temporary directory
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/document.docx');

      // Write the bytes to the file
      await file.writeAsBytes(bytes);

      readDocxContent(file.path);

      // Open the downloaded DOCX file
      /*result = await OpenFile.open(file.path, type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');
      setState(() {
        _openResult = "type=${result.type}  message=${result.message}";
      });*/
    } else {
      throw Exception('Failed to download DOCX');
    }
  }


  /*Future<void> convertDocxToPdf(String path) async {
    try {
      // Read the DOCX file
      final docxBytes = File(path).readAsBytesSync();
      final docxDocument = docx.Document.fromBytes(docxBytes);

      // Convert DOCX to PDF
      final pdfDocument = pw.Document();
      for (var element in docxDocument.elements) {
        // Convert DOCX elements to PDF
        if (element is docx.Paragraph) {
          pdfDocument.addParagraph(element);
        } else if (element is docx.Table) {
          pdfDocument.addTable(element);
        }
        // Add more conversions as needed
      }

      // Save the PDF file
      final pdfPath = await savePdfFile(pdfDocument);

      // Open the PDF file
      // Replace the open file logic based on your app requirements
      // For example, you can use the `open_file` package as shown in previous examples
      print('PDF file saved at: $pdfPath');
    } catch (e) {
      print('Error converting DOCX to PDF: $e');
    }
  }
*/
  void initCheckPermission() async {
    final _handler = PermissionService();
    var status = await PermissionService.requestStoragePermission();

    if (status.isGranted) {
      // Permission is granted, open the document
      //openDocument();
    } else if (status.isDenied) {
      // Permission is denied
      print("Storage permission is denied.");
    } else if (status.isPermanentlyDenied) {
      // Permission is permanently denied, navigate to app settings
      print("Storage permission is permanently denied. Open app settings.");
      openAppSettings();
    }
  }


  readDocxContent(String path) async {
    final file = File(path);
    final bytes = await file.readAsBytes();
    text = docxToText(bytes);
    setState(() {

    });
  }

  Future<File> downloadPDF(String pdfUrl) async {
    final response = await http.get(Uri.parse(pdfUrl));
    final filePath = '/path/to/save/pdf.pdf'; // Replace with the desired file path

    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    return file;
  }

  /*Future<void> openPDF(String pdfPath) async {
    final file = File(pdfPath);
    if (await file.exists()) {
      final document = PdfDocument(file: file);

      await document.loadDocument();

      // Display the PDF using your preferred method, such as navigation or dialog
      // For example, you can navigate to a new screen:
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PDFScreen(document: document),
      //   ),
      // );
    }
  }*/

  @override
  initState()  {
    // TODO: implement initState
    super.initState();
    //_loadPdf();
    //getDoc(pdf);
    //Wakelock.enable();

    /*if(!Platform.isWindows && !Platform.isMacOS)
      initCheckPermission();

    //initPlatformState();
    downloadAndOpenDocx();*/

    //openFile();
    //readDocxContent(pdf);
    downloadAndOpenDocx();
  }

  Future<void> initPlatformState() async {
    String filePath;

    //
    // Platform messages may fail, so we use a try/catch PlatformException.
    // "https://file-examples-com.github.io/uploads/2017/02/file_example_XLS_5000.xls";
    final url =
        pdf;
    //"https://file-examples-com.github.io/uploads/2017/02/file_example_XLS_5000.xls";
    //  "https://file-examples-com.github.io/uploads/2017/02/zip_10MB.zip";
//
    final name = await OpenDocument.getNameFile(url: url);

    final path = await OpenDocument.getPathDocument();
    filePath = "$path/$name";

    final isCheck = await OpenDocument.checkDocument(filePath: filePath);

    debugPrint("Exist: $isCheck");
    try {
      if (!isCheck) {
        filePath = await downloadFile(filePath: "$filePath", url: url);
      }
      await OpenDocument.openDocument(
        filePath: filePath,
      );

    } on PlatformException catch (e) {
      debugPrint("ERROR: message_${e.message} ---- detail_${e.details}");
      filePath = 'Failed to get platform version.';
    }

    setState(() {
      _platformVersion = filePath;
    });
  }

  /*void initCheckPermission() async {
*//*    final _handler = PermissionsService();
    await _handler.requestPermission(
      Permission.storage,
      onPermissionDenied: () => setState(
            () => debugPrint("Error: "),
      ),
    );*//*
  }*/

  getDoc(String url) async {
    final name = await OpenDocument.getNameFile(url: url);

    final path = await OpenDocument.getPathDocument();

    filePath = "$path/$name";
    final isCheck = await OpenDocument.checkDocument(filePath: filePath!);

    try {
      if (!isCheck) {
        filePath = await downloadFile(filePath: "$filePath", url: url);
      }
      await OpenDocument.openDocument(filePath: filePath!);
    } on OpenDocumentException catch (e) {
      debugPrint("ERROR: ${e.errorMessage}");
      filePath = 'Failed to get platform version.';
    }
  }

  Future<String> downloadFile(
      {required String filePath, required String url}) async {
    // CancelToken cancelToken = CancelToken();
    Dio dio = new Dio();
    await dio.download(
      url!,
      filePath,
      onReceiveProgress: (count, total) {
        debugPrint('---Download----Rec: $count, Total: $total');
        setState(() {
          _platformVersion = ((count / total) * 100).toStringAsFixed(0) + "%";
        });
      },
    );

    return filePath;
  }


  @override
  Widget build(BuildContext context) {
    //final PdfDocument document = PdfDocument();
    // TODO: implement build
    return
      Scaffold(
        body:

        Container(
            child:
          Text(text!)
            //OpenDocument.openDocument(filePath: filePath!)
//Text('')
        ),);
    /* _isLoading
        ? Center(child: CircularProgressIndicator())
        : PDFView(
    filePath: _pdfPath!,
    ),);*/
    /*Container(
            child:
            */ /*PDF().cachedFromUrl(pdf))*/ /*,);*/
    /*SfPdfViewer.network(
                  'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf')));*/
  }

}


class PdfViewerPage extends StatefulWidget {
  String pdf_url;
  PdfViewerPage({Key? key, required this.pdf_url});
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState(pdf_url: pdf_url);
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String pdf_url;
  _PdfViewerPageState({required this.pdf_url});
  late File Pfile;
  bool isLoading = false;
  Future<void> loadNetwork() async {
    setState(() {
      isLoading = true;
    });
    var url = pdf_url!;
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      Pfile = file;
    });

    print(Pfile);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadNetwork();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        child: Center(
          child: PDFView(
            filePath: Pfile.path,
          ),
        ),
      ),
    );
  }
}