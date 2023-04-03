import 'package:flutter/material.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({Key key}) : super(key: key);

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Padding(
           padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08,bottom: MediaQuery.of(context).size.height*0.05),
           child: const Text('PUNE MUNICIPAL CORPORATION',style: TextStyle(fontWeight: FontWeight.bold),),
         ),
         Container(
           height: MediaQuery.of(context).size.height*0.50,
           child: GridView.count(
             childAspectRatio: 1.0,
             padding: EdgeInsets.only(left: 16, right: 16),
             crossAxisCount: 2,
             crossAxisSpacing: 18,
             mainAxisSpacing: 18,
             children: [
               Image.asset(
                 "assets/Images/punelogo1.png",
                 width: 60,
               ),
               Image.asset(
                 "assets/Images/pmclogohd.png",
                 width: 60,
               ),
               GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, '/Dash');
                 },
                 child: Image.asset(
                   "assets/Images/englishbutton.png",
                   width: 60,
                   height:30,
                 ),
               ),
               GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, '/Dash');
                 },
                 child: Image.asset(
                   "assets/Images/marathibutton.png",
                   width: 60,
                   height:30,
                 ),
               ),
             ],
           ),
         ),
         Expanded(
           child: Container(
             margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.08),
             //height: MediaQuery.of(context).size.height*0.20,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/Images/final_skyline.png"),
                  //fit: BoxFit.fitWidth,
                 fit: BoxFit.fill,
               ),
             ),
           ),
         ),
       ],
     )
    );
  }
}


