import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../WebViews/ZonePdf.dart';

class PDFViewerFromUrl extends StatefulWidget {
  const PDFViewerFromUrl({Key key, this.url, this.name, this.email, this.address, this.mobile, this.village, this.type, this.surveyNo, this.Link_Type, this.DP_TABLE_NAME}) : super(key: key);
  final String name;
  final String email;
  final String address;
  final String mobile;
  final String type;
  final String village;
  final String surveyNo;
  final String Link_Type;
  final String DP_TABLE_NAME;
  final String url;

  @override
  State<PDFViewerFromUrl> createState() => _PDFViewerFromUrlState();
}

class _PDFViewerFromUrlState extends State<PDFViewerFromUrl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Flexible(
                flex: 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    'Site Plan: Unsigned PDF',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(width: 30,),
              Flexible(
                flex: 1,
                  child: GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (_) => ZonePdf(name:widget.name,email:widget.email,mobile:widget.mobile,village:widget.village,type:widget.type,surveyNo:widget.surveyNo,address:widget.address,database:widget.DP_TABLE_NAME)//ZonePdf(path:'http://115.124.127.208/PHP/PMC/api_beta/zone/generate_zone_cert1_unsigned.php?&TYPE=${type}&VILLAGE_NAME=${selectval}&SURVEY_NO=${selectedsno}&APPLICANT_NAME=${name}&CHALLAN_NO=&ADDRESS=${address}')//(name:name,village:selectval,type:type,surveyNo:selectsno,address:address),
                        ),
                      );
                    },
                      child: Text('Pay Now', style: TextStyle(color: Colors.black,fontSize:15)))
              )
            ]
          ),
          //automaticallyImplyLeading: false,
          backgroundColor:Color(0xFFF8D882),
          elevation: 0.0,
          iconTheme:IconThemeData(color: Colors.black),
        ),
      body: PDF().fromUrl(
        widget.url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(
            child: Center(
            child: Text('Preview Not Available')
          )
        ),//error.toString()
      ),
    );
  }
}