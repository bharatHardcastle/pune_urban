// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
// import 'PdfViewer.dart';
//
// class SitePlan extends StatefulWidget {
//   const SitePlan({Key key}) : super(key: key);
//
//   @override
//   State<SitePlan> createState() => _SitePlanState();
// }
//
// class _SitePlanState extends State<SitePlan> {
//
//    var _dropDownValue;
//   //List<Map> PolyIdList=[];
//   List<String> villageitems = [];
//   String selectval;
//   String selectedsno;
//   List<String> surveyitems = [];
//   String name,address,mobile,email;
//    GlobalKey<FormState> _key = new GlobalKey();
//    bool _validate = false;
//    final _nameController = TextEditingController();
//    final _emailController = TextEditingController();
//    final _phoneController = TextEditingController();
//    final _addressController = TextEditingController();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   void getVillages(String dropDownValue) async {
//     var data,villagenames,type;
//     print(dropDownValue);
//     if(dropDownValue=='Old PMC'){
//       setState(() {
//         type='2';
//         //selectval='Aundh';
//       });
//     }
//     else{
//       setState(() {
//         type='1';
//         //selectval="AMBEGAON BK";
//       });
//     }
//     print(type);
//     var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/getVillages.php");
//     var request = new http.MultipartRequest("POST", uri);
//     request.fields['TYPE'] =type;
//     print(request);
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       response.stream.transform(utf8.decoder).listen((value) async {
//         data = jsonDecode(value);
//          //print(data[0]['DATA_VALUE']);
//          // var dataValue = data["DATA_VALUE"];
//          // print(dataValue);
//         setState(() {
//           for (var i = 0; i < data.length; i++) {
//             villagenames=data[i]['DATA_VALUE'];
//               villageitems.add(villagenames);
//              //  PolyIdList.add(data[i]['DATA_VALUE']);
//                 print(villageitems);
//           }
//         });
//       });
//     }
//   }
//
//   void getsurveyno(String dropDownValue, String selectval) async {
//     var data,type,surveyNos;
//     print(dropDownValue);
//     if(dropDownValue=='Old PMC'){
//       setState(() {
//         type='2';
//         //selectval="AMBEGAON BK";
//       });
//     }
//     else{
//       setState(() {
//         type='1';
//       });
//       //selectval='Aundh';
//     }
//     var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/getsno.php");
//     var request = new http.MultipartRequest("POST", uri);
//     request.fields['TYPE'] =type;
//     request.fields['VILLAGE_NAME'] =selectval;
//     print(request);
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       response.stream.transform(utf8.decoder).listen((value) async {
//         data = jsonDecode(value);
//         setState(() {
//           for (var i = 0; i < data.length; i++) {
//             surveyNos=data[i]['DATA_VALUE'];
//             surveyitems.add(surveyNos);
//             //  PolyIdList.add(data[i]['DATA_VALUE']);
//             print(surveyitems);
//           }
//           //selectedsno=surveyitems[0];
//         });
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Site Plan',
//           style: TextStyle(color: Colors.black),
//         ),
//         //automaticallyImplyLeading: false,
//         iconTheme:IconThemeData(color: Colors.black),
//         backgroundColor:Color(0xFFF8D882),
//         elevation: 0.0,
//       ),
//       body:Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _key,
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             //crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('           Name:  ')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         //height: MediaQuery.of(context).size.height*0.04,
//                         child: TextFormField(
//                           controller: _nameController,
//                           validator: _validateName,
//                           autovalidateMode: AutovalidateMode.always,
//                           style: new TextStyle(color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.vertical()
//                             ),
//                           ),
//                           onSaved: (String value) {
//                             setState(() {
//                               name = _nameController.text;
//                             });
//                           },
//                         ),
//                       )
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('       Address: ')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         //height: MediaQuery.of(context).size.height*0.04,
//                         child: TextFormField(
//                           controller: _addressController,
//                           //validator: _validateName,
//                           style: new TextStyle(color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.vertical()
//                             ),
//                           ),
//                           onSaved: (String value) {
//                             setState(() {
//                               address = _addressController.text;
//                             });
//                           },
//                         ),
//                       )
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('        Mobile:  ')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         //height: MediaQuery.of(context).size.height*0.04,
//                         child: TextFormField(
//                           controller:_phoneController,
//                           validator: _validatePhone,
//                           style: new TextStyle(color: Colors.black),
//                           keyboardType: TextInputType.phone,
//                           inputFormatters: [
//                             LengthLimitingTextInputFormatter(10),
//                           ],
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.vertical()
//                                   ),
//                               ),
//                           onSaved: (String val) {
//                             setState(() {
//                               mobile = _phoneController.text;
//                             });
//                           },
//                         ),
//                         // TextField(
//                         //   controller: _numbercontroller,
//                         //   decoration: InputDecoration(
//                         //     border: OutlineInputBorder(
//                         //         borderRadius: BorderRadius.vertical()
//                         //     ),
//                         //   ),
//                         //   onChanged: (int) {
//                         //     //_numbercontroller.text = text;
//                         //   },
//                         // ),
//                       )
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('      Email ID:  ')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         //height: MediaQuery.of(context).size.height*0.04,
//                         child:TextFormField(
//                           controller: _emailController,
//                           validator: _validateEmail,
//                           style: new TextStyle(color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.vertical()
//                             ),
//                           ),
//                           onSaved: (String value) {
//                             setState(() {
//                               email = _emailController.text;
//                             });
//                           },
//                         ),
//                         // TextField(
//                         //   controller: _emailcontroller,
//                         //   decoration: InputDecoration(
//                         //     border: OutlineInputBorder(
//                         //         borderRadius: BorderRadius.vertical()
//                         //     ),
//                         //   ),
//                         //   onChanged: (text) {
//                         //     //email = text;
//                         //   },
//                         // ),
//                       )
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('Siteplan type:')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         height:MediaQuery.of(context).size.height*0.05,
//                         decoration: ShapeDecoration(
//                           color:Colors.grey[400],
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                                 width: 1.0, style: BorderStyle.solid),
//                             borderRadius: BorderRadius.all(Radius.zero),
//                           ),
//                         ),
//                         child: DropdownButton(
//                           focusColor: Colors.grey,
//                           elevation: 10,
//                           hint: _dropDownValue == null
//                               ? Text('Select Type')
//                               : Center(
//                                 child: Text(
//                             _dropDownValue,
//                             style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500),
//                           ),
//                               ),
//                           isExpanded: true,
//                           iconSize: 30.0,
//                           style: TextStyle(color: Colors.black),
//                           items: ['23 Village', 'Old PMC'].map(
//                                 (val) {
//                               return DropdownMenuItem<String>(
//                                 value: val,
//                                 child: Text(val),
//                               );
//                             },
//                           ).toList(),
//                           onChanged: (String val) {
//                             setState(
//                                   () {
//                                 _dropDownValue = val;
//                                 getVillages(_dropDownValue);
//                                 villageitems.clear();
//                                 print(_dropDownValue);
//                               },
//                             );
//                           },
//                         ),
//                       )
//                   ),
//                 ],
//                   ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('Village name:')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child:  Container(
//                         height:MediaQuery.of(context).size.height*0.05,
//                         width:MediaQuery.of(context).size.height*0.40,
//                         decoration: ShapeDecoration(
//                           color:Colors.grey[400],
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                                 width: 1.0, style: BorderStyle.solid),
//                             borderRadius: BorderRadius.all(Radius.zero),
//                           ),
//                         ),
//                         child: DropdownButton(
//                           elevation: 10,
//                           hint:Center(child: Text('Select Village')),
//                           value: selectval,
//                           isExpanded: true,
//                           iconSize: 30.0,
//                           style: TextStyle(color: Colors.black),
//                           onChanged: (value){
//                             setState(() {
//                               selectval = value.toString();
//                               getsurveyno(_dropDownValue,selectval);
//                               surveyitems.clear();
//                             });
//                           },
//                           items: villageitems.map((itemone){
//                             return DropdownMenuItem(
//                                 value: itemone,
//                                 child: Center(child: Text(itemone))
//                             );
//                           }).toList(),
//                         ),
//                         // DropdownButtonHideUnderline(
//                         //   child: ButtonTheme(
//                         //     alignedDropdown: true,
//                         //     child: DropdownButton<String>(
//                         //       isDense: true,
//                         //       hint: new Text("Select Village"),
//                         //       value: 'POLY_ID',
//                         //       onChanged: (String ?newValue) {
//                         //         setState(() {
//                         //           //POLY_ID = newValue;
//                         //         });
//                         //         //print(POLY_ID);
//                         //       },
//                         //       items: PolyIdList.map((Map map) {
//                         //         return new DropdownMenuItem<String>(
//                         //           value: map["VILLAGE_NAME"].toString(),
//                         //           // value: _mySelection,
//                         //           child: Row(
//                         //             children: <Widget>[
//                         //               Container(
//                         //                   margin: EdgeInsets.only(left: 10),
//                         //                   child: Text(map["VILLAGE_NAME"])),
//                         //             ],
//                         //           ),
//                         //         );
//                         //       }).toList(),
//                         //     ),
//                         //   ),
//                         // ),
//                       ),
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('Sr.No/F.P No/\nTPS No:')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                     flex: 1,
//                     child:  Container(
//                       height:MediaQuery.of(context).size.height*0.05,
//                       width:MediaQuery.of(context).size.height*0.40,
//                       decoration: ShapeDecoration(
//                         color:Colors.grey[400],
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                               width: 1.0, style: BorderStyle.solid),
//                           borderRadius: BorderRadius.all(Radius.zero),
//                         ),
//                       ),
//                       child: DropdownButton(
//                         elevation: 10,
//                         hint:Center(child: Text('Please Select')),
//                         value: selectedsno,
//                         isExpanded: true,
//                         iconSize: 30.0,
//                         style: TextStyle(color: Colors.black),
//                         onChanged: (value){
//                           setState(() {
//                             selectedsno = value.toString();
//                             //surveyitems.clear();
//                           });
//                         },
//                         items: surveyitems.map((itemone){
//                           return DropdownMenuItem(
//                               value: itemone,
//                               child: Center(child: Text(itemone))
//                           );
//                         }).toList(),
//                       ),
//                       // DropdownButtonHideUnderline(
//                       //   child: ButtonTheme(
//                       //     alignedDropdown: true,
//                       //     child: DropdownButton<String>(
//                       //       isDense: true,
//                       //       hint: new Text("Select Village"),
//                       //       value: 'POLY_ID',
//                       //       onChanged: (String ?newValue) {
//                       //         setState(() {
//                       //           //POLY_ID = newValue;
//                       //         });
//                       //         //print(POLY_ID);
//                       //       },
//                       //       items: PolyIdList.map((Map map) {
//                       //         return new DropdownMenuItem<String>(
//                       //           value: map["VILLAGE_NAME"].toString(),
//                       //           // value: _mySelection,
//                       //           child: Row(
//                       //             children: <Widget>[
//                       //               Container(
//                       //                   margin: EdgeInsets.only(left: 10),
//                       //                   child: Text(map["VILLAGE_NAME"])),
//                       //             ],
//                       //           ),
//                       //         );
//                       //       }).toList(),
//                       //     ),
//                       //   ),
//                       // ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               MaterialButton(
//                   color: Colors.orange,
//                   child: Text('NEXT'),
//                   onPressed:(){
//                     _sendToServer();
//                     // if(_dropDownValue!=null&&selectval!=null&&selectedsno!=null){
//                     //   getPDFlink(_dropDownValue,selectval,selectedsno);
//                     // }
//                     // else{
//                     //   showDialog(
//                     //       context: context,
//                     //       builder: (BuildContext context) {
//                     //         return AlertDialog(
//                     //           backgroundColor: Colors.red[100],
//                     //           title: Text("Enter valid Data"),
//                     //           //content: Text(]),
//                     //           actions: <Widget>[
//                     //             IconButton(
//                     //                 icon: Icon(Icons.check,color: Colors.red,),
//                     //                 onPressed: () {
//                     //                   Navigator.of(context).pop();
//                     //                 })
//                     //           ],
//                     //         );
//                     //       });
//                     // }
//                   }
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   String _validateEmail(String value) {
//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regExp = new RegExp(pattern);
//     if (value.length != 0) {
//       if (!regExp.hasMatch(value)) {
//         return "Invalid Email";//Invalid Email
//       }
//       else {
//         return '';
//       }
//     }
//     else {
//       return '';
//     }
//   }
//
//   String _validateName(String value) {
//     if (value.length == 0) {
//       return "Field is Required";
//     } else {
//       return '';
//     }
//   }
//   String _validatePhone(String value) {
//     String pattern =
//         r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
//     RegExp regExp = new RegExp(pattern);
//     if (value.length == 0) {
//       return "Number is Required";
//       // } else if (!regExp.hasMatch(value)) {
//       //   return "Invalid Password";
//     } else {
//       return '';
//     }
//   }
//
//    _sendToServer() {
//      if (_key.currentState.validate()) {
//        // No any error in validation
//        _key.currentState.save();
//        print(name);
//        print(address);
//        print(email);
//        print(mobile);
//        getPDFlink(_dropDownValue,selectval,selectedsno);
//        //fetchVillageDetails();
//      } else {
//        // validation error
//        setState(() {
//          _validate = true;
//        });
//      }
//    }
//
//    getPDFlink(String dropDownValue, String selectval, String selectsno) async {
//      var data,type,villagecode;
//      print(dropDownValue);
//      print(selectval);
//      print(selectsno);
//      //print(dropDownValue);
//      if(dropDownValue=='Old PMC'){
//        setState(() {
//          villagecode='old_pmc_new';
//          //type='1';
//          //selectval="AMBEGAON BK";
//        });
//      }
//      else{
//        setState(() {
//          villagecode='23_village';
//        });
//        //type='2';
//        //selectval='Aundh';
//      }
//      var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/FetchPDFLink.php");
//      var request = new http.MultipartRequest("POST", uri);
//      request.fields['Link_Type'] ='UNSIGNED_PDF';
//      request.fields['Village_Name_Code'] =villagecode;
//      request.fields['S_No'] =selectsno;
//      request.fields['Village_Name'] =selectval;
//      print(villagecode);
//      print(selectval);
//      print(selectsno);
//      print(request);
//      var response = await request.send();
//
//      if (response.statusCode == 200) {
//        response.stream.transform(utf8.decoder).listen((value) async {
//          data = jsonDecode(value);
//          print(data);
//          Navigator.push(
//            context,
//            MaterialPageRoute<dynamic>(
//              builder: (_) => PDFViewerFromUrl(
//                url:'http://${data}',
//              ),
//            ),
//          );
//        });
//      }
//    }
//
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'PdfViewer.dart';

class SitePlan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SitePlanState();
  }
}

class SitePlanState extends State<SitePlan> {
//   String _name;
//   String _email;
//   String _address;
//   String _phoneNumber;
//   var _dropDownValue;
//   List<String> villageitems = [];
//   String selectval;
//   String selectedsno;
//   List<String> surveyitems = [];
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();
//
//
//   void getVillages(String dropDownValue) async {
//     var data,villagenames,type;
//     print(dropDownValue);
//     if(dropDownValue=='Old PMC'){
//       setState(() {
//         type='2';
//         //selectval='Aundh';
//       });
//     }
//     else{
//       setState(() {
//         type='1';
//         //selectval="AMBEGAON BK";
//       });
//     }
//     print(type);
//     var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/getVillages.php");
//     var request = new http.MultipartRequest("POST", uri);
//     request.fields['TYPE'] =type;
//     print(request);
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       response.stream.transform(utf8.decoder).listen((value) async {
//         data = jsonDecode(value);
//         setState(() {
//           for (var i = 0; i < data.length; i++) {
//             villagenames=data[i]['DATA_VALUE'];
//             villageitems.add(villagenames);
//             //  PolyIdList.add(data[i]['DATA_VALUE']);
//             print(villageitems);
//           }
//         });
//       });
//     }
//   }
//
//   void getsurveyno(String dropDownValue, String selectval) async {
//     var data,type,surveyNos;
//     //print(dropDownValue);
//     if(dropDownValue=='Old PMC'){
//       setState(() {
//         type='2';
//         //selectval="AMBEGAON BK";
//       });
//     }
//     else{
//       setState(() {
//         type='1';
//       });
//       //selectval='Aundh';
//     }
//
//     print(type);
//     print(selectval);
//     var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/getsno.php");
//     var request = new http.MultipartRequest("POST", uri);
//     request.fields['TYPE'] =type;
//     request.fields['VILLAGE_NAME'] =selectval;
//     print(request);
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       //response.stream.transform(utf8.decoder).listen((value) async {
//       response.stream..transform(Utf8Decoder())
//           .transform(LineSplitter()).listen((value) async {
//         data = jsonDecode(value);
//         print(data.length);
//         setState(() {
//           for (var i = 0; i < data.length; i++) {
//             surveyNos=data[i]['DATA_VALUE'];
//             surveyitems.add(surveyNos);
//             //  PolyIdList.add(data[i]['DATA_VALUE']);
//             print(surveyitems);
//           }
//           //selectedsno=surveyitems[0];
//         });
//       });
//     }
//   }
//
//   Widget _buildName() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       //autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//         ),
//           //labelText: 'Name'
//       ),
//       // validator: (String value) {
//       //   if (value.isEmpty) {
//       //     return 'Name is Required';
//       //   }
//       //
//       //   return null;
//       // },
//       onSaved: (String value) {
//         _name = value;
//       },
//     );
//   }
//
//   Widget _buildAddress() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       // autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//         ),
//         //labelText: 'Name'
//       ),
//       //maxLength: 10,
//       // validator: (String value) {
//       //   if (value.isEmpty) {
//       //     return 'Address is Required';
//       //   }
//       //
//       //   return null;
//       // },
//       onSaved: (String value) {
//         _address = value;
//       },
//     );
//   }
//
//   Widget _buildEmail() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       // autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//         ),
//       ),
//       // validator: (String value) {
//       //   if (value.isEmpty) {
//       //     return 'Email is Required';
//       //   }
//       //
//       //   if (!RegExp(
//       //       r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//       //       .hasMatch(value)) {
//       //     return 'Please enter a valid email Address';
//       //   }
//       //
//       //   return null;
//       // },
//       onSaved: (String value) {
//         _email = value;
//       },
//     );
//   }
//
//   Widget _buildPhoneNumber() {
//     return TextFormField(
//         // autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//          ),
//         ),
//       keyboardType: TextInputType.phone,
//       inputFormatters: [
//         LengthLimitingTextInputFormatter(10),
//       ],
//       // validator: (String value) {
//       //   String pattern =
//       //       r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
//       //   RegExp regExp = new RegExp(pattern);
//       //   if (value.length == 0) {
//       //     return "Number is Required";
//       //   } else if (!regExp.hasMatch(value)) {
//       //     return "Invalid Number";
//       //   } else {
//       //     return null;
//       //   }
//       // },
//       onSaved: (String value) {
//         _phoneNumber = value;
//       }
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Site Plan',
//           style: TextStyle(color: Colors.black),
//         ),
//         //automaticallyImplyLeading: false,
//         iconTheme:IconThemeData(color: Colors.black),
//         backgroundColor:Color(0xFFF8D882),
//         elevation: 0.0,
//       ),
//       //backgroundColor:Color(0xfffffab9),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             //crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('           Name:  ')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         height: MediaQuery.of(context).size.height*0.05,
//                         child: TextFormField(
//                           controller: _nameController,
//                           autovalidateMode:AutovalidateMode.always,
//                           style: new TextStyle(color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.vertical()
//                             ),
//                           ),
//                           onChanged:(String value){
//                             setState(() {
//                               _name = _nameController.text;
//                               //print(name);
//                             });
//                           },
//                         ),
//                       )
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('       Address: ')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         height: MediaQuery.of(context).size.height*0.05,
//                         child: TextFormField(
//                           //validator: _validateName,
//                           controller: _addressController,
//                           style: new TextStyle(color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.vertical()
//                             ),
//                           ),
//                           onChanged:(String value){
//                             setState(() {
//                               _address = _addressController.text;
//                               //print(address);
//                             });
//                           },
//                         ),
//                       )
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('        Mobile:  ')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         height: MediaQuery.of(context).size.height*0.05,
//                         child: TextFormField(
//                           controller:_phoneController,
//                           style: new TextStyle(color: Colors.black),
//                           keyboardType: TextInputType.phone,
//                           inputFormatters: [
//                             LengthLimitingTextInputFormatter(10),
//                           ],
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.vertical()
//                             ),
//                           ),
//                           onChanged:(String value){
//                             setState(() {
//                               _phoneNumber = _phoneController.text;
//                               //print(mobile);
//                             });
//                           },
//                         ),
//                       )
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('      Email ID:  ')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         height: MediaQuery.of(context).size.height*0.05,
//                         child:TextFormField(
//                           controller: _emailController,
//                           //validator: _validateEmail,
//                           style: new TextStyle(color: Colors.black),
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.vertical()
//                             ),
//                           ),
//                           onChanged:(String value){
//                             setState(() {
//                               _email = _emailController.text;
//                               //print(email);
//                             });
//                           },
//                         ),
//                       )
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('Siteplan type:')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         height:MediaQuery.of(context).size.height*0.05,
//                         decoration: ShapeDecoration(
//                           color:Colors.grey[400],
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                                 width: 1.0, style: BorderStyle.solid),
//                             borderRadius: BorderRadius.all(Radius.zero),
//                           ),
//                         ),
//                         child: DropdownButton(
//                           focusColor: Colors.grey,
//                           elevation: 10,
//                           hint: _dropDownValue == null
//                               ? Center(child: Text('Select Type'))
//                               : Center(
//                             child: Text(
//                               _dropDownValue,
//                               style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500),
//                             ),
//                           ),
//                           isExpanded: true,
//                           iconSize: 30.0,
//                           iconEnabledColor:Colors.black,
//                           //style: TextStyle(color: Colors.black),
//                           items: ['Select Type','23 Village', 'Old PMC'].map(
//                                 (val) {
//                               return DropdownMenuItem<String>(
//                                 value: val,
//                                 child: Text(val),
//                               );
//                             },
//                           ).toList(),
//                           onChanged: (String val) {
//                             setState(
//                                   () {
//                                 _dropDownValue = val;
//                                 getVillages(_dropDownValue);
//                                 villageitems.clear();
//                                 print(_dropDownValue);
//                               },
//                             );
//                           },
//                         ),
//                       )
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('Village name:')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                     flex: 1,
//                     child:  Container(
//                       height:MediaQuery.of(context).size.height*0.05,
//                       width:MediaQuery.of(context).size.height*0.40,
//                       decoration: ShapeDecoration(
//                         color:Colors.grey[400],
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                               width: 1.0, style: BorderStyle.solid),
//                           borderRadius: BorderRadius.all(Radius.zero),
//                         ),
//                       ),
//                       child: DropdownButton(
//                         elevation: 10,
//                         hint:Center(child: Text('Select Village')),
//                         value: selectval,
//                         isExpanded: true,
//                         iconSize: 30.0,
//                         iconEnabledColor:Colors.black,
//                         //style: TextStyle(color: Colors.black),
//                         onChanged: (value){
//                           setState(() {
//                             selectval = value.toString();
//                             getsurveyno(_dropDownValue,selectval);
//                             surveyitems.clear();
//                           });
//                         },
//                         items: villageitems.map((itemone){
//                           return DropdownMenuItem(
//                               value: itemone,
//                               child: Center(child: Text(itemone,style: TextStyle(color: Colors.black)))
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                       flex: 1,
//                       child: Text('Sr.No/F.P No/\nTPS No:')
//                   ),
//                   SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                   Flexible(
//                     flex: 1,
//                     child:  Container(
//                       height:MediaQuery.of(context).size.height*0.05,
//                       width:MediaQuery.of(context).size.height*0.40,
//                       decoration: ShapeDecoration(
//                         color:Colors.grey[400],
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                               width: 1.0, style: BorderStyle.solid),
//                           borderRadius: BorderRadius.all(Radius.zero),
//                         ),
//                       ),
//                       child: DropdownButton(
//                         elevation: 10,
//                         hint:Center(child: Text('Please Select')),
//                         value: selectedsno,
//                         isExpanded: true,
//                         iconSize: 30.0,
//                         iconEnabledColor:Colors.black,
//                         //style: TextStyle(color: Colors.black),
//                         onChanged: (value){
//                           setState(() {
//                             selectedsno = value.toString();
//                             //surveyitems.clear();
//                           });
//                         },
//                         items: surveyitems.map((itemone){
//                           return DropdownMenuItem(
//                               value: itemone,
//                               child: Center(child: Text(itemone,style: TextStyle(color: Colors.black)))
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//               MaterialButton(
//                   color: Colors.orange,
//                   child: Text('NEXT'),
//                   onPressed:(){
//                     //print(_nameController.text);
//                     if(_name!=null&&_phoneNumber!=null&&_email!=null&&_address!=null&&_dropDownValue!=null&&selectval!=null&&selectedsno!=null){
//                       getPDFlink(_dropDownValue,selectval,selectedsno);
//                     }
//                     else{
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               backgroundColor: Colors.red[100],
//                               title: Text("Enter valid Data"),
//                               content: Text('Name/address/email/Number is invalid'),
//                               actions: <Widget>[
//                                 IconButton(
//                                     icon: Icon(Icons.check,color: Colors.red,),
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     })
//                               ],
//                             );
//                           });
//                     }
//                   }
//               )
//             ],
//           ),
//         ),
//       ),
//       // SingleChildScrollView(
//       //   child: Container(
//       //     margin: EdgeInsets.all(24),
//       //     child: Form(
//       //       key: _formKey,
//       //       child: Column(
//       //         mainAxisAlignment: MainAxisAlignment.center,
//       //         children: <Widget>[
//       //           Container(
//       //             height:MediaQuery.of(context).size.height*0.05,
//       //             child: Row(
//       //              mainAxisAlignment: MainAxisAlignment.center,
//       //              children: [
//       //               Flexible(
//       //                   flex: 1,
//       //                   child: Text('           Name:  ')
//       //               ),
//       //               SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//       //               Flexible(
//       //                   flex: 2,
//       //                   child: _buildName()
//       //               ),
//       //             ],
//       //         ),
//       //           ),
//       //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//       //           Container(
//       //             height:MediaQuery.of(context).size.height*0.05,
//       //             child: Row(
//       //               mainAxisAlignment: MainAxisAlignment.center,
//       //               children: [
//       //                 Flexible(
//       //                     flex: 1,
//       //                     child: Text('       Address: ')
//       //                 ),
//       //                 SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//       //                 Flexible(
//       //                     flex: 2,
//       //                     child: _buildAddress()
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//       //           Container(
//       //             height:MediaQuery.of(context).size.height*0.05,
//       //             child: Row(
//       //               mainAxisAlignment: MainAxisAlignment.center,
//       //               children: [
//       //                 Flexible(
//       //                     flex: 1,
//       //                     child: Text('        Mobile:  ')
//       //                 ),
//       //                 SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//       //                 Flexible(
//       //                     flex: 2,
//       //                     child: _buildPhoneNumber()
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//       //           Container(
//       //             height:MediaQuery.of(context).size.height*0.05,
//       //             child: Row(
//       //               mainAxisAlignment: MainAxisAlignment.center,
//       //               children: [
//       //                 Flexible(
//       //                     flex: 1,
//       //                     child: Text('      Email ID:  ')
//       //                 ),
//       //                 SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//       //                 Flexible(
//       //                     flex: 2,
//       //                     child: _buildEmail()
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//       //           Row(
//       //             mainAxisAlignment: MainAxisAlignment.center,
//       //             children: [
//       //               Flexible(
//       //                   flex: 1,
//       //                   child: Text('Siteplan type:')
//       //               ),
//       //               SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//       //               Flexible(
//       //                   flex: 2,
//       //                   child: Container(
//       //                     height:MediaQuery.of(context).size.height*0.05,
//       //                     decoration: ShapeDecoration(
//       //                       color:Colors.grey[400],
//       //                       shape: RoundedRectangleBorder(
//       //                         side: BorderSide(
//       //                             width: 1.0, style: BorderStyle.solid),
//       //                         borderRadius: BorderRadius.all(Radius.zero),
//       //                       ),
//       //                     ),
//       //                     child: DropdownButton(
//       //                       focusColor: Colors.grey,
//       //                       elevation: 10,
//       //                       hint: _dropDownValue == null
//       //                           ? Center(child: Text('Select Type'))
//       //                           : Center(
//       //                         child: Text(
//       //                           _dropDownValue,
//       //                           style: TextStyle(fontWeight:FontWeight.w500),//color: Colors.black
//       //                         ),
//       //                       ),
//       //                       isExpanded: true,
//       //                       iconSize: 30.0,
//       //                       //style: TextStyle(color: Colors.black),
//       //                       items: ['23 Village', 'Old PMC'].map(
//       //                             (val) {
//       //                           return DropdownMenuItem<String>(
//       //                             value: val,
//       //                             child: Text(val),
//       //                           );
//       //                         },
//       //                       ).toList(),
//       //                       onChanged: (String val) {
//       //                         setState(
//       //                               () {
//       //                             _dropDownValue = val;
//       //                             getVillages(_dropDownValue);
//       //                             villageitems.clear();
//       //                             print(_dropDownValue);
//       //                           },
//       //                         );
//       //                       },
//       //                     ),
//       //                   )
//       //               ),
//       //             ],
//       //           ),
//       //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//       //           Row(
//       //             mainAxisAlignment: MainAxisAlignment.center,
//       //             children: [
//       //               Flexible(
//       //                   flex: 1,
//       //                   child: Text('Village name:')
//       //               ),
//       //               SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//       //               Flexible(
//       //                 flex: 2,
//       //                 child:  Container(
//       //                   height:MediaQuery.of(context).size.height*0.05,
//       //                   width:MediaQuery.of(context).size.height*0.40,
//       //                   decoration: ShapeDecoration(
//       //                     color:Colors.grey[400],
//       //                     shape: RoundedRectangleBorder(
//       //                       side: BorderSide(
//       //                           width: 1.0, style: BorderStyle.solid),
//       //                       borderRadius: BorderRadius.all(Radius.zero),
//       //                     ),
//       //                   ),
//       //                   child: DropdownButton(
//       //                     elevation: 10,
//       //                     hint:Center(child: Text('Select Village')),
//       //                     value: selectval,
//       //                     isExpanded: true,
//       //                     iconSize: 30.0,
//       //                     //style: TextStyle(color: Colors.black),
//       //                     onChanged: (value){
//       //                       setState(() {
//       //                         selectval = value.toString();
//       //                         getsurveyno(_dropDownValue,selectval);
//       //                         surveyitems.clear();
//       //                       });
//       //                     },
//       //                     items: villageitems.map((itemone){
//       //                       return DropdownMenuItem(
//       //                           value: itemone,
//       //                           child: Center(child: Text(itemone))
//       //                       );
//       //                     }).toList(),
//       //                   ),
//       //                 ),
//       //               ),
//       //             ],
//       //           ),
//       //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//       //           Row(
//       //             mainAxisAlignment: MainAxisAlignment.center,
//       //             children: [
//       //               Flexible(
//       //                   flex: 1,
//       //                   child: Text('Sr.No/F.P No/\nTPS No:')
//       //               ),
//       //               SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//       //               Flexible(
//       //                 flex: 2,
//       //                 child:  Container(
//       //                   height:MediaQuery.of(context).size.height*0.05,
//       //                   width:MediaQuery.of(context).size.height*0.40,
//       //                   decoration: ShapeDecoration(
//       //                     color:Colors.grey[400],
//       //                     shape: RoundedRectangleBorder(
//       //                       side: BorderSide(
//       //                           width: 1.0, style: BorderStyle.solid),
//       //                       borderRadius: BorderRadius.all(Radius.zero),
//       //                     ),
//       //                   ),
//       //                   child: DropdownButton(
//       //                     elevation: 10,
//       //                     hint:Center(child: Text('Please Select')),
//       //                     value: selectedsno,
//       //                     isExpanded: true,
//       //                     iconSize: 30.0,
//       //                     //style: TextStyle(color: Colors.black),
//       //                     onChanged: (value){
//       //                       setState(() {
//       //                         selectedsno = value.toString();
//       //                         //surveyitems.clear();
//       //                       });
//       //                     },
//       //                     items: surveyitems.map((itemone){
//       //                       return DropdownMenuItem(
//       //                           value: itemone,
//       //                           child: Center(child: Text(itemone))
//       //                       );
//       //                     }).toList(),
//       //                   ),
//       //                 ),
//       //               ),
//       //             ],
//       //           ),
//       //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//       //           RaisedButton(
//       //             color: Colors.orange,
//       //             child: Text(
//       //               'NEXT',
//       //             ),
//       //             onPressed: () {
//       //               // if (!_formKey.currentState.validate()) {
//       //               //   return;
//       //               // }
//       //               // _formKey.currentState.save();
//       //               // getPDFlink(_dropDownValue,selectval,selectedsno);
//       //               // print(_name);
//       //               // print(_email);
//       //               // print(_phoneNumber);
//       //               // print(_address);
//       //               // print(_dropDownValue);
//       //               // print(selectval);
//       //               // print(selectedsno);
//       //               if(_name!=null&&_dropDownValue!=null&&selectval!=null&&selectedsno!=null){
//       //                 getPDFlink(_dropDownValue,selectval,selectedsno);
//       //               }
//       //               else{
//       //                 showDialog(
//       //                     context: context,
//       //                     builder: (BuildContext context) {
//       //                       return AlertDialog(
//       //                         backgroundColor: Colors.red[100],
//       //                         title: Text("Enter valid Data"),
//       //                         content: Text('Name/address/email/Number is invalid'),
//       //                         actions: <Widget>[
//       //                           IconButton(
//       //                               icon: Icon(Icons.check,color: Colors.red,),
//       //                               onPressed: () {
//       //                                 Navigator.of(context).pop();
//       //                               })
//       //                         ],
//       //                       );
//       //                     });
//       //               }
//       //
//       //             },
//       //           )
//       //         ],
//       //       ),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
//
//   getPDFlink(String dropDownValue, String selectval, String selectsno) async {
//     var data,type,villagecode;
//     print(dropDownValue);
//     print(selectval);
//     print(selectsno);
//     //print(dropDownValue);
//     if(dropDownValue=='Old PMC'){
//       setState(() {
//         villagecode='old_pmc_new';
//         type='2';
//         //selectval="AMBEGAON BK";
//       });
//     }
//     else{
//       setState(() {
//         villagecode='23_village';
//         type='1';
//       });
//       //
//       //selectval='Aundh';
//     }
//     var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/FetchPDFLink.php");
//     var request = new http.MultipartRequest("POST", uri);
//     request.fields['Link_Type'] ='UNSIGNED_PDF';
//     request.fields['Village_Name_Code'] =villagecode;
//     request.fields['S_No'] =selectsno;
//     request.fields['Village_Name'] =selectval;
//     print(villagecode);
//     print(selectval);
//     print(selectsno);
//     print(request);
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       response.stream.transform(utf8.decoder).listen((value) async {
//         data = jsonDecode(value);
//         print(data);
//         if(selectval=='Sadashiv Peth') {
//           data = data.split("Signed").join("Unsigned");
//           var url = data.split(" ").join("%20");
//           print(url);
//           Navigator.push(
//             context,
//             MaterialPageRoute<dynamic>(
//               builder: (_) => PDFViewerFromUrl(
//                   url:'http://${url}',
//                   name:_name,
//                   email:_email,
//                   mobile:_phoneNumber,
//                   address:_address,
//                   village:selectval,
//                   type:type,
//                   surveyNo:selectsno,
//                   Link_Type:'UNSIGNED_PDF',
//                   DP_TABLE_NAME:'SITE_PLAN_PAYMENT_TBL'
//
//               ),
//             ),
//           );
//         }
//         else{
//           Navigator.push(
//             context,
//             MaterialPageRoute<dynamic>(
//               builder: (_) => PDFViewerFromUrl(
//                   url:'http://${data}',
//                   name:_name,
//                   email:_email,
//                   mobile:_phoneNumber,
//                   address:_address,
//                   village:selectval,
//                   type:type,
//                   surveyNo:selectsno,
//                   Link_Type:'UNSIGNED_PDF',
//                   DP_TABLE_NAME:'SITE_PLAN_PAYMENT_TBL'
//
//               ),
//             ),
//           );
//         }
//       });
//     }
//   }
// }

  String _name;
  String _email;
  String _address;
  String _phoneNumber;
  var _dropDownValue;
  List<String> villageitems = [];
  String selectval;
  String selectedsno;
  List<String> surveyitems = [];
  bool _isValidated = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    setPreferences();
    super.initState();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs ;

  setPreferences()async{
    String name,address,phone,email;
    prefs = await _prefs;
    name = await prefs.getString('siteName');
    address = await prefs.getString('siteAddress');
    phone = await prefs.getString('siteMobile');
    email = await prefs.getString('siteEmail');

    print("name : $name \n address : $address \n phone : $phone  \n email : $email ");
    if(name != null){
      setState(() {
        _nameController.text = name;
        _name=name;
      });
    }
    if(address != null){
      setState(() {
        _addressController.text = address;
        _address=address;
      });
    }
    if(phone != null){
      setState(() {
        _phoneController.text = phone;
        _phoneNumber=phone;
      });
    }
    if(email != null){
      setState(() {
        _emailController.text = email;
        _email=email;
      });
    }
  }


  void getVillages(String dropDownValue) async {
    var data,villagenames,type;
    print(dropDownValue);
    if(dropDownValue=='Old PMC'){
      setState(() {
        type='2';
        //selectval='Aundh';
      });
    }
    else{
      setState(() {
        type='1';
        //selectval="AMBEGAON BK";
      });
    }
    print(type);
    var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/getVillages.php");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['TYPE'] =type;
    print(request);
    var response = await request.send();

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) async {
        data = jsonDecode(value);
        setState(() {
          for (var i = 0; i < data.length; i++) {
            villagenames=data[i]['DATA_VALUE'];
            villageitems.add(villagenames);
            //  PolyIdList.add(data[i]['DATA_VALUE']);
            print(villageitems);
          }
        });
      });
    }
  }

  void getsurveyno(String dropDownValue, String selectval) async {
    var data,type,surveyNos;
    //print(dropDownValue);
    if(dropDownValue=='Old PMC'){
      setState(() {
        type='2';
        //selectval="AMBEGAON BK";
      });
    }
    else{
      setState(() {
        type='1';
      });
      //selectval='Aundh';
    }

    print(type);
    print(selectval);
    var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/getsno.php");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['TYPE'] =type;
    request.fields['VILLAGE_NAME'] =selectval;
    print(request);
    var response = await request.send();

    if (response.statusCode == 200) {
      //response.stream.transform(utf8.decoder).listen((value) async {
      response.stream..transform(Utf8Decoder())
          .transform(LineSplitter()).listen((value) async {
        data = jsonDecode(value);
        print(data.length);
        setState(() {
          for (var i = 0; i < data.length; i++) {
            surveyNos=data[i]['DATA_VALUE'];
            surveyitems.add(surveyNos);
            //  PolyIdList.add(data[i]['DATA_VALUE']);
            print(surveyitems);
          }
          //selectedsno=surveyitems[0];
        });
      });
    }
  }

  Widget _buildName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      //autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.vertical()
        ),
        //labelText: 'Name'
      ),
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return 'Name is Required';
      //   }
      //
      //   return null;
      // },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      keyboardType: TextInputType.text,
      // autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.vertical()
        ),
        //labelText: 'Name'
      ),
      //maxLength: 10,
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return 'Address is Required';
      //   }
      //
      //   return null;
      // },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.text,
      // autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.vertical()
        ),
      ),
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return 'Email is Required';
      //   }
      //
      //   if (!RegExp(
      //       r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      //       .hasMatch(value)) {
      //     return 'Please enter a valid email Address';
      //   }
      //
      //   return null;
      // },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      // autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.vertical()
          ),
        ),
        keyboardType: TextInputType.phone,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],
        // validator: (String value) {
        //   String pattern =
        //       r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
        //   RegExp regExp = new RegExp(pattern);
        //   if (value.length == 0) {
        //     return "Number is Required";
        //   } else if (!regExp.hasMatch(value)) {
        //     return "Invalid Number";
        //   } else {
        //     return null;
        //   }
        // },
        onSaved: (String value) {
          _phoneNumber = value;
        }
    );
  }
  nameValidator(name){
    if(name.length<8){
      return 'inValid Name';
    }else{
      return '';
    }

  }
  addressValidator(address){
    if(address.length<8){
      return 'inValid Address';
    }else{
      return '';
    }
  }
  phoneValidator(mobile){
    if(mobile.length<8){
      return 'inValid Phone';
    }else{
      return '';
    }
  }
  emailValidator(email){
    if(email.length<8){
      return 'inValid email';
    }else{
      return '';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Site Plan',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      //backgroundColor:Color(0xfffffab9),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Name')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                          child: TextFormField(
                            validator: (value)=>nameValidator(value),
                            controller: _nameController,
                            //autovalidateMode:AutovalidateMode.always,

                            //style: new TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15),
                              hintText: _isValidated?'Name':'Name is Required',
                              hintStyle: TextStyle(
                                  color: _isValidated?Colors.grey:Colors.red
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical()
                              ),
                            ),
                            onChanged:(String value){
                              setState(() {
                                _name = _nameController.text;
                                //print(name);
                              });
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Address')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.05,
                          child: TextFormField(
                            validator: (value)=>addressValidator(value),
                            //validator: _validateName,
                            controller: _addressController,
                            //style: new TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15),
                              hintText: _isValidated?'Address':'Address is Required',
                              hintStyle: TextStyle(
                                  color: _isValidated?Colors.grey:Colors.red
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical()
                              ),
                            ),
                            onChanged:(String value){
                              setState(() {
                                _address = _addressController.text;
                                //print(address);
                              });
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Mobile')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.05,
                          child: TextFormField(
                            validator: (value)=>phoneValidator(value),
                            controller:_phoneController,
                            //style: new TextStyle(color: Colors.black),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15),
                              hintText: _isValidated?'Mobile':'Mobile is Required',
                              hintStyle: TextStyle(
                                  color: _isValidated?Colors.grey:Colors.red
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical()
                              ),
                            ),
                            onChanged:(String value){
                              setState(() {
                                _phoneNumber = _phoneController.text;
                                //print(mobile);
                              });
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Email ID')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.05,
                          child:TextFormField(
                            controller: _emailController,
                            validator: (value)=>emailValidator(value),
                            //style: new TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15),
                              hintText: _isValidated?'Email ID':'Email ID is Required',
                              hintStyle: TextStyle(
                                  color: _isValidated?Colors.grey:Colors.red
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical()
                              ),
                            ),
                            onChanged:(String value){
                              setState(() {
                                _email = _emailController.text;
                                //print(email);
                              });
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Siteplan type')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Container(
                          height:MediaQuery.of(context).size.height*0.05,
                          decoration: ShapeDecoration(
                            color:Colors.grey[400],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0, style: BorderStyle.solid),
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                          child: DropdownButton(
                            focusColor: Colors.grey,
                            elevation: 10,
                            hint: _dropDownValue == null
                                ? Center(child: Text('Select Type'))
                                : Center(
                              child: Text(
                                _dropDownValue,
                                style: TextStyle(fontWeight:FontWeight.w500),
                              ),
                            ),
                            isExpanded: true,
                            iconSize: 30.0,
                            iconEnabledColor:Colors.black,
                            //style: TextStyle(color: Colors.black),
                            items: ['Select Type','23 Village', 'Old PMC'].map(
                                  (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (String val) {
                              setState(() {
                                if(selectval!=null||selectedsno!=null){
                                  selectval=null;
                                  selectedsno = null;
                                }else{}
                                _dropDownValue = val;
                                getVillages(_dropDownValue);
                                villageitems.clear();
                                print(_dropDownValue);

                              },
                              );
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Village name')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child:  Container(
                        height:MediaQuery.of(context).size.height*0.05,
                        width:MediaQuery.of(context).size.height*0.40,
                        decoration: ShapeDecoration(
                          color:Colors.grey[400],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.zero),
                          ),
                        ),
                        child: DropdownButton(
                          elevation: 10,
                          hint:Center(child: Text('Select Village')),
                          value: selectval,
                          isExpanded: true,
                          iconSize: 30.0,
                          iconEnabledColor:Colors.black,
                          //style: TextStyle(color: Colors.black),
                          onChanged: (value){
                            setState(() {
                              if(selectedsno!=null){
                                selectedsno= null;
                              }
                              selectval = value.toString();
                              getsurveyno(_dropDownValue,selectval);
                              surveyitems.clear();
                            });
                          },
                          items: villageitems.map((itemone){
                            return DropdownMenuItem(
                                value: itemone,
                                child: Center(child: Text(itemone))
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Sr.No/F.P No/\nTPS No')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child:  Container(
                        height:MediaQuery.of(context).size.height*0.05,
                        width:MediaQuery.of(context).size.height*0.40,
                        decoration: ShapeDecoration(
                          color:Colors.grey[400],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.zero),
                          ),
                        ),
                        child: DropdownButton(
                          elevation: 10,
                          hint:Center(child: Text('Please Select')),
                          value: selectedsno,
                          isExpanded: true,
                          iconSize: 30.0,
                          iconEnabledColor:Colors.black,
                          //style: TextStyle(color: Colors.black),
                          onChanged: (value){
                            setState(() {
                              selectedsno = value.toString();
                              //surveyitems.clear();
                            });
                          },
                          items: surveyitems.map((itemone){
                            return DropdownMenuItem(
                                value: itemone,
                                child: Center(child: Text(itemone))
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                MaterialButton(
                    color: Colors.orange,

                    child: Text('NEXT'),
                    onPressed:(){
                      //print(_nameController.text);
                      if(_name!=null&&_phoneNumber!=null&&_email!=null&&_address!=null&&_dropDownValue!=null&&selectval!=null&&selectedsno!=null){
                        getPDFlink(_dropDownValue,selectval,selectedsno);
                      }
                      else{
                        setState(() {
                          _isValidated = false;
                        });
                        /*showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.red[100],
                                title: Text("Enter valid Data"),
                                content: Text('Name/address/email/Number is invalid'),
                                actions: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.check,color: Colors.red,),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      })
                                ],
                              );
                            });*/
                      }
                    }
                )
              ],
            ),
          ),
        ),
      ),
      // SingleChildScrollView(
      //   child: Container(
      //     margin: EdgeInsets.all(24),
      //     child: Form(
      //       key: _formKey,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Container(
      //             height:MediaQuery.of(context).size.height*0.05,
      //             child: Row(
      //              mainAxisAlignment: MainAxisAlignment.center,
      //              children: [
      //               Flexible(
      //                   flex: 1,
      //                   child: Text('           Name:  ')
      //               ),
      //               SizedBox(width:MediaQuery.of(context).size.width*0.02,),
      //               Flexible(
      //                   flex: 2,
      //                   child: _buildName()
      //               ),
      //             ],
      //         ),
      //           ),
      //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //           Container(
      //             height:MediaQuery.of(context).size.height*0.05,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Flexible(
      //                     flex: 1,
      //                     child: Text('       Address: ')
      //                 ),
      //                 SizedBox(width:MediaQuery.of(context).size.width*0.02,),
      //                 Flexible(
      //                     flex: 2,
      //                     child: _buildAddress()
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //           Container(
      //             height:MediaQuery.of(context).size.height*0.05,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Flexible(
      //                     flex: 1,
      //                     child: Text('        Mobile:  ')
      //                 ),
      //                 SizedBox(width:MediaQuery.of(context).size.width*0.02,),
      //                 Flexible(
      //                     flex: 2,
      //                     child: _buildPhoneNumber()
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //           Container(
      //             height:MediaQuery.of(context).size.height*0.05,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Flexible(
      //                     flex: 1,
      //                     child: Text('      Email ID:  ')
      //                 ),
      //                 SizedBox(width:MediaQuery.of(context).size.width*0.02,),
      //                 Flexible(
      //                     flex: 2,
      //                     child: _buildEmail()
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Flexible(
      //                   flex: 1,
      //                   child: Text('Siteplan type:')
      //               ),
      //               SizedBox(width:MediaQuery.of(context).size.width*0.02,),
      //               Flexible(
      //                   flex: 2,
      //                   child: Container(
      //                     height:MediaQuery.of(context).size.height*0.05,
      //                     decoration: ShapeDecoration(
      //                       color:Colors.grey[400],
      //                       shape: RoundedRectangleBorder(
      //                         side: BorderSide(
      //                             width: 1.0, style: BorderStyle.solid),
      //                         borderRadius: BorderRadius.all(Radius.zero),
      //                       ),
      //                     ),
      //                     child: DropdownButton(
      //                       focusColor: Colors.grey,
      //                       elevation: 10,
      //                       hint: _dropDownValue == null
      //                           ? Center(child: Text('Select Type'))
      //                           : Center(
      //                         child: Text(
      //                           _dropDownValue,
      //                           style: TextStyle(fontWeight:FontWeight.w500),//color: Colors.black
      //                         ),
      //                       ),
      //                       isExpanded: true,
      //                       iconSize: 30.0,
      //                       //style: TextStyle(color: Colors.black),
      //                       items: ['23 Village', 'Old PMC'].map(
      //                             (val) {
      //                           return DropdownMenuItem<String>(
      //                             value: val,
      //                             child: Text(val),
      //                           );
      //                         },
      //                       ).toList(),
      //                       onChanged: (String val) {
      //                         setState(
      //                               () {
      //                             _dropDownValue = val;
      //                             getVillages(_dropDownValue);
      //                             villageitems.clear();
      //                             print(_dropDownValue);
      //                           },
      //                         );
      //                       },
      //                     ),
      //                   )
      //               ),
      //             ],
      //           ),
      //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Flexible(
      //                   flex: 1,
      //                   child: Text('Village name:')
      //               ),
      //               SizedBox(width:MediaQuery.of(context).size.width*0.02,),
      //               Flexible(
      //                 flex: 2,
      //                 child:  Container(
      //                   height:MediaQuery.of(context).size.height*0.05,
      //                   width:MediaQuery.of(context).size.height*0.40,
      //                   decoration: ShapeDecoration(
      //                     color:Colors.grey[400],
      //                     shape: RoundedRectangleBorder(
      //                       side: BorderSide(
      //                           width: 1.0, style: BorderStyle.solid),
      //                       borderRadius: BorderRadius.all(Radius.zero),
      //                     ),
      //                   ),
      //                   child: DropdownButton(
      //                     elevation: 10,
      //                     hint:Center(child: Text('Select Village')),
      //                     value: selectval,
      //                     isExpanded: true,
      //                     iconSize: 30.0,
      //                     //style: TextStyle(color: Colors.black),
      //                     onChanged: (value){
      //                       setState(() {
      //                         selectval = value.toString();
      //                         getsurveyno(_dropDownValue,selectval);
      //                         surveyitems.clear();
      //                       });
      //                     },
      //                     items: villageitems.map((itemone){
      //                       return DropdownMenuItem(
      //                           value: itemone,
      //                           child: Center(child: Text(itemone))
      //                       );
      //                     }).toList(),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Flexible(
      //                   flex: 1,
      //                   child: Text('Sr.No/F.P No/\nTPS No:')
      //               ),
      //               SizedBox(width:MediaQuery.of(context).size.width*0.02,),
      //               Flexible(
      //                 flex: 2,
      //                 child:  Container(
      //                   height:MediaQuery.of(context).size.height*0.05,
      //                   width:MediaQuery.of(context).size.height*0.40,
      //                   decoration: ShapeDecoration(
      //                     color:Colors.grey[400],
      //                     shape: RoundedRectangleBorder(
      //                       side: BorderSide(
      //                           width: 1.0, style: BorderStyle.solid),
      //                       borderRadius: BorderRadius.all(Radius.zero),
      //                     ),
      //                   ),
      //                   child: DropdownButton(
      //                     elevation: 10,
      //                     hint:Center(child: Text('Please Select')),
      //                     value: selectedsno,
      //                     isExpanded: true,
      //                     iconSize: 30.0,
      //                     //style: TextStyle(color: Colors.black),
      //                     onChanged: (value){
      //                       setState(() {
      //                         selectedsno = value.toString();
      //                         //surveyitems.clear();
      //                       });
      //                     },
      //                     items: surveyitems.map((itemone){
      //                       return DropdownMenuItem(
      //                           value: itemone,
      //                           child: Center(child: Text(itemone))
      //                       );
      //                     }).toList(),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(height:MediaQuery.of(context).size.height*0.015,),
      //           RaisedButton(
      //             color: Colors.orange,
      //             child: Text(
      //               'NEXT',
      //             ),
      //             onPressed: () {
      //               // if (!_formKey.currentState.validate()) {
      //               //   return;
      //               // }
      //               // _formKey.currentState.save();
      //               // getPDFlink(_dropDownValue,selectval,selectedsno);
      //               // print(_name);
      //               // print(_email);
      //               // print(_phoneNumber);
      //               // print(_address);
      //               // print(_dropDownValue);
      //               // print(selectval);
      //               // print(selectedsno);
      //               if(_name!=null&&_dropDownValue!=null&&selectval!=null&&selectedsno!=null){
      //                 getPDFlink(_dropDownValue,selectval,selectedsno);
      //               }
      //               else{
      //                 showDialog(
      //                     context: context,
      //                     builder: (BuildContext context) {
      //                       return AlertDialog(
      //                         backgroundColor: Colors.red[100],
      //                         title: Text("Enter valid Data"),
      //                         content: Text('Name/address/email/Number is invalid'),
      //                         actions: <Widget>[
      //                           IconButton(
      //                               icon: Icon(Icons.check,color: Colors.red,),
      //                               onPressed: () {
      //                                 Navigator.of(context).pop();
      //                               })
      //                         ],
      //                       );
      //                     });
      //               }
      //
      //             },
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  getPDFlink(String dropDownValue, String selectval, String selectsno) async {
    var data,type,villagecode;
    // print(dropDownValue);
    // print(selectval);
    // print(selectsno);
    //print(dropDownValue);
    print('nameController ${_nameController.text} addressController ${_addressController.text} phone ${_phoneController.text} email ${_emailController.text}');
    await prefs.setString('siteName', _nameController.text);
    await prefs.setString('siteAddress', _addressController.text);
    await prefs.setString('siteMobile', _phoneController.text);
    await prefs.setString('siteEmail', _emailController.text);
    if(dropDownValue=='Old PMC'){
      setState(() {
        villagecode='old_pmc_new';
        type='2';
        //selectval="AMBEGAON BK";
      });
    }
    else{
      setState(() {
        villagecode='23_village';
        type='1';
      });
      //
      //selectval='Aundh';
    }
    var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/FetchPDFLink.php");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['Link_Type'] ='UNSIGNED_PDF';
    request.fields['Village_Name_Code'] =villagecode;
    request.fields['S_No'] =selectsno;
    request.fields['Village_Name'] =selectval;
    print(villagecode);
    print(selectval);
    print(selectsno);
    print(request);
    var response = await request.send();

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) async {
      //response.stream.transform(utf8.decoder).transform(json.decoder).listen((value) async {
        data = jsonDecode(value);
        print('url:'+data);
        if(selectval=='Sadashiv Peth'|| selectval=='Hadapsar') {
          data = data.split("Signed").join("Unsigned");
          var url = data.split(" ").join("%20");
          print(url);
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (_) => PDFViewerFromUrl(
                  url:'http://${url}',
                  name:_name,
                  email:_email,
                  mobile:_phoneNumber,
                  address:_address,
                  village:selectval,
                  type:type,
                  surveyNo:selectsno,
                  Link_Type:'UNSIGNED_PDF',
                  DP_TABLE_NAME:'SITE_PLAN_PAYMENT_TBL'

              ),
            ),
          );
        }
        else{
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (_) => PDFViewerFromUrl(
                  url:'http://${data}',
                  name:_name,
                  email:_email,
                  mobile:_phoneNumber,
                  address:_address,
                  village:selectval,
                  type:type,
                  surveyNo:selectsno,
                  Link_Type:'UNSIGNED_PDF',
                  DP_TABLE_NAME:'SITE_PLAN_PAYMENT_TBL'

              ),
            ),
          );
        }
      });
    }
  }
}

