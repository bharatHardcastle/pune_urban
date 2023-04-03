import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Widgets/Loading.dart';



class SevenTwelveData extends StatefulWidget {
  const SevenTwelveData({Key key}) : super(key: key);

  @override
  _SevenTwelveDataState createState() => _SevenTwelveDataState();
}


class _SevenTwelveDataState extends State<SevenTwelveData> {

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
          '7/12',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor:Color(0xfffffab9),
        elevation: 0.0,
      ),
      body:
      Stack(
        children: [
          WebView(
            zoomEnabled: true,
            key: _key,
            // onWebResourceError: (WebResourceError webviewer) {
            //   print("Internet Error");
            // },
            initialUrl: Uri.encodeFull("https://bhulekh.mahabhumi.gov.in/Pune/Pune.html"),
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
          isLoading ? Center( child: Loading(),)
              : Stack(),
        ],
      ),
    );
  }
}