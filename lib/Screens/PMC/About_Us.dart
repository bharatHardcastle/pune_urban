import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Widgets/Loading.dart';



class AboutUsPmc extends StatefulWidget {
  const AboutUsPmc({Key key}) : super(key: key);

  @override
  _AboutUsPmcState createState() => _AboutUsPmcState();
}


class _AboutUsPmcState extends State<AboutUsPmc> {

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
          'About PMC',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xfffffab9),
        elevation: 0.0,
      ),
      body:
      Stack(
        children: [
          WebView(
            zoomEnabled: true,
            key: _key,
            onWebResourceError: (WebResourceError webviewer) {
              print("Internet Error");
            },
            initialUrl: Uri.encodeFull("http://115.124.127.208/PHP/PMC/Pune_Urban_Mobile_App/about_us.html"),
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
          // Align(
          //   alignment:Alignment.bottomLeft,
          //   child:Container(
          //     height:60,
          //     width: 60,
          //     margin:EdgeInsets.symmetric(horizontal: 20.0,vertical:10.0),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30.0),
          //       color: Color.fromRGBO(0, 102,204,10.0),
          //     ),
          //     child: IconButton(
          //         color: Colors.white,
          //         onPressed:()=> Navigator.pop(context),
          //         icon:Icon(Icons.arrow_back)
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}