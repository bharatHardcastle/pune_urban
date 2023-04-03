import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewForUrls extends StatefulWidget {
  final String url;
  final String webtitle;
  const WebviewForUrls({Key key,  this.url, this.webtitle}) : super(key: key);

  @override
  State<WebviewForUrls> createState() => _WebviewForUrlsState();
}

class _WebviewForUrlsState extends State<WebviewForUrls> {

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
        title:  Text(
          widget.webtitle,
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      body: WebView(
              zoomEnabled: true,
              key: _key,
              onWebResourceError: (WebResourceError webviewer) {
                print("Internet Error");
              },
              initialUrl: Uri.encodeFull(widget.url),
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
