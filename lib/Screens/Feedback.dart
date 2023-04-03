import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key key}) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  bool isDataUploaded =false;
  int _radioSelected1=1;
  var expert;
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      //backgroundColor:Color(0xfffffab9),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Please tell us what do you think, any kind of feedback is highly appreciated'),
          ),
          SizedBox(height:MediaQuery.of(context).size.height*0.01,),
          Row(
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
                    expert='Idea';
                    print(expert);
                  });
                },
              ),
              const Text("Idea"),
              SizedBox(width:MediaQuery.of(context).size.width*0.2,),
              Radio(
                value: 2,
                groupValue: _radioSelected1,
                activeColor: Colors.orangeAccent,
                onChanged: (value) {
                  setState(() {
                    _radioSelected1 = value as int;
                    // _radioVal1 = 'Normal';
                    expert='Question';
                    print(expert);
                  });
                },
              ),
              const Text("Question"),
            ],
          ),
          Row(
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
                    expert='Problem';
                    print(expert);
                  });
                },
              ),
              const Text("Problem"),
              SizedBox(width:MediaQuery.of(context).size.width*0.13,),
              Radio(
                value: 4,
                groupValue: _radioSelected1,
                activeColor: Colors.orangeAccent,
                onChanged: (value) {
                  setState(() {
                    _radioSelected1 = value as int;
                    // _radioVal1 = 'Normal';
                    expert='Praise';
                    print(expert);
                  });
                },
              ),
              const Text("Praise"),
            ],
          ),
          SizedBox(height:MediaQuery.of(context).size.height*0.01,),
           Row(children:[
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text('Your Feedback'),
                )
              ]
           ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.white,
              child: TextField(
                controller: _commentController,
                maxLines:7,
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none, hintText: '',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,1,10,10),
            child: Container(
              color: Colors.white,
              child: TextField(
                maxLines:1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Your Email',
                ),
              ),
            ),
          ),
          MaterialButton(
            color: Colors.orange,
              child: Text('SEND FEEDBACK'),
              onPressed:(){
              print(_commentController.text);
                _uploadata(_commentController.text);
            }
          ),
        ],
      )
    );
  }
  void _uploadata(String strtext) async {
    var data;
    var uri = Uri.parse("http://115.124.127.208/PMC/feedback.php");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['text'] =strtext;

    var response = await request.send();
    print(request);

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) async {
        data = value;
        print(data);
        if (data== "Feedback Sent Successfully") {
          setState(() {
            isDataUploaded = true;
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
            isDataUploaded = false;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  //backgroundColor: Colors.red[100],
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
