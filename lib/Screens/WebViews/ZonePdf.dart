import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import '../../Widgets/Loading.dart';


class ZonePdf extends StatefulWidget {
  final String name;
  final String village;
  final String type;
  final String surveyNo;
  final String address;
  final String database;
  final String email;
  final String mobile;
  const ZonePdf({Key key, this.name, this.village, this.type, this.surveyNo, this.address, this.database, this.email, this.mobile}) : super(key: key);

  @override
  _ZonePdfState createState() => _ZonePdfState();
}


class _ZonePdfState extends State<ZonePdf> {

  final _key = UniqueKey();
  bool isLoading=true;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  var data;
  var TYPE;

  @override
  void initState() {
    getCustomerId();
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  void getCustomerId() async {
    if(widget.type=='1'){
      setState(() {
        TYPE='old_pmc_new';
      });
    }
    else if(widget.type=='2'){
      setState(() {
        TYPE='23_village';
      });
    }
    var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/generate_customerId.php");
    var request = http.MultipartRequest("POST", uri);
    request.fields['NAME'] =widget.name;
    request.fields['TABLE_NAME'] =widget.database;
    print(request);
    var response = await request.send();

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) async {
        data = value;
        print(data);
        setState(() async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('CHALLAN_NO', data);
        });
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
        backgroundColor: Color(0xFFF8D882),
        elevation: 0.0,
      ),
      //backgroundColor:Color(0xfffffab9),
      body: Stack(
        children: [
          WebView(
            zoomEnabled: true,
            key: _key,
            onWebResourceError: (WebResourceError webviewer) {
              print("Internet Error");
            },
            initialUrl: Uri.encodeFull('http://115.124.127.208/PHP/PMC/api_beta/zone/referralurl_billdesk.php?&NAME=${widget.name}&ADDRESS=${widget.address}&MOBILE_NO=${widget.mobile}&EMAIL_ID=${widget.email}&VILLAGE_TYPE=$TYPE&VILLAGE_NAME=${widget.village}&SURVEY_NO=${widget.surveyNo}&CUSTMER_ID=$data'),
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