import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';

import '../Models/thememodel.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  List<String> images = [
    "assets/Images/pmc_logo.jpg",
    "assets/Images/knowofficers.jpg",
    "assets/Images/knowbpdocs.jpg",
    "assets/Images/w.png",
    "assets/Images/buildingdevelopment.jpg",
    "assets/Images/development_plan.png",
    "assets/Images/tdronline.png",
    "assets/Images/levelcertificate.png",
    "assets/Images/public_notice.png",
    "assets/Images/readyreconer.jpg",
    "assets/Images/gis.png",
    "assets/Images/DPGis.png",
    "assets/Images/usefulwebsite.jpg",
    "assets/Images/nine.png",
    "assets/Images/credits.png",
    "assets/Images/faq_eng.jpg",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchUserData();
  }

  // void fetchUserData() async {
  //   var data, dataValue;
  //
  //   var uri = Uri.parse("http://115.124.127.208/PMC/fetchNotice.php"); //
  //   var request =  http.MultipartRequest("POST", uri);
  //   // request.fields['user_id'] = uid;
  //   // request.fields['type'] = "GET";
  //   //print(request);
  //   var response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     response.stream.transform(utf8.decoder).listen((value) async {
  //       data = jsonDecode(value);
  //       print(data);
  //       // dataValue = data["DATA_VALUE"];
  //       // print(dataValue);
  //       // setState(() {
  //       //   for (int i = 0; i < dataValue.length; i++) {
  //       //     // user = dataValue[i]["USER_NAME"];
  //       //     // email = dataValue[i]["EMAIL_ID"];
  //       //     // phone = dataValue[i]["MOBILE"];
  //       //     // print(user);
  //       //     // print(email);
  //       //     // print(phone);
  //       //   }
  //       // });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('Pune Urban',style: TextStyle(color: Colors.black)
          ),
          //automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFF8D882),
          elevation: 0.0,
          iconTheme:IconThemeData(color: Colors.black),
          actions: <Widget> [
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: IconButton(
                icon: Icon(Icons.brightness_4_rounded),
                onPressed: () async {
                  setState(() {
                    currentTheme.toggleTheme();
                  });
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('_theme', 'dark');
                },
              ),
            ),
          ],
        ),
      body:UpgradeAlert(
        child: Column(
          children:[
          Container(
            padding:EdgeInsets.only(left: 5,right: 5,top: 20),
            height: MediaQuery.of(context).size.height*0.70,
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 25.0
              ),
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/${index}');
                  },
                    child: Image.asset(images[index])
                );
              },
            ),
          ),
            Expanded(
              child: Container(
                margin:EdgeInsets.only(top:3.0),
                //width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Images/final_skyline.png"),
                    //fit: BoxFit.fitHeight,
                    fit: BoxFit.fill
                  ),
                ),
              ),
            ),
         ],
        ),
      ),
    );
  }
}



