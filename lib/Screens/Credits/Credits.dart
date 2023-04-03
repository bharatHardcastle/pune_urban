import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  const Credits({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xfffffab9),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.26,
            decoration: const BoxDecoration(
              image: DecorationImage(
                //opacity:0.2,
                image: AssetImage("assets/Images/concept.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height:  MediaQuery.of(context).size.height*0.04,),
          Container(
            height: MediaQuery.of(context).size.height*0.30,
            width:  MediaQuery.of(context).size.height*0.45,
            decoration: const BoxDecoration(
              image: DecorationImage(
                //opacity:0.2,
                image: AssetImage("assets/Images/developed_by.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}
