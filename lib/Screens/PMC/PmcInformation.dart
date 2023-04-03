import 'package:flutter/material.dart';

class PmcInformation extends StatefulWidget {
  const PmcInformation({Key key}) : super(key: key);

  @override
  State<PmcInformation> createState() => _PmcInformationState();
}

class _PmcInformationState extends State<PmcInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Information',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      // backgroundColor:Color(0xfffafad2),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity:0.2,
            image: AssetImage("assets/Images/about_bg.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text('      Pune, the Oxford of the East is a historical city in India with a glorious past, an innovative present and a promising future. Since 1950, the Pune Municipal Corporation is administrating the city and serving citizens.\n'
                '     Pune Municipal Corporation has taken an initiative for implementing e-Governance. Success of e-governance depends on use of Information Technology in mobilization of Government resources and utilization of these scarce resources with an aim of providing a better service.'
              ,textAlign:TextAlign.justify),//style: TextStyle(color:Colors.black
          ),
        ),
      ),
    );
  }
}
