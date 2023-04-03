import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class puneBoundryWebview extends StatefulWidget {
  const puneBoundryWebview({Key key}) : super(key: key);

  @override
  _puneBoundryWebviewState createState() => _puneBoundryWebviewState();
}


class _puneBoundryWebviewState extends State<puneBoundryWebview> {

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
        initialUrl: Uri.encodeFull("http://103.224.247.79:8181/dev/PMC/map_mobile.html"),
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