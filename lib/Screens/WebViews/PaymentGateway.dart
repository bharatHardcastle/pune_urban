import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import '../../Widgets/Loading.dart';


class PaymentGateway extends StatefulWidget {
  final String path;
  const PaymentGateway({Key key, this.path}) : super(key: key);

  @override
  _PaymentGatewayState createState() => _PaymentGatewayState();
}


class _PaymentGatewayState extends State<PaymentGateway> {

  final _key = UniqueKey();
  bool isLoading=true;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  var data;

  @override
  void initState() {
    getCustomerId();
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  void getCustomerId() async {
    var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/generate_customerId.php");
    var request = http.MultipartRequest("POST", uri);
    // request.fields['NAME'] =widget.name;
    // request.fields['TABLE_NAME'] =widget.database;
    print(request);
    var response = await request.send();

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) async {
        data = value;
        print(data);
        // setState(() {
        //   for (var i = 0; i < data.length; i++) {
        //     surveyNos=data[i]['DATA_VALUE'];
        //     surveyitems.add(surveyNos);
        //     //  PolyIdList.add(data[i]['DATA_VALUE']);
        //     print(surveyitems);
        //   }
        //   selectedsno=surveyitems[0];
        // });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Gateway',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor:Color(0xfffffab9),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
        WebView(
        zoomEnabled: true,
        key: _key,
        onWebResourceError: (WebResourceError webviewer) {
          print("Internet Error");
        },
        initialUrl: Uri.encodeFull(widget.path),
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