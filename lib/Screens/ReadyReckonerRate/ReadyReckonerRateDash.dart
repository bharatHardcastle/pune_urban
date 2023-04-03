import 'package:flutter/material.dart';

import 'ReadyReckonerVillage.dart';

class ReadyReckonerRateDash extends StatefulWidget {
  const ReadyReckonerRateDash({Key key}) : super(key: key);

  @override
  State<ReadyReckonerRateDash> createState() => _ReadyReckonerRateDashState();
}

class _ReadyReckonerRateDashState extends State<ReadyReckonerRateDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ready Reckoner Rate',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      //backgroundColor:Color(0xfffffab9),
      body:Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.05,
            //color: Colors.redAccent,
            child: Center(
                child: Text(
                  'Pune Division-Select Taluka',
                  style:TextStyle(fontSize:20.0,fontWeight: FontWeight.w500),
                )
            ),
          ),
          Divider(color: Colors.black,thickness:1,),
          GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadyReckonerVillage(taluka:"Haveli"),
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height*0.06,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  //color: Colors.white,
                  border: Border.all(
                      color: Colors.grey,//pink[800], width: 3.0/
                      ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // Set rounded corner radius
                  //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
              ),
              child: Text("Haveli"),
            ),
          ),
          GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ReadyReckonerVillage(taluka:"Mulshi"),
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height*0.06,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                //color: Colors.white,
                border: Border.all(
                  color: Colors.grey,//pink[800], width: 3.0/
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // Set rounded corner radius
                //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
              ),
              child: Text("Mulshi"),
            ),
          ),
        ],
      ),
    );
  }
}
