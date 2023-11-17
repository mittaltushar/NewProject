/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
// Import for Android features.


class DocViewer extends StatefulWidget {
  late String pdf;
  DocViewer({Key? key, required this.pdf});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DocViewer2(pdf:  pdf);
  }
}
class DocViewer2 extends State {
  late String pdf;
  bool _isLoading = true;
  String? _pdfPath;
  DocViewer2({Key? key, required this.pdf});



  Future<void> _loadPdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/myPdf.pdf';

    final response = await http.get(Uri.parse("https://africau.edu/images/default/sample.pdf"));
    final file = File(path);
    await file.writeAsBytes(response.bodyBytes);


    */
/*WebViewController()
      .setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
    setState(() {
      _isLoading = false;
      _pdfPath = path;
    });*//*

  }

  Future<File> downloadPDF(String pdfUrl) async {
    final response = await http.get(Uri.parse(pdfUrl));
    final filePath = '/path/to/save/pdf.pdf'; // Replace with the desired file path

    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    return file;
  }

  */
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
  }*//*


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPdf();
  }
  @override
  Widget build(BuildContext context) {
    //final PdfDocument document = PdfDocument();
    // TODO: implement build
    return

        */
/* _isLoading
        ? Center(child: CircularProgressIndicator())
        : PDFView(
    filePath: _pdfPath!,
    ),);*//*


        Scaffold(
          appBar: AppBar(title: const Text('Flutter Simple Example')),
          body: WebViewWidget(controller: controller),
        )
       */
/* Container(
            child:
            PDF().cachedFromUrl('https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'))*//*
,);
    */
/*SfPdfViewer.network(
                  'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf')));*//*

  }

}

class LinkTextSpan extends TextSpan {
  LinkTextSpan({required TextStyle style, required String url, required String text})
      : super(
      style: style,
      text: text ?? url,
      recognizer: new TapGestureRecognizer()
        ..onTap = () {

          launch(url);
        });
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
}*/
