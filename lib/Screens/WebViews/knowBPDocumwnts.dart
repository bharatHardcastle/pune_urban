import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Widgets/Loading.dart';
import '../BPDocuments/knowbpdocumentsdetails.dart';

class KnowBpDocuments extends StatefulWidget {
  const KnowBpDocuments({Key key}) : super(key: key);

  @override
  _KnowBpDocumentsState createState() => _KnowBpDocumentsState();
}


class _KnowBpDocumentsState extends State<KnowBpDocuments> {

//   final _key = UniqueKey();
//   bool isLoading=true;
//   final Completer<WebViewController> _controller = Completer<WebViewController>();
//
//   @override
//   void initState() {
//     super.initState();
//     // Enable hybrid composition.
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Know Your BP Documents',
//           style: TextStyle(color: Colors.black),
//         ),
//         iconTheme:IconThemeData(color: Colors.black),
//         //automaticallyImplyLeading: false,
//         backgroundColor:Color(0xfffffab9),
//         elevation: 0.0,
//       ),
//       body: WebView(
//         zoomEnabled: true,
//         key: _key,
//         onWebResourceError: (WebResourceError webviewer) {
//           print("Internet Error");
//         },
//         initialUrl: Uri.encodeFull("http://103.224.247.79:8181/pmc_gismap/know_bp_documents/index.php"),
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller.complete(webViewController);
//         },
//         onPageFinished: (finish) {
//           setState(() {
//             isLoading = false;
//           });
//         },
//       ),
//     );
//   }
// }

  final _key = UniqueKey();
  bool isLoading=true;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _myController;

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
          'Know Your BP Documents',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor:Color(0xfffffab9),
        elevation: 0.0,
      ),
      body:
      WebView(
        zoomEnabled: true,
        key: _key,
        onWebResourceError: (WebResourceError webviewer) {
          print("Internet Error");
        },
        initialUrl: Uri.encodeFull("http://103.224.247.79:8181/pmc_gismap/know_bp_documents/index.php"),
        javascriptMode: JavascriptMode.unrestricted,
        /*onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },*/
        onWebViewCreated: (controller){
          _myController = controller;
        },
        javascriptChannels: {
          JavascriptChannel(
              name: 'JavascriptChannel',
              onMessageReceived: (message){
                print(message.message.length);
                print(message.message);
                if(message.message.length<200){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please Select the block first'),
                  ));
                }else{
                  print('The Message from Javascript is ${message.message}');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>KnowBPDocumentsDetails(htmlElement: message.message,)));
                }
               /* print('The Message from Javascript is ${message.message}');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>KnowBPDocumentsDetails(htmlElement: message.message,)));*/

              }
          )
        },
        onPageFinished: (finish) {
          setState(() {
            isLoading = false;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
          onPressed: ()async{
            await _myController.evaluateJavascript('''
              
              
              JavascriptChannel.postMessage(document.getElementById("popup-content").innerHTML);
          
          ''');
          },
          child: Icon(Icons.share)

      ),
    );
  }
}