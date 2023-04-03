import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ZonePdf_Webview extends StatefulWidget {
  final String name;
  final String village;
  final String type;
  final String surveyNo;
  final String address;
  const ZonePdf_Webview({Key key, this.name, this.village, this.type, this.surveyNo, this.address}) : super(key: key);

  @override
  _ZonePdf_WebviewState createState() => _ZonePdf_WebviewState();
}


class _ZonePdf_WebviewState extends State<ZonePdf_Webview> {

  final _key = UniqueKey();
  bool isLoading=true;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Zone Pdf',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF8D882),
        elevation: 0.0,
      ),
      //backgroundColor:Color(0xfffffab9),
      body: WebView(
        zoomEnabled: true,
        key: _key,
        onWebResourceError: (WebResourceError webviewer) {
          print("Internet Error");
        },
        initialUrl: Uri.encodeFull('http://115.124.127.208/PHP/PMC/api_beta/zone/generate_zone_cert1_unsigned.php?&TYPE=${widget.type}&VILLAGE_NAME=${widget.village}&SURVEY_NO=${widget.surveyNo}&APPLICANT_NAME=${widget.name}&CHALLAN_NO=&ADDRESS=${widget.address}'),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onPageFinished: (finish) {
          setState(() {
            isLoading = false;
          });
        },
      ),
    );
  }
}