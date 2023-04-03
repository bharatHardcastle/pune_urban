import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pune_urban/Screens/DevelopmentPlan/Zone_certificate/zone_http_post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../../WebViews/PaymentGateway.dart';
import 'ZonePdf_webview.dart';

class ZoneCertificate extends StatefulWidget {
  const ZoneCertificate({Key key}) : super(key: key);

  @override
  State<ZoneCertificate> createState() => _ZoneCertificateState();
}

class _ZoneCertificateState extends State<ZoneCertificate> {
//   var _dropDownValue;
//   List<String> villageitems = [];
//   String selectval;
//   String selectedsno;
//   List<String> surveyitems = [];
//   String name,address,mobile,email;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _emailController = TextEditingController();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//
//
//   void getVillages(String dropDownValue) async {
//     var data,villagenames,type;
//     print(dropDownValue);
//     if(dropDownValue=='Old PMC'){
//       setState(() {
//         type='2';
//         selectval='Aundh';
//       });
//     }
//     else{
//       setState(() {
//         type='1';
//         selectval="AMBEGAON BK";
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
//         //print(data[0]['DATA_VALUE']);
//         // var dataValue = data["DATA_VALUE"];
//         // print(dataValue);
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
//           selectedsno=surveyitems[0];
//         });
//       });
//     }
//   }
//
//   void getPDFlink(String dropDownValue, String selectval, String selectsno, String name, String address) async {
//     var data,type,villagecode;
//     //print(dropDownValue);
//     var DP_TABLE_NAME="SITE_PLAN_PAYMENT_TBL";
//     var Link_Type="UNSIGNED_PDF";
//     if(dropDownValue=='Old PMC'){
//       setState(() {
//         type='2';
//       });
//     }
//     else{
//       setState(() {
//         type='1';
//       });
//     }
//     Navigator.push(
//       context,
//       MaterialPageRoute<dynamic>(
//         builder: (_) => zone_http_post(name:name,email:email,mobile:mobile,village:selectval,type:type,surveyNo:selectsno,address:address,Link_Type:Link_Type,DP_TABLE_NAME:DP_TABLE_NAME)//ZonePdf(path:'http://115.124.127.208/PHP/PMC/api_beta/zone/generate_zone_cert1_unsigned.php?&TYPE=${type}&VILLAGE_NAME=${selectval}&SURVEY_NO=${selectedsno}&APPLICANT_NAME=${name}&CHALLAN_NO=&ADDRESS=${address}')//(name:name,village:selectval,type:type,surveyNo:selectsno,address:address),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text('Zone Plan',style: TextStyle(color: Colors.black)
//         ),
//         //automaticallyImplyLeading: false,
//         iconTheme:IconThemeData(color: Colors.black),
//         backgroundColor: Color(0xFFF8D882),
//         elevation: 0.0,
//       ),
//       //backgroundColor:Color(0xfffffab9),
//       body:Padding(
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
//                               name = _nameController.text;
//                               print(name);
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
//                               address = _addressController.text;
//                               print(address);
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
//                               mobile = _phoneController.text;
//                               print(mobile);
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
//                               email = _emailController.text;
//                               print(email);
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
//                   child: Text('PAY'),
//                   onPressed:(){
//                     //print(_nameController.text);
//                     if(name!=null&&_dropDownValue!=null&&selectval!=null&&selectedsno!=null){
//                       getPDFlink(_dropDownValue,selectval,selectedsno,name,address);
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
//     );
//   }
// }

  var _dropDownValue;
  List<String> villageitems = [];
  String selectval;
  String selectedsno;
  bool _isValidated = true;
  List<String> surveyitems = [];
  String name,address,mobile,email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs ;

  setPreferences()async{
    String _name,_address,_phone,_email,type,survey,village;
    prefs = await _prefs;
    _name = await prefs.getString('zoneName');
    _address = await prefs.getString('zoneAddress');
    _phone = await prefs.getString('zoneMobile');
    _email = await prefs.getString('zoneEmail');

    print("name : $_name \n address : $_address \n phone : $_phone  \n email : $_email ");
    if(_name != null){
      setState(() {
        _nameController.text = _name;
        name=_name;
      });
    }
    if(_address != null){
      setState(() {
        _addressController.text = _address;
        address=_address;
      });
    }
    if(_phone != null){
      setState(() {
        _phoneController.text = _phone;
        mobile=_phone;
      });
    }
    if(_email != null){
      setState(() {
        _emailController.text = _email;
        email=_email;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    setPreferences();
    super.initState();
  }



  void getVillages(String dropDownValue) async {
    var data,villagenames,type;
    print(dropDownValue);
    if(dropDownValue=='Old PMC'){
      setState(() {
        type='2';
        selectval='Aundh';
      });
    }
    else{
      setState(() {

        type='1';
        selectval="AMBEGAON BK";
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
        //print(data[0]['DATA_VALUE']);
        // var dataValue = data["DATA_VALUE"];
        // print(dataValue);
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
    print(dropDownValue);
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
        setState(() {
          for (var i = 0; i < data.length; i++) {
            surveyNos=data[i]['DATA_VALUE'];
            surveyitems.add(surveyNos);
            //  PolyIdList.add(data[i]['DATA_VALUE']);
            // print(surveyitems);
          }
          selectedsno=surveyitems[0];
        });
      });
    }
  }

  void getPDFlink(String dropDownValue, String selectval, String selectsno, String name, String address) async {
    var data,type,villagecode;
    //print(dropDownValue);
    //final prefs = await _prefs;
    print('nameController ${_nameController.text} addressController ${_addressController.text} phone ${_phoneController.text} email ${_emailController.text}');
    await prefs.setString('zoneName', _nameController.text);
    await prefs.setString('zoneAddress', _addressController.text);
    await prefs.setString('zoneMobile', _phoneController.text);
    await prefs.setString('zoneEmail', _emailController.text);
    var DP_TABLE_NAME="SITE_PLAN_PAYMENT_TBL";
    var Link_Type="UNSIGNED_PDF";
    if(dropDownValue=='Old PMC'){
      setState(() {
        type='2';
      });
    }
    else{
      setState(() {
        type='1';
      });
    }
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
          builder: (_) => zone_http_post(name:name,email:email,mobile:mobile,village:selectval,type:type,surveyNo:selectsno,address:address,Link_Type:Link_Type,DP_TABLE_NAME:DP_TABLE_NAME)//ZonePdf(path:'http://115.124.127.208/PHP/PMC/api_beta/zone/generate_zone_cert1_unsigned.php?&TYPE=${type}&VILLAGE_NAME=${selectval}&SURVEY_NO=${selectedsno}&APPLICANT_NAME=${name}&CHALLAN_NO=&ADDRESS=${address}')//(name:name,village:selectval,type:type,surveyNo:selectsno,address:address),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Zone Plan',style: TextStyle(color: Colors.black)
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFF8D882),
        elevation: 0.0,
      ),
      //backgroundColor:Color(0xfffffab9),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.05,
                          child: TextFormField(
                            controller: _nameController,
                            autovalidateMode:AutovalidateMode.always,
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
                                name = _nameController.text;
                                print(name);
                              });
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                address = _addressController.text;
                                print(address);
                              });
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                mobile = _phoneController.text;
                                print(mobile);
                              });
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            //validator: _validateEmail,
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
                                email = _emailController.text;
                                print(email);
                              });
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              setState(
                                    () {
                                  _dropDownValue = val;
                                  getVillages(_dropDownValue);
                                  villageitems.clear();
                                  //print(_dropDownValue);
                                  //print(_dropDownValue);
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Village')
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Text('PAY'),
                    onPressed:(){
                      //print(_nameController.text);
                      if(name!=null&&_dropDownValue!=null&&selectval!=null&&selectedsno!=null){
                        getPDFlink(_dropDownValue,selectval,selectedsno,name,address);
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
    );
  }
}

