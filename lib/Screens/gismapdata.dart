import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class gisMapData extends StatefulWidget {
  const gisMapData({Key key}) : super(key: key);

  @override
  _gisMapDataState createState() => _gisMapDataState();
}


class _gisMapDataState extends State<gisMapData> {

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
          'Building Permission Department',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor:Color(0xfffffab9),
        elevation: 0.0,
      ),
      body: WebView(
        zoomEnabled: true,
        key: _key,
        onWebResourceError: (WebResourceError webviewer) {
          print("Internet Error");
        },
        initialUrl: Uri.encodeFull("https://hardcastlegis.com/GIS-Company/PMC/Building/overlap.html"),
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