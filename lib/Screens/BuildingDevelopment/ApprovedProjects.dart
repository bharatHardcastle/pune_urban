import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pune_urban/Screens/DevelopmentPlan/Zone_certificate/zone_http_post.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import '../../Widgets/Loading.dart';

class ApprovedProjects extends StatefulWidget {
  const ApprovedProjects({Key key}) : super(key: key);

  @override
  State<ApprovedProjects> createState() => _ApprovedProjectsState();
}

class _ApprovedProjectsState extends State<ApprovedProjects> {
  List<String> villageitems = [];
  String selectval;
  String name,address,mobile,email,_surveyNoCtsNo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _radioSelected1=1;
  var searchby;
  TextEditingController _surveynoController = TextEditingController();
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

  void getVillages() async {
    var data,villagenames,type;
    var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/getVillages.php");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['TYPE'] ='2';
    print(request);
    var response = await request.send();

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) async {
        data = jsonDecode(value);
        //print(data[0]['DATA_VALUE']);
        // var dataValue = data["DATA_VALUE"];
        // print(dataValue);
        setState(() {
          for (var i = 0; i < data.length; i++) {
            villagenames=data[i]['DATA_VALUE'];
            villageitems.add(villagenames);
            //  PolyIdList.add(data[i]['DATA_VALUE']);
            print(villageitems);
            selectval=villageitems[0];
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Approved Projects',style: TextStyle(color: Colors.black)
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFF8D882),
        elevation: 2.0,
      ),
      //backgroundColor:Color(0xfffffab9),
      body:Stack(
        children: [
          WebView(
            zoomEnabled: true,
            key: _key,
            onWebResourceError: (WebResourceError webviewer) {
              print("Internet Error");
            },
            initialUrl: Uri.encodeFull('https://autodcr.pmc.gov.in/bpams/PMC/ProposalAttachmentList.aspx?ListType=1'),
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
      //   child: Form(
      //     key: _formKey,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       //crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Text('VILLAGE NAME',style: TextStyle(fontWeight: FontWeight.bold,fontSize:14),)
      //           ],
      //         ),
      //         SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //         Container(
      //           height:MediaQuery.of(context).size.height*0.05,
      //           //width:MediaQuery.of(context).size.height*0.40,
      //           decoration: ShapeDecoration(
      //             color:Colors.white,
      //             shape: RoundedRectangleBorder(
      //               side: BorderSide(
      //                   width: 1.0, style: BorderStyle.solid),
      //               borderRadius: BorderRadius.all(Radius.zero),
      //             ),
      //           ),
      //           child: DropdownButton(
      //             elevation: 10,
      //             //hint:Center(child: Text('Select Village')),
      //             value: selectval,
      //             isExpanded: true,
      //             iconSize: 30.0,
      //             style: TextStyle(color: Colors.black),
      //             onChanged: (value){
      //               setState(() {
      //                 selectval = value.toString();
      //                 //getsurveyno(_dropDownValue,selectval);
      //                 //surveyitems.clear();
      //               });
      //             },
      //             items: villageitems.map((itemone){
      //               return DropdownMenuItem(
      //                   value: itemone,
      //                   child: Center(child: Text(itemone))
      //               );
      //             }).toList(),
      //           ),
      //         ),
      //         SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Text('SEARCH BY',style: TextStyle(fontWeight: FontWeight.bold,fontSize:14),)
      //           ],
      //         ),
      //         SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //         Row(
      //           //crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Radio(
      //               value: 1,
      //               groupValue: _radioSelected1,
      //               activeColor: Colors.orangeAccent,
      //               onChanged: (value) {
      //                 setState(() {
      //                   _radioSelected1 = value as int;
      //                   // _radioVal1 = 'Normal';
      //                   searchby='Survey no./GAT No';
      //                   //print(expert);
      //                 });
      //               },
      //             ),
      //             const Text("Survey no./GAT No"),
      //           ],
      //         ),
      //         Row(
      //           //crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Radio(
      //               value: 2,
      //               groupValue: _radioSelected1,
      //               activeColor: Colors.orangeAccent,
      //               onChanged: (value) {
      //                 setState(() {
      //                   _radioSelected1 = value as int;
      //                   // _radioVal1 = 'Normal';
      //                   searchby='CTS No';
      //                   //print(expert);
      //                 });
      //               },
      //             ),
      //             const Text("CTS No"),
      //           ],
      //         ),
      //         Row(
      //           //crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Radio(
      //               value: 3,
      //               groupValue: _radioSelected1,
      //               activeColor: Colors.orangeAccent,
      //               onChanged: (value) {
      //                 setState(() {
      //                   _radioSelected1 = value as int;
      //                   // _radioVal1 = 'Normal';
      //                   searchby='Owner/Developer';
      //                   //print(expert);
      //                 });
      //               },
      //             ),
      //             const Text("Owner/Developer"),
      //           ],
      //         ),
      //         Row(
      //           //crossAxisAlignment: CrossAxisAlignment.center,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Radio(
      //               value: 4,
      //               groupValue: _radioSelected1,
      //               activeColor: Colors.orangeAccent,
      //               onChanged: (value) {
      //                 setState(() {
      //                   _radioSelected1 = value as int;
      //                   // _radioVal1 = 'Normal';
      //                   searchby='Architect';
      //                   //print(expert);
      //                 });
      //               },
      //             ),
      //             const Text("Architect"),
      //           ],
      //         ),
      //         SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Flexible(
      //                 flex: 1,
      //                 child: Text(searchby!=null?searchby:'Survey no./GAT No',style: TextStyle(fontWeight: FontWeight.bold,fontSize:14),)
      //             ),
      //             SizedBox(width:MediaQuery.of(context).size.width*0.02,),
      //             Flexible(
      //               flex: 2,
      //               child:  Container(
      //                 height:MediaQuery.of(context).size.height*0.05,
      //                 width:MediaQuery.of(context).size.height*0.40,
      //                 decoration: ShapeDecoration(
      //                   color:Colors.white,
      //                   shape: RoundedRectangleBorder(
      //                     side: BorderSide(
      //                         width: 1.0, style: BorderStyle.solid),
      //                     borderRadius: BorderRadius.all(Radius.zero),
      //                   ),
      //                 ),
      //                 child: TextFormField(
      //                   keyboardType: TextInputType.text,
      //                   controller: _surveynoController,
      //                   //autovalidateMode: AutovalidateMode.always,
      //                   decoration: InputDecoration(
      //                     border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.vertical()
      //                     ),
      //                     //labelText: 'Name'
      //                   ),
      //                   // validator: (String value) {
      //                   //   if (value.isEmpty) {
      //                   //     return 'Name is Required';
      //                   //   }
      //                   //
      //                   //   return null;
      //                   // },
      //                   // onSaved: (String value) {
      //                   //   setState(() {
      //                   //     _surveyNoCtsNo = value;
      //                   //     print(_surveyNoCtsNo);
      //                   //   });
      //                   // },
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //         MaterialButton(
      //             color: Colors.orange,
      //             child: Text('SUBMIT'),
      //             onPressed:(){
      //               _surveyNoCtsNo=_surveynoController.text;
      //               print(_surveyNoCtsNo);
      //               }
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
