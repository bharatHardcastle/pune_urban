import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class SitePlanIssue extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SitePlanIssueState();
  }
}

class SitePlanIssueState extends State<SitePlanIssue> {

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   int _radioSelected1=1;
//   String _name;
//   String _email;
//   String _village;
//   String _phoneNumber;
//   String _surveyno;
//   String _challanNo;
//   String _comments;
//   var issue;
//   bool _isDataUploaded = false;
//
//   Widget _buildName() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       //autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//         ),
//         //labelText: 'Name'
//       ),
//       //maxLength: 10,
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Name is Required';
//         }
//
//         return null;
//       },
//       onSaved: (String value) {
//         _name = value;
//       },
//     );
//   }
//
//   Widget _buildAddress() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       //autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//         ),
//         //labelText: 'Name'
//       ),
//       //maxLength: 10,
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Village is Required';
//         }
//
//         return null;
//       },
//       onSaved: (String value) {
//         _village = value;
//       },
//     );
//   }
//
//   Widget _buildSurveyNo() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       //autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//         ),
//         //labelText: 'Name'
//       ),
//       //maxLength: 10,
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Survey No is Required';
//         }
//
//         return null;
//       },
//       onSaved: (String value) {
//         _surveyno = value;
//       },
//     );
//   }
//
//   Widget _buildChallanNo() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       //autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//         ),
//         //labelText: 'Name'
//       ),
//       //maxLength: 10,
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Challan No is Required';
//         }
//
//         return null;
//       },
//       onSaved: (String value) {
//         _challanNo = value;
//       },
//     );
//   }
//
//   Widget _buildEmail() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       //autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//         ),
//       ),
//       validator: (String value) {
//         if (value.isEmpty) {
//           return 'Email is Required';
//         }
//
//         if (!RegExp(
//             r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//             .hasMatch(value)) {
//           return 'Please enter a valid email Address';
//         }
//
//         return null;
//       },
//       onSaved: (String value) {
//         _email = value;
//       },
//     );
//   }
//
//   Widget _buildPhoneNumber() {
//     return TextFormField(
//         //autovalidateMode: AutovalidateMode.always,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.vertical()
//           ),
//         ),
//         keyboardType: TextInputType.phone,
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(10),
//         ],
//         validator: (String value) {
//           String pattern =
//               r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
//           RegExp regExp = new RegExp(pattern);
//           if (value.length == 0) {
//             return "Number is Required";
//           } else if (!regExp.hasMatch(value)) {
//             return "Invalid Number";
//           } else {
//             return null;
//           }
//         },
//         onSaved: (String value) {
//           _phoneNumber = value;
//         }
//     );
//   }
//
//   Widget _buildComments() {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       //autovalidateMode: AutovalidateMode.always,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.vertical()
//         ),
//         //labelText: 'Name'
//       ),
//       onSaved: (String value) {
//         _comments = value;
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Report Certificate Issue',
//           style: TextStyle(color: Colors.black),
//         ),
//         //automaticallyImplyLeading: false,
//         iconTheme:IconThemeData(color: Colors.black),
//         backgroundColor:Color(0xFFF8D882),
//         elevation: 0.0,
//       ),
//       //backgroundColor:Color(0xfffffab9),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.all(24),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                         flex: 1,
//                         child: Text('           Name:  ')
//                     ),
//                     SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                     Flexible(
//                         flex: 2,
//                         child: _buildName()
//                     ),
//                   ],
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                         flex: 1,
//                         child: Text('      Email ID:  ')
//                     ),
//                     SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                     Flexible(
//                         flex: 2,
//                         child: _buildEmail()
//                     ),
//                   ],
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                         flex: 1,
//                         child: Text('        Mobile:  ')
//                     ),
//                     SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                     Flexible(
//                         flex: 2,
//                         child: _buildPhoneNumber()
//                     ),
//                   ],
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                         flex: 1,
//                         child: Text('Village Name:')
//                     ),
//                     SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                     Flexible(
//                         flex: 2,
//                         child: _buildAddress()
//                     ),
//                   ],
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                         flex: 1,
//                         child: Text('    Survey No: ')
//                     ),
//                     SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                     Flexible(
//                         flex: 2,
//                         child: _buildSurveyNo()
//                     ),
//                   ],
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                         flex: 1,
//                         child: Text('Payment\nReference\nNo/Challan No:')
//                     ),
//                     SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                     Flexible(
//                         flex: 2,
//                         child: _buildChallanNo()
//                     ),
//                   ],
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 Text('Types Of Issues:',style: TextStyle(fontSize:20.0),),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     //crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Radio(
//                         value: 1,
//                         groupValue: _radioSelected1,
//                         activeColor: Colors.orangeAccent,
//                         onChanged: (value) {
//                           setState(() {
//                             _radioSelected1 = value as int;
//                             // _radioVal1 = 'Normal';
//                             issue='Payment Related';
//                             //print(expert);
//                           });
//                         },
//                       ),
//                       const Text("Payment Related"),
//                       SizedBox(width:MediaQuery.of(context).size.width*0.2,),
//                       Radio(
//                         value: 2,
//                         groupValue: _radioSelected1,
//                         activeColor: Colors.orangeAccent,
//                         onChanged: (value) {
//                           setState(() {
//                             _radioSelected1 = value as int;
//                             // _radioVal1 = 'Normal';
//                             issue='Site Plan/Zone Certificate';
//                           });
//                         },
//                       ),
//                       const Text("Site Plan/Zone Certificate"),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     //crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Radio(
//                         value: 3,
//                         groupValue: _radioSelected1,
//                         activeColor: Colors.orangeAccent,
//                         onChanged: (value) {
//                           setState(() {
//                             _radioSelected1 = value as int;
//                             // _radioVal1 = 'Normal';
//                             issue='PDF not visible';
//                           });
//                         },
//                       ),
//                       const Text("PDF not visible"),
//                       SizedBox(width:MediaQuery.of(context).size.width*0.13,),
//                       Radio(
//                         value: 4,
//                         groupValue: _radioSelected1,
//                         activeColor: Colors.orangeAccent,
//                         onChanged: (value) {
//                           setState(() {
//                             _radioSelected1 = value as int;
//                             // _radioVal1 = 'Normal';
//                             issue='Wrong Certificate Generated';
//                           });
//                         },
//                       ),
//                       const Text("Wrong Certificate Generated"),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 Row(
//                   //crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Radio(
//                       value: 5,
//                       groupValue: _radioSelected1,
//                       activeColor: Colors.orangeAccent,
//                       onChanged: (value) {
//                         setState(() {
//                           _radioSelected1 = value as int;
//                           // _radioVal1 = 'Normal';
//                           issue='Other';
//                         });
//                       },
//                     ),
//                     const Text("Other"),
//                   ],
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Flexible(
//                         flex: 1,
//                         child: Text('Comments:')
//                     ),
//                     SizedBox(width:MediaQuery.of(context).size.width*0.02,),
//                     Flexible(
//                         flex: 2,
//                         child: _buildComments()
//                     ),
//                   ],
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height*0.015,),
//                 RaisedButton(
//                   color: Colors.orange,
//                   child: Text(
//                     'SUBMIT',
//                   ),
//                   onPressed: () {
//                     if (!_formKey.currentState.validate()) {
//                       return;
//                     }
//                     _formKey.currentState.save();
//                     _uploadata();
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   _uploadata() async {
//     var data;
//     print(_name+_email+_phoneNumber+_village+_surveyno+_challanNo+issue+_comments);
//     var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/report_issue.php");
//     var request = new http.MultipartRequest("POST", uri);
//     request.fields['NAME'] =_name;
//     request.fields['EMAIL_ID'] =_email;
//     request.fields['PHONE_NO'] =_phoneNumber.toString();
//     request.fields['VILLAGE_NAME'] =_village;
//     request.fields['SURVEY_NO'] =_surveyno.toString();
//     request.fields['CHALLAN_NO'] =_challanNo;
//     request.fields['ISSUE_TYPE'] =issue;
//     request.fields['COMMENT'] =_comments;
//
//     var response = await request.send();
//     print(request);
//
//     if (response.statusCode == 200) {
//       response.stream.transform(utf8.decoder).listen((value) async {
//         data = value;
//         print(data);
//         if (data== "Inserted Successfully") {
//           setState(() {
//             _isDataUploaded = false;
//           });
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   backgroundColor: Colors.teal[100],
//                   title: Text("SUCCESS"),
//                   content: Text(
//                       "Data Uploaded Sucessfully"),
//                   actions: <Widget>[
//                     IconButton(
//                         icon: Icon(Icons.check),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                           Navigator.of(context).pop();
//                         })
//                   ],
//                 );
//               });
//         } else {
//           setState(() {
//             _isDataUploaded = false;
//           });
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   backgroundColor: Colors.red[100],
//                   title: Text("Failed"),
//                   content:
//                   Text("Please check your internet connection and Retry"),
//                   actions: <Widget>[
//                     IconButton(
//                         icon: Icon(Icons.check),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         })
//                   ],
//                 );
//               });
//         }
//       });
//     }
//   }
// }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _radioSelected1=1;
  String _name;
  String _nameHint= 'Name';

  String _email;
  String _emailHint='Email';
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _villageController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _surveynoController = new TextEditingController();
  TextEditingController _challanNoController = new TextEditingController();
  TextEditingController _commentsController = new TextEditingController();
  String _village;
  String _villageHint = 'Village';
  bool _isValidated = true;
  String _phoneNumber;
  String _phoneNumberHint = 'Phone Number';
  String _surveyno;
  String _surveynoHint = 'Survey No.';
  String _challanNo;
  String _challanNoHint = 'Challan No.';
  String _comments;
  String _commentsHint = 'Comments';
  var issue;
  bool _isDataUploaded = false;

  Widget _buildName() {
    return SizedBox(
      height: height(context)*0.07,
      child: TextFormField(
        keyboardType: TextInputType.text,
        //autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
          //isDense: true,
          hintText: _nameHint,
          hintStyle: TextStyle(
              color: _isValidated?Colors.grey:Colors.red
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.vertical()
          ),
          //labelText: 'Name'
        ),
        //maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            setState(() {
              _nameHint = 'Name is required';
            });
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      ),
    );
  }

  Widget _buildAddress() {
    return SizedBox(
      height: height(context)*0.07,
      child: TextFormField(
        controller: _villageController,
        keyboardType: TextInputType.text,
        //autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
          //isDense: true,
          hintText: _villageHint,
          hintStyle: TextStyle(
              color: _isValidated?Colors.grey:Colors.red
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.vertical()
          ),
          //labelText: 'Name'
        ),
        //maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            setState(() {
              _villageHint = 'Village is Required';
            });
            return null;
          }

          return null;
        },
        onSaved: (String value) {
          _village = value;
        },
      ),
    );
  }

  Widget _buildSurveyNo() {
    return SizedBox(
      height: height(context)*0.07,
      child: TextFormField(
        controller: _surveynoController,
        keyboardType: TextInputType.text,
        //autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
          //isDense: true,
          hintText: _surveynoHint,
          hintStyle: TextStyle(
              color: _isValidated?Colors.grey:Colors.red
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.vertical()
          ),
          //labelText: 'Name'
        ),
        //maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            setState(() {
              _surveynoHint = 'Survey No is Required';
            });
            return null;
          }

          return null;
        },
        onSaved: (String value) {
          _surveyno = value;
        },
      ),
    );
  }

  Widget _buildChallanNo() {
    return SizedBox(
      height: height(context)*0.07,
      child: TextFormField(
        controller: _challanNoController,
        keyboardType: TextInputType.text,
        //autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
          //isDense: true,
          hintText: _challanNoHint,
          hintStyle: TextStyle(
              color: _isValidated?Colors.grey:Colors.red
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.vertical()
          ),
          //labelText: 'Name'
        ),
        //maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            _challanNoHint = 'Challan No is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _challanNo = value;
        },
      ),
    );
  }

  Widget _buildEmail() {
    return SizedBox(
      height: height(context)*0.07,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.text,
        //autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
          //isDense: true,
          hintText: _emailHint,
          hintStyle: TextStyle(
              color: _isValidated?Colors.grey:Colors.red
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.vertical()
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            setState(() {
              _emailHint = 'Email is Required';
            });
            return null;
          }

          if (!RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            setState(() {
              _emailController.text = '';
              _emailHint = 'Please enter a valid email Address';
            });
            return null;
          }

          return null;
        },
        onSaved: (String value) {
          _email = value;
        },
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return SizedBox(
      height: height(context)*0.06  ,
      child: TextFormField(
          controller: _phoneNumberController,
          //autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
            //isDense: true,
            hintText: _phoneNumberHint,
            hintStyle: TextStyle(
                color: _isValidated?Colors.grey:Colors.red
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.vertical()
            ),
          ),
          keyboardType: TextInputType.phone,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
          ],
          validator: (String value) {
            String pattern =
                r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
            RegExp regExp = new RegExp(pattern);
            if (value.length == 0) {
              setState(() {
                _phoneNumberHint = "Phone Number is required";
              });
              return null;
            } else if (!regExp.hasMatch(value)) {
              setState(() {
                _phoneNumberController.text= '';
                _phoneNumberHint = "Invalid Number";
              });
              return null;
            } else {
              return null;
            }
          },
          onSaved: (String value) {
            _phoneNumber = value;
          }
      ),
    );
  }

  Widget _buildComments() {
    return SizedBox(
      height: height(context)*0.05,
      child: TextFormField(
        controller: _commentsController,
        keyboardType: TextInputType.text,
        //autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          hintText: _commentsHint,
          hintStyle: TextStyle(
              color: _isValidated?Colors.grey:Colors.red
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.vertical()
          ),
          //labelText: 'Name'
        ),
        onSaved: (String value) {
          _comments = value;
        },
        validator: (String value) {
          if (value.isEmpty) {
            _commentsHint = 'Comment is Required';
            return null;
          }

          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Report Certificate Issue',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      //backgroundColor:Color(0xfffffab9),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                        flex: 2,
                        child: _buildName()
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
                        flex: 2,
                        child: _buildEmail()
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
                        flex: 2,
                        child: _buildPhoneNumber()
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Village Name')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: _buildAddress()
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Survey No')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: _buildSurveyNo()
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Payment\nReference\nNo/Challan No:')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: _buildChallanNo()
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Text('Types Of Issues:',style: TextStyle(fontSize:20.0),),
                //SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _radioSelected1,
                        activeColor: Colors.orangeAccent,
                        onChanged: (value) {
                          setState(() {
                            _radioSelected1 = value as int;
                            // _radioVal1 = 'Normal';
                            issue='Payment Related';
                            //print(expert);
                          });
                        },
                      ),
                      const Text("Payment Related"),
                      SizedBox(width:MediaQuery.of(context).size.width*0.2,),
                      Radio(
                        value: 2,
                        groupValue: _radioSelected1,
                        activeColor: Colors.orangeAccent,
                        onChanged: (value) {
                          setState(() {
                            _radioSelected1 = value as int;
                            // _radioVal1 = 'Normal';
                            issue='Site Plan/Zone Certificate';
                          });
                        },
                      ),
                      const Text("Site Plan/Zone Certificate"),
                    ],
                  ),
                ),
                //SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 3,
                        groupValue: _radioSelected1,
                        activeColor: Colors.orangeAccent,
                        onChanged: (value) {
                          setState(() {
                            _radioSelected1 = value as int;
                            // _radioVal1 = 'Normal';
                            issue='PDF not visible';
                          });
                        },
                      ),
                      const Text("PDF not visible"),
                      SizedBox(width:MediaQuery.of(context).size.width*0.13,),
                      Radio(
                        value: 4,
                        groupValue: _radioSelected1,
                        activeColor: Colors.orangeAccent,
                        onChanged: (value) {
                          setState(() {
                            _radioSelected1 = value as int;
                            // _radioVal1 = 'Normal';
                            issue='Wrong Certificate Generated';
                          });
                        },
                      ),
                      const Text("Wrong Certificate Generated"),
                    ],
                  ),
                ),
                //SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 5,
                      groupValue: _radioSelected1,
                      activeColor: Colors.orangeAccent,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected1 = value as int;
                          // _radioVal1 = 'Normal';
                          issue='Other';
                        });
                      },
                    ),
                    const Text("Other"),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width(context)*0.25,
                        child: Text('Comments')
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.05,
                      child: Center(
                        child: Text(':'),
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: _buildComments()
                    ),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015,),
                RaisedButton(
                  color: Colors.orange,
                  child: Text(
                    'SUBMIT',
                  ),
                  onPressed: () {
                    _formKey.currentState.validate();
                    if(_nameController.text.isNotEmpty&&_emailController.text.isNotEmpty&&_phoneNumberController.text.isNotEmpty&&_villageController.text.isNotEmpty&&_surveynoController.text.isNotEmpty&&_challanNoController.text.isNotEmpty&&_commentsController.text.isNotEmpty){
                      _uploadata();
                    }else{
                      setState(() {
                        _isValidated=false;
                      });
                    }
                    print('get it ');

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  _uploadata() async {
    var data;
    //print(_name+_email+_phoneNumber+_village+_surveyno+_challanNo+issue+_comments);
    var uri = Uri.parse("http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/report_issue.php");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['NAME'] =_name;
    request.fields['EMAIL_ID'] =_email;
    request.fields['PHONE_NO'] =_phoneNumber.toString();
    request.fields['VILLAGE_NAME'] =_village;
    request.fields['SURVEY_NO'] =_surveyno.toString();
    request.fields['CHALLAN_NO'] =_challanNo;
    request.fields['ISSUE_TYPE'] =issue;
    request.fields['COMMENT'] =_comments;

    var response = await request.send();
    print(request);

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) async {
        data = value;
        print(data);
        if (data== "Inserted Successfully") {
          setState(() {
            _isDataUploaded = false;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.teal[100],
                  title: Text("SUCCESS"),
                  content: Text(
                      "Data Uploaded Sucessfully"),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        })
                  ],
                );
              });
        } else {
          setState(() {
            _isDataUploaded = false;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.red[100],
                  title: Text("Failed"),
                  content:
                  Text("Please check your internet connection and Retry"),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                );
              });
        }
      });
    }
  }
}