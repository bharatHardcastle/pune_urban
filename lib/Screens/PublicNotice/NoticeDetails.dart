import 'package:flutter/material.dart';

class NoticeDetails extends StatefulWidget {
  final String title;
  final String smg;
  final String date;
  const NoticeDetails({Key key, this.title, this.smg, this.date}) : super(key: key);


  @override
  State<NoticeDetails> createState() => _NoticeDetailsState();
}

class _NoticeDetailsState extends State<NoticeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF8D882),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'GothicA1',
                  //fontSize: 18.0,
                ),
              ),
              // Container(
              //   height: 200.0,
              //   width: double.infinity,
              //   child: Image.asset('assets/Images/pmc_logo.jpg'),
              // ),
              //Divider(),
              SizedBox(height:MediaQuery.of(context).size.height * 0.02,),
              Text(
                widget.smg,
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'GothicA1',
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}