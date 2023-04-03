import 'package:flutter/material.dart';

class AboutPmc extends StatelessWidget {
  const AboutPmc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('PMC',style: TextStyle(color: Colors.black)
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFF8D882),
        elevation: 0.0,
      ),
      //backgroundColor:Color(0xfffffab9),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/AboutUs');
                },
                child: Container(
                  //width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.20,
                    child: Image.asset('assets/Images/about_us.png')
                  ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/Information');
                },
                child: Container(
                    height: MediaQuery.of(context).size.height*0.20,
                    child: Image.asset('assets/Images/information.png')
                  ),
              )
            ]

        ),
      ),
    );
  }
}

