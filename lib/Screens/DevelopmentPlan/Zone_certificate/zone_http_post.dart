import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../WebViews/ZonePdf.dart';
import 'ZonePdf_webview.dart';

class zone_http_post extends StatefulWidget {
  final String name;
  final String village;
  final String type;
  final String surveyNo;
  final String address;
  final String Link_Type;
  final String DP_TABLE_NAME;
  final String email;
  final String mobile;
  const zone_http_post({Key key, this.name, this.village, this.type, this.surveyNo, this.address, this.Link_Type, this.DP_TABLE_NAME, this.email, this.mobile}) : super(key: key);

  @override
  State<zone_http_post> createState() => _zone_http_postState();
}

class _zone_http_postState extends State<zone_http_post> {

  final _key = UniqueKey();
  bool isLoading=true;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    switchPages();
  }

  void switchPages() async {
    if(widget.Link_Type=='UNSIGNED_PDF'){
      Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
            builder: (_) => ZonePdf(name:widget.name,email:widget.email,mobile:widget.mobile,village:widget.village,type:widget.type,surveyNo:widget.surveyNo,address:widget.address,database:widget.DP_TABLE_NAME)//ZonePdf(path:'http://115.124.127.208/PHP/PMC/api_beta/zone/generate_zone_cert1_unsigned.php?&TYPE=${type}&VILLAGE_NAME=${selectval}&SURVEY_NO=${selectedsno}&APPLICANT_NAME=${name}&CHALLAN_NO=&ADDRESS=${address}')//(name:name,village:selectval,type:type,surveyNo:selectsno,address:address),
        ),
      );
    }
     else if(widget.Link_Type=='SIGNED_PDF'){
      Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
            builder: (_) => ZonePdf_Webview(name:widget.name,village:widget.village,type:widget.type,surveyNo:widget.surveyNo,address:widget.address)
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}