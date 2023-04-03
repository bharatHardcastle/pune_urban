import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import '../Widgets/Loading.dart';

class LevelCertificate extends StatefulWidget {
  const LevelCertificate({Key key}) : super(key: key);

  @override
  State<LevelCertificate> createState() => _LevelCertificateState();
}

class _LevelCertificateState extends State<LevelCertificate> {

  final _key = UniqueKey();
  bool isLoading=true;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    //getVillages();
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Level Certificate',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      body:Stack(
        children: [
          WebView(
            zoomEnabled: true,
            key: _key,
            onWebResourceError: (WebResourceError webviewer) {
              print("Internet Error");
            },
            initialUrl: Uri.encodeFull('http://103.224.247.79:8181/map/signin.html'),
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
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     //crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(
      //             flex: 1,
      //               child: Text('Applicant Name:')
      //           ),
      //           //SizedBox(width:MediaQuery.of(context).size.width*0.4,),
      //           Flexible(
      //             flex: 1,
      //             child: Container(
      //               height: MediaQuery.of(context).size.height*0.04,
      //               child: TextField(
      //                 decoration: InputDecoration(
      //                   border: OutlineInputBorder(),
      //                 ),
      //               ),
      //             )
      //           ),
      //         ],
      //       ),
      //       SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(
      //               flex: 1,
      //               child: Text('Address:')
      //           ),
      //           //SizedBox(width:MediaQuery.of(context).size.width*0.4,),
      //           Flexible(
      //               flex: 1,
      //               child: Container(
      //                 height: MediaQuery.of(context).size.height*0.04,
      //                 child: TextField(
      //                   decoration: InputDecoration(
      //                     border: OutlineInputBorder(),
      //                   ),
      //                 ),
      //               )
      //           ),
      //         ],
      //       ),
      //       SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(
      //               flex: 1,
      //               child: Text('Mobile:')
      //           ),
      //           //SizedBox(width:MediaQuery.of(context).size.width*0.4,),
      //           Flexible(
      //               flex: 1,
      //               child: Container(
      //                 height: MediaQuery.of(context).size.height*0.04,
      //                 child: TextField(
      //                   decoration: InputDecoration(
      //                     border: OutlineInputBorder(),
      //                   ),
      //                 ),
      //               )
      //           ),
      //         ],
      //       ),
      //       SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(
      //               flex: 1,
      //               child: Text('Email ID:')
      //           ),
      //           //SizedBox(width:MediaQuery.of(context).size.width*0.4,),
      //           Flexible(
      //               flex: 1,
      //               child: Container(
      //                 height: MediaQuery.of(context).size.height*0.04,
      //                 child: TextField(
      //                   decoration: InputDecoration(
      //                     border: OutlineInputBorder(),
      //                   ),
      //                 ),
      //               )
      //           ),
      //         ],
      //       ),
      //       SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(
      //               flex: 1,
      //               child: Text('Architect Name:')
      //           ),
      //           //SizedBox(width:MediaQuery.of(context).size.width*0.4,),
      //           Flexible(
      //               flex: 1,
      //               child: Container(
      //                 height: MediaQuery.of(context).size.height*0.04,
      //                 child: TextField(
      //                   decoration: InputDecoration(
      //                     border: OutlineInputBorder(),
      //                   ),
      //                 ),
      //               )
      //           ),
      //         ],
      //       ),
      //       SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(
      //               flex: 1,
      //               child: Text('Architect Address:')
      //           ),
      //           //SizedBox(width:MediaQuery.of(context).size.width*0.4,),
      //           Flexible(
      //               flex: 1,
      //               child: Container(
      //                 height: MediaQuery.of(context).size.height*0.04,
      //                 child: TextField(
      //                   decoration: InputDecoration(
      //                     border: OutlineInputBorder(),
      //                   ),
      //                 ),
      //               )
      //           ),
      //         ],
      //       ),
      //       SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(
      //               flex: 1,
      //               child: Text('Architect Phone:')
      //           ),
      //           //SizedBox(width:MediaQuery.of(context).size.width*0.4,),
      //           Flexible(
      //               flex: 1,
      //               child: Container(
      //                 height: MediaQuery.of(context).size.height*0.04,
      //                 child: TextField(
      //                   decoration: InputDecoration(
      //                     border: OutlineInputBorder(),
      //                   ),
      //                 ),
      //               )
      //           ),
      //         ],
      //       ),
      //       SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(
      //               flex: 1,
      //               child: Text('Architect Email:')
      //           ),
      //           //SizedBox(width:MediaQuery.of(context).size.width*0.4,),
      //           Flexible(
      //               flex: 1,
      //               child: Container(
      //                 height: MediaQuery.of(context).size.height*0.04,
      //                 child: TextField(
      //                   decoration: InputDecoration(
      //                     border: OutlineInputBorder(),
      //                   ),
      //                 ),
      //               )
      //           ),
      //         ],
      //       ),
      //       SizedBox(height:MediaQuery.of(context).size.height*0.05,),
      //       MaterialButton(
      //           color: Colors.orange,
      //           child: Text('NEXT'),
      //           onPressed:(){
      //           }
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
