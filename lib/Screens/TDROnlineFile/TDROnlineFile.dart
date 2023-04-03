import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml2json/xml2json.dart';

import '../../constants.dart';

class TDROnlineFile extends StatefulWidget {
  const TDROnlineFile({Key key}) : super(key: key);

  @override
  State<TDROnlineFile> createState() => _TDROnlineFileState();
}

class _TDROnlineFileState extends State<TDROnlineFile> {
//   //
//    final _InWardNoController = TextEditingController();
//   var _InWardNo;
//   var _isFormVisible = false;
//   bool _isDataUploaded =false;
//   var division,subdivision,openspace,locationdata,district,taluka,villagename,rate,assessmenttype,assessmentrange;
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   // }
//   //
//   // void getVillageLocationsData(String inWardNo) async {
//   //   print(inWardNo);
//   //   // var uri = Uri.parse(
//   //   //     "http://tdrapp.justservices.in/WS_IN_NYATI_DVPMCTDR.asmx?op=NI_TDR_FILE_DETAILS");
//   //   // var request = new http.MultipartRequest("GET", uri);
//   //   // request.fields['StrInwardNo'] =inWardNo;
//   //   // request.fields['StrEntityId'] ='1';
//   //   // request.fields['StrMode'] ='CURRENT_STATUS';
//   //   // //print(village);
//   //   // print(request);
//   //   // var response = await request.send();
//   //   // print(response.statusCode);
//   //   // if (response.statusCode == 200) {
//   //   //   response.stream.transform(utf8.decoder).listen((value) async {
//   //   //     var data = value;
//   //   //     print(data);
//   //   //   });
//   //   // }
//   //   final response = await http.post(
//   //       Uri.parse("http://tdrapp.justservices.in/WS_IN_NYATI_DVPMCTDR.asmx"),
//   //       headers: {
//   //         'Accept': 'application/json'
//   //       },
//   //       body: {'StrEntityId':'1',
//   //         'StrInwardNo':inWardNo,
//   //         'StrMode':'CURRENT_STATUS'
//   //       }
//   //   );
//   //   var data = response.body;
//   //   print(data);
//   // }
//   //
//   //
//
//   int _firstInteger = 5;
//   int _secondInteger = 4;
//
//   var _testValue = "";
//   bool _add = true;
//   List<dynamic> itemsList = List();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _add = true;
//   }
//
//   Future _getCalculator(inWardNo) async {
//     var status="CURRENT_STATUS";
//     var id=1;
//     var envelope = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
//     "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
//     "<soap:Body>"
//     "<NI_TDR_FILE_DETAILS xmlns=\"http://tempuri.org/\">"
//     "<StrEntityId>${id}</StrEntityId>"
//     "<StrInwardNo>${inWardNo}</StrInwardNo>"
//     "<StrMode>${status}</StrMode>"
//     "</NI_TDR_FILE_DETAILS>"
//     "</soap:Body>"
//     "</soap:Envelope>";
//         final response = await http.post(
//         Uri.parse("http://tdrapp.justservices.in/WS_IN_NYATI_DVPMCTDR.asmx"),
//         headers: {
//           "Content-Type": "text/xml; charset=utf-8",
//           "SOAPAction": "http://tempuri.org/NI_TDR_FILE_DETAILS",
//           "Host": "tdrapp.justservices.in",
//         },
//         body: envelope);
//     print(response.statusCode);
//     var _response = response.body;
//     print(_response);
//     await _parsing(_response);
//
//     // Response response = await post(
//     //   Uri.parse('http://tdrapp.justservices.in/WS_IN_NYATI_DVPMCTDR.asmx'),
//     //   headers: {
//     //     'content-type': 'text/xml; charset=utf-8',
//     //     'SOAPAction': 'http://tempuri.org/NI_TDR_FILE_DETAILS',
//     //     'Host': 'tdrapp.justservices.in',
//     //   },
//     //   body: utf8.encode(envelope),
//     //
//     // );
//     // print("Response status: ${response.statusCode}");
//     // print("Response body: ${response.body}");
//   }
//
//
//   Future _parsing(var _response) async {
//     var _document = xml.parse(_response);
//     Iterable<xml.XmlElement> items = _document.findAllElements('NI_TDR_FILE_DETAILSResponse');
//     items.map((xml.XmlElement item) {
//       var _addResult = _getValue(item.findElements("NI_TDR_FILE_DETAILSResult"));
//       itemsList.add(_addResult);
//     }).toList();
//
//     print("itemsList: $itemsList");
//
//     setState(() {
//       _testValue = itemsList[0].toString();
//       _add = true;
//     });
//
//   }
//
//
//   _getValue(Iterable<xml.XmlElement>  items) {
//     var textValue;
//     items.map((xml.XmlElement node) {
//       textValue = node.text;
//     }).toList();
//     return textValue;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'TDR Online File',
//           style: TextStyle(color: Colors.black),
//         ),
//         //automaticallyImplyLeading: false,
//         backgroundColor:Color(0xFFF8D882),
//         elevation: 0.0,
//         iconTheme:IconThemeData(color: Colors.black),
//       ),
//       //backgroundColor:Color(0xfffffab9),
//       body:ModalProgressHUD(
//         inAsyncCall: _isDataUploaded,
//         child: SingleChildScrollView(
//           child: Container(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Visibility(
//                     visible: !_isFormVisible,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         //crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             //height:MediaQuery.of(context).size.height*0.05,
//                             color: Colors.white,
//                             child: TextFormField(
//                               //validator: _validateName,
//                               style: new TextStyle(color: Colors.black),
//                               keyboardType: TextInputType.text,
//                               controller: _InWardNoController,
//                               decoration: InputDecoration(
//                                 focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.grey),
//                                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.grey),
//                                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                                 hintText: 'Enter Inward No',
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 //labelStyle: TextStyle(color: Colors.grey),
//                                 //labelText: 'Enter Inward No',
//                                 //floatingLabelBehavior: FloatingLabelBehavior.auto
//                               ),
//                               onChanged:(String value){
//                                 setState(() {
//                                   _InWardNo = _InWardNoController.text;
//                                   // print(_InWardNo);
//                                 });
//                               },
//                             ),
//                           ),
//                           SizedBox(height:MediaQuery.of(context).size.height*0.02,),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Flexible(
//                                   flex: 1,
//                                   child: MaterialButton(
//                                       color: Colors.orange,
//                                       child: Text('Search'),
//                                       onPressed:(){
//                                         //print(_InWardNo);
//                                         // setState(() {
//                                         //   _isFormVisible=true;
//                                         // });
//                                         _getCalculator(_InWardNo);
//                                       }
//                                   )
//                               ),
//                               SizedBox(width:MediaQuery.of(context).size.width*0.1,),
//                               Flexible(
//                                   flex: 1,
//                                   child: MaterialButton(
//                                       color: Colors.orange,
//                                       child: Text('Clear'),
//                                       onPressed:(){
//                                         setState(() {
//                                           _InWardNoController.clear();
//                                         });
//                                       }
//                                   )
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Visibility(
//                     visible: !_isFormVisible,
//                     child: Container(
//                       //  height: 600,
//                       child: SingleChildScrollView(
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child:Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text('Current Department:',style: TextStyle(fontSize: 16),),
//                               ),
//                               SizedBox(height:MediaQuery.of(context).size.height*0.01,),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text('Current Stage:',style: TextStyle(fontSize: 16),),
//                               ),
//                               SizedBox(height:MediaQuery.of(context).size.height*0.01,),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text('Application Information:',style: TextStyle(fontSize: 16),),
//                               ),
//                               SizedBox(height:MediaQuery.of(context).size.height*0.01,),
//                               DataTable(
//                                 border: TableBorder.all(),
//                                 headingRowColor: MaterialStateColor.resolveWith((states) => Color(0xff0F52BA)),
//                                 columns: const <DataColumn>[
//                                   DataColumn(
//                                     label: Text(
//                                       'LOCATION',
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'DISTRICT',
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'TALUKA',
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'VILLAGE',
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'DIVISION',
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'SUBDIVISION',
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'OPEN SPACE',
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'RATE',
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'ASSESSMENT TYPE',
//                                     ),
//                                   ),
//                                   DataColumn(
//                                     label: Text(
//                                       'ASSESSMENT RANGE',
//                                     ),
//                                   ),
//                                 ],
//                                 rows: <DataRow>[
//                                   DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text(locationdata!=null?locationdata:'')),
//                                       DataCell(Text(district!=null?district:'')),
//                                       DataCell(Text(taluka!=null?taluka:'')),
//                                       DataCell(Text(villagename!=null?villagename:'')),
//                                       DataCell(Text(division!=null?division:'')),
//                                       DataCell(Text(subdivision!=null?subdivision:'')),
//                                       DataCell(Text(openspace!=null?openspace:'')),
//                                       DataCell(Text(rate!=null?rate:'')),
//                                       DataCell(Text(assessmenttype!=null?assessmenttype:'')),
//                                       DataCell(Text(assessmentrange!=null?assessmentrange:'')),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
  final _InWardNoController = TextEditingController();
  String _InWardNo = '',_applicantName = '', _pethName = '', _propertyNo = '', _reservationArea = '',_reservationType = '';
  List<String> fromDeptList = [],toDeptList = [], stageList = [],forwardDateList = [];
  String response3 = 'Nothing';
  var _isFormVisible = false;
  bool _isDataUploaded = false;
  Xml2Json xml2json = Xml2Json();
  String dept_Name = '', currentStage = '';
  var division,
      subdivision,
      openspace,
      locationdata,
      district,
      taluka,
      villagename,
      rate,
      assessmenttype,
      assessmentrange;

  int _firstInteger = 5;
  int _secondInteger = 4;

  var _testValue = "";
  bool _add = true;
  List<dynamic> itemsList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _add = true;
  }

  Future _getCalculator1(inWardNo) async {
    var status = "CURRENT_STATUS";
    var id = 1;
    var envelope = '''<?xml version="1.0" encoding="utf-8"?>
            <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
              <soap:Body>
                <NI_TDR_FILE_DETAILS xmlns="http://tempuri.org/">
                  <StrEntityId>$id</StrEntityId>
                  <StrInwardNo>$inWardNo</StrInwardNo>
                  <StrMode>$status</StrMode>
                </NI_TDR_FILE_DETAILS>
              </soap:Body>
            </soap:Envelope>''';
    var response = await http.post(
        Uri.parse("http://tdrapp.justservices.in/WS_IN_NYATI_DVPMCTDR.asmx"),
        //Uri.parse("http://tdrapp.justservices.in/NI_TDR_FILE_STATUS_ONLINE.asmx"),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/NI_TDR_FILE_DETAILS",
          "Host": "tdrapp.justservices.in",
        },
        body: envelope);
    print(response.statusCode);
    var _response = response.body;
    setState(() {
      response3 = response.body;
    });
    print(_response);
    await _parsing1(_response);

    // Response response = await post(
    //   Uri.parse('http://tdrapp.justservices.in/WS_IN_NYATI_DVPMCTDR.asmx'),
    //   headers: {
    //     'content-type': 'text/xml; charset=utf-8',
    //     'SOAPAction': 'http://tempuri.org/NI_TDR_FILE_DETAILS',
    //     'Host': 'tdrapp.justservices.in',
    //   },
    //   body: utf8.encode(envelope),
    //
    // );
    // print("Response status: ${response.statusCode}");
    // print("Response body: ${response.body}");
  }

  Future _getCalculator2(inWardNo) async {
    var status = "App_Info";
    var id = 1;
    var envelope = '''<?xml version="1.0" encoding="utf-8"?>
          <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <soap:Body>
              <NI_TDR_FILE_DETAILS xmlns="http://tempuri.org/">
                <StrEntityId>$id</StrEntityId>
                <StrInwardNo>$inWardNo</StrInwardNo>
                <StrMode>$status</StrMode>
              </NI_TDR_FILE_DETAILS>
            </soap:Body>
          </soap:Envelope>''';
    var response = await http.post(
        Uri.parse("http://tdrapp.justservices.in/WS_IN_NYATI_DVPMCTDR.asmx"),
        //Uri.parse("http://tdrapp.justservices.in/NI_TDR_FILE_STATUS_ONLINE.asmx"),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/NI_TDR_FILE_DETAILS",
          "Host": "tdrapp.justservices.in",
        },
        body: envelope);
    print(response.statusCode);
    var _response = response.body;
    setState(() {
      response3 = response.body;
    });
    print(_response);
    await _parsing2(_response);
  }

  Future _getCalculator3(inWardNo) async {
    var status = "forward_fetch";
    var id = 1;
    var envelope = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <NI_TDR_FILE_DETAILS xmlns="http://tempuri.org/">
      <StrEntityId>$id</StrEntityId>
      <StrInwardNo>$inWardNo</StrInwardNo>
      <StrMode>$status</StrMode>
    </NI_TDR_FILE_DETAILS>
  </soap:Body>
</soap:Envelope>''';
    var response = await http.post(
        Uri.parse("http://tdrapp.justservices.in/WS_IN_NYATI_DVPMCTDR.asmx"),
        //Uri.parse("http://tdrapp.justservices.in/NI_TDR_FILE_STATUS_ONLINE.asmx"),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/NI_TDR_FILE_DETAILS",
          "Host": "tdrapp.justservices.in",
        },
        body: envelope);
    print(response.statusCode);
    var _response = response.body;
    setState(() {
      response3 = response.body;
    });
    await _parsing3(_response);
  }

  Future _parsing1(var _response) async {
    xml2json.parse(_response);
    var jsonString = xml2json.toParker();
    var data = jsonDecode(jsonString);
    var encoder = new JsonEncoder.withIndent("     ");
    response3 = encoder.convert(data);
    print('the node is ${encoder.convert(data)}');

    var _document = xml.parse(_response);
    Iterable<xml.XmlElement> items =
    _document.findAllElements('NI_TDR_FILE_DETAILSResponse');
    //print('the items are $items');
    items.map((xml.XmlElement item) {
      var _addResult =
      _getValue1(item.findElements("NI_TDR_FILE_DETAILSResult"));

      itemsList.add(_addResult);
    }).toList();

    print("itemsList: $itemsList");

    setState(() {
      _testValue = itemsList[0].toString();
      _add = true;
    });
  }

  Future _parsing2(var _response) async {
    xml2json.parse(_response);
    var jsonString = xml2json.toParker();
    var data = jsonDecode(jsonString);
    var encoder = new JsonEncoder.withIndent("     ");
    response3 = encoder.convert(data);
    print('the node is ${encoder.convert(data)}');

    var _document = xml.parse(_response);
    Iterable<xml.XmlElement> items =
    _document.findAllElements('NI_TDR_FILE_DETAILSResponse');
    //print('the items are $items');
    items.map((xml.XmlElement item) {
      var _addResult =
      _getValue2(item.findElements("NI_TDR_FILE_DETAILSResult"));
      print(item.getElement('NI_TDR_FILE_DETAILSResult').siblingElements);
      // print(item.getElement('NewDataSet').document);

      itemsList.add(_addResult);
    }).toList();

    print("itemsList: $itemsList");

    setState(() {
      _testValue = itemsList[0].toString();
      _add = true;
    });
  }

  Future _parsing3(var _response) async {
    xml2json.parse(_response);
    var jsonString = xml2json.toParker();
    var data = jsonDecode(jsonString);
    var encoder = new JsonEncoder.withIndent("     ");
    response3 = encoder.convert(data);
    print('the node is ${encoder.convert(data)}');

    var _document = xml.parse(_response);
    Iterable<xml.XmlElement> items =
    _document.findAllElements('NI_TDR_FILE_DETAILSResponse');
    //print('the items are $items');
    items.map((xml.XmlElement item) {
      var _addResult =
      _getValue3(item.findElements("NI_TDR_FILE_DETAILSResult"));
      print(item.getElement('NI_TDR_FILE_DETAILSResult').siblingElements);
      // print(item.getElement('NewDataSet').document);

      itemsList.add(_addResult);
    }).toList();

    print("itemsList: $itemsList");

    setState(() {
      _testValue = itemsList[0].toString();
      _add = true;
    });
  }

  _getValue1(Iterable<xml.XmlElement> items) {
    var textValue;

    items.map((xml.XmlElement node) {
      textValue = node.text;
      print(node);
      try {
        print(
            'results of xml : ${node.findAllElements("NI_TDR_DEPT_NAME").first.text}');
        setState(() {
          dept_Name = node.findAllElements("NI_TDR_DEPT_NAME").first.text;
          currentStage = node.findAllElements("NI_TDR_CURRENT_USER").first.text;
        });
        //  node.findAllElements("NI_TDR_DEPT_NAME").elementAt(i);

      } catch (e) {
        print('The error was $e');
      }

      //print('the name in node is ${node.siblingElements.first.text}');
    }).toList();
    return textValue;
  }

  _getValue2(Iterable<xml.XmlElement> items) {
    var textValue;

    items.map((xml.XmlElement node) {
      textValue = node.text;
      print(node);
      try {
        print(
            'results of xml : ${node.findAllElements("applicant_a_name").first.text}');
        setState(() {
          _InWardNo = node.findAllElements("NI_TDR_APP_INWORD_NO").first.text;
          _applicantName = node.findAllElements("applicant_a_name").first.text;
          _pethName = node.findAllElements("NI_ZNVM_VILLAGE_NAME_ENGLISH").first.text;
          _propertyNo = node.findAllElements("NI_TDR_APP_PROPERTY_NO").first.text;
          _reservationArea = node.findAllElements("NI_TDR_AREA_OF_RESERVATION").first.text;
          _reservationType = node.findAllElements("NI_TDR_TYPE_RESERVATION").first.text;

        });
        //  node.findAllElements("NI_TDR_DEPT_NAME").elementAt(i);

      } catch (e) {
        print('The error was $e');
      }

      //print('the name in node is ${node.siblingElements.first.text}');
    }).toList();
    return textValue;
  }

  _getValue3(Iterable<xml.XmlElement> items) {
    var textValue;

    items.map((xml.XmlElement node) {
      textValue = node.text;
      print(node);
      try {
        for (int i = 0; i < node.findAllElements("forwarddate").length; i++) {
          print('results of xml : ${node.findAllElements("forwarddate").elementAt(i)}');

          setState(() {
            fromDeptList.add(node.findAllElements("FOR_NI_DEPT_NAME").elementAt(i).text);
            toDeptList.add(node.findAllElements("TO_NI_DEPT_NAME").elementAt(i).text);
            stageList.add(node.findAllElements("NI_TDR_FOR_PATH").elementAt(i).text);
            forwardDateList.add(node.findAllElements("forwarddate").elementAt(i).text);
          });

        }
      } catch (e) {
        print('The error was $e');
      }

      //print('the name in node is ${node.siblingElements.first.text}');
    }).toList();
    return textValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TDR Online File',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF8D882),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      //backgroundColor:Color(0xfffffab9),
      body: ModalProgressHUD(
        inAsyncCall: _isDataUploaded,
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: !_isFormVisible,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            //height:MediaQuery.of(context).size.height*0.05,
                            color: Colors.white,
                            child: TextFormField(
                              //validator: _validateName,
                              style: new TextStyle(color: Colors.black),
                              keyboardType: TextInputType.text,
                              controller: _InWardNoController,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                hintText: 'Enter Inward No',
                                hintStyle: TextStyle(color: Colors.grey),
                                //labelStyle: TextStyle(color: Colors.grey),
                                //labelText: 'Enter Inward No',
                                //floatingLabelBehavior: FloatingLabelBehavior.auto
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _InWardNo = _InWardNoController.text;
                                  // print(_InWardNo);
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: MaterialButton(
                                      color: Colors.orange,
                                      child: const Text('Search'),
                                      onPressed: () {
                                        //print(_InWardNo);
                                        // setState(() {
                                        //   _isFormVisible=true;
                                        // });
                                        _getCalculator1(_InWardNo);
                                        _getCalculator2(_InWardNo);
                                        _getCalculator3(_InWardNo);
                                      })),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                              Flexible(
                                  flex: 1,
                                  child: MaterialButton(
                                      color: Colors.orange,
                                      child: const Text('Clear'),
                                      onPressed: () {
                                        setState(() {
                                          _InWardNoController.clear();
                                        });
                                      })),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !_isFormVisible,
                    child: Container(
                      //  height: 600,
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Current Department:          $dept_Name',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.01,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Current Stage:                     $currentStage',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.01,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Application Information:',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.01,
                              ),
                              DataTable(
                                border: TableBorder.all(),
                                headingRowHeight: 30,
                                headingRowColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff0F52BA)),
                                columns: const <DataColumn>[
                                  /*DataColumn(
                                    label: Text(
                                      'LOCATION',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'DISTRICT',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'TALUKA',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'VILLAGE',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'DIVISION',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'SUBDIVISION',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'OPEN SPACE',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'RATE',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'ASSESSMENT TYPE',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'ASSESSMENT RANGE',
                                    ),
                                  ),*/
                                  DataColumn(
                                    label: Text(
                                      'INWARD NO.',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'APPLICANT NAME',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'PETH NAME',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'PROPERTY NO.',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'AREA OF RESERVATION',
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'TYPE OF RESERVATION',
                                    ),
                                  ),
                                ],
                                rows: <DataRow>[
                                  /*DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(locationdata != null
                                          ? locationdata
                                          : '')),
                                      DataCell(Text(
                                          district != null ? district : '')),
                                      DataCell(
                                          Text(taluka != null ? taluka : '')),
                                      DataCell(Text(villagename != null
                                          ? villagename
                                          : '')),
                                      DataCell(Text(
                                          division != null ? division : '')),
                                      DataCell(Text(subdivision != null
                                          ? subdivision
                                          : '')),
                                      DataCell(Text(
                                          openspace != null ? openspace : '')),
                                      DataCell(Text(rate != null ? rate : '')),
                                      DataCell(Text(assessmenttype != null
                                          ? assessmenttype
                                          : '')),
                                      DataCell(Text(assessmentrange != null
                                          ? assessmentrange
                                          : '')),
                                    ],
                                  ),*/
                                  DataRow(cells: [
                                    DataCell(Text(_InWardNo)),
                                    DataCell(Text(_applicantName)),
                                    DataCell(Text(_pethName)),
                                    DataCell(Text(_propertyNo)),
                                    DataCell(Text(_reservationArea)),
                                    DataCell(Text(_reservationType)),
                                  ])
                                ],
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.01,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'File Forwarded Details:',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                color: Color(0xff0F52BA),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width(context)*0.4,
                                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                      child: Text('From Department Name'),
                                    ),
                                    Container(
                                      width: width(context)*0.4,
                                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                      child: Text('To Department Name'),
                                    ),
                                    Container(
                                      width: width(context)*0.15,
                                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                      child: Text('Stage'),
                                    ),
                                    Container(
                                      width: width(context)*0.22,
                                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                      child: Text('Forward Date'),
                                    )
                                  ],
                                ),
                              ),

                              fromDeptList.isNotEmpty?
                              SizedBox(
                                height: height(context)*0.4,
                                width: width(context)*1.7,
                                child: ListView.builder(
                                    itemCount: fromDeptList.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Container(
                                            width: width(context)*0.4,
                                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                            child: Text(fromDeptList[index]),
                                          ),
                                          Container(
                                            width: width(context)*0.4,
                                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                            child: Text(toDeptList[index]),
                                          ),
                                          Container(
                                            width: width(context)*0.15,
                                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                            child: Text(stageList[index]),
                                          ),
                                          Container(
                                            width: width(context)*0.22,
                                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                            child: Text(forwardDateList[index]),
                                          )
                                        ],
                                      );
                                    }
                                ),
                              ):SizedBox()

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
