import 'package:flutter/material.dart';

class BuildingDevelopment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Building Development',style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFF8D882),
        elevation: 1.0,
      ),
      // backgroundColor:Color(0xfffffab9),
      body:Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/Approved');
                },
                child: Container(
                  //width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.20,
                    child: Image.asset('assets/Images/approved.png')
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/Fasttrack');
                },
                child: Container(
                    height: MediaQuery.of(context).size.height*0.20,
                    child: Image.asset('assets/Images/fastrack.png')
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/On-Going');
                },
                child: Container(
                    height: MediaQuery.of(context).size.height*0.20,
                    child: Image.asset('assets/Images/ongoing.png')
                ),
              )
            ]

        ),
      ),
    );
  }
}
