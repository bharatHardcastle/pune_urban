import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'RRVillageDataScreen.dart';

class ReadyReckonerVillage extends StatefulWidget {
  final String taluka;
  const ReadyReckonerVillage({Key key, this.taluka}) : super(key: key);

  @override
  State<ReadyReckonerVillage> createState() => _ReadyReckonerVillageState();
}

class _ReadyReckonerVillageState extends State<ReadyReckonerVillage> {
  List<String> servicesList;
  var village;
  var locationname;
  bool _isDataUploaded =false;
  var _isFormVisible = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVilalges();
  }

  void getVilalges() {
    if (widget.taluka == "Haveli") {
      setState(() {
        servicesList = [
          // "Aambegaon(Khurd)",
          // "Aambegaon(Budruk)",
          // "Undri",
          // "Erandvana",
          // "Aundh",
          // "Kalas",
          // "Kasba peth",
          // "Katraj",
          // "Kothrud",
          // "Kondhawa(Kh.)",
          // "Kondhawa(Bu)",
          // "Kharadi",
          // "Ganesh peth",
          // "Guruwar Peth",
          // "Giltekadi",
          // "Ganj peth",
          // "Ghorpadi",
          // "Ghorapd peth",
          // "Dhankawadi",
          // "Dhanori",
          // "Dhayari",
          // "Nana peth",
          // "Narayan peth",
          // "Pashan",
          // "Parvati",
          // "Baner",
          // "Balewadi",
          // "Bibavewadi",
          // "Budhwar peth",
          // "Bhawani peth",
          // "Ambegaon Khurd (like old survey number)",
          // "Undri part (like updated survey number)",
          // "Dhayari part",
          // "Hadapsar",
          // "Hadapsar(साडेसतरा नळीचा भाग)",
          // "आंबेगाव(खुर्द)",
          // "आंबेगाव(बुद्रुक)",
          // "उंड्री",
          // "एरंडवणा",
          // "औंध",
          // "कळस",
          // "कसबा पेठ",
          // "कात्रज",
          // "कोथरूड",
          // "कोंढवा(खुर्द)",
          // "कोंढवा(बुद्रुक)",
          // "खराडी",
          // "गणेश पेठ",
          // "गुरूवार पेठ",
          // "गुलटेकडी",
          // "गंज पेठ",
          // "घोरपडी",
          // "घोरपडे पेठ",
          // "धनकवडी",
          // "धानोरी",
          // "धायरी",
          // "नाना पेठ",
          // "नारायण पेठ",
          // "पाषाण",
          // "पर्वती",
          // "बाणेर",
          // "बालेवाडी",
          // "बिबवेवाडी",
          // "बुधवार पेठ",
          // "भवानी पेठ",
          // "आंबेगाव खुर्द(जुन्या सर्वे नंबर प्रमाणे)",
          // "उंड्री भाग(नवीन सर्वे नंबर प्रमाणे)",
          // "धायरी भाग",
          // "हडपसर",
          // "हडपसर(साडेसतरा नळीचा भाग)"
          // "महमंदवाडी",
          // "मुंढवा",
          // "मुंढवा(केशवनगर परिसर भाग)",
          // "आंबेगांव बुद्रुक(ग्रामीण)",
          // "येवलेवाडी(कोंडवे बुद्रुकचीवाडी)",
          // "शिवणे(भाग)(उत्तमनगर परिसर)",
          // "मंगळवार पेठ",
          // "येरवडा",
          // "रविवार पेठ",
          // "रास्ता पेठ",
          // "लोहगाव",
          // "वडगाव(खुर्द)",
          // "वडगाव(बुद्रुक)",
          // "वडगाव शेरी(रामवाडी)",
          // "वानवडी",
          // "वारजे",
          // "शनिवार पेठ",
          // "शिवणे",
          // "शिवाजीनगर(भांबुर्डा)",
          // "शुक्रवार पेठ",
          // "सदाशिव पेठ/नवीपेठ/दत्तवाडी",
          // "सोमवार पेठ",
          // "हिंगणे(खुर्द)",
          // "हिंगणे(बुद्रुक)कर्वेनगर",
          // "बोपोडी",
          // "पुणे कॅन्टोनमेंट",
          // "खडकी कॅन्टोनमेंट"
          "Balewadi",
          "Bhavani Peth",
          "Bhudhwar Peth",
          "Dhanori",
          "Dhayari",
          "Dighi",
          "Erandwane",
          "Ganesh Peth",
          "Ganj Peth",
          "Ghorpade Peth",
          "Ghorpadi",
          "Gultekadi",
          "Guruwar Peth",
          "Hingane Budruk Karvenagar",
          "Hingane Khurd",
          "Kalas",
          "Kasaba Peth",
          "Katraj",
          "Khadki cantonment",
          "Kharadi",
          "Kiwale",
          "Kondhwa Budruk",
          "Kondhwa Khurd",
          "Lohegaon",
          "Mangalwar Peth",
          "Nana Peth",
          "Narayan Peth",
          "Parvati",
          "Pashan",
          "Pune Cantonment",
          "Rasta Peth",
          "Ravivar Peth",
          "Sadashiv|Navi Peth| Dattawadi",
          "Sangvi",
          "Shivajinagar (Bhamburdi)",
          "Shivane",
          "Shukrawar Peth",
          "Somwar Peth",
          "Undri",
          "Warje",
          "Yerwada",
          "Ambegaon Budruk",
          "Bibvewadi",
          "Bopodi",
          "Dapodi",
          "Hadapsar",
          "Kothrud",
          "Mohammed Wadi",
          "Moshi",
          "Shaniwar Peth",
          "Wanwadi",
          "Mundhwa",
          "Yewalewadi",
          "Bavdhan Khurd",
          "Uruli Devachi",
          "Fursungi",
          "Kirkatwadi",
          "Pisoli",
          "Kondhave Dhawade",
          "Kopre Kondhwa",
          "Khadakwasala",
          "Nanded",
          "Manjari Budruk",
          "Narhe",
          "Holkarwadi",
          "Autade Handewadi",
          "Wadachi Wadi",
          "Shewalewadi",
          "Mangadewadi",
          "Bhilarewadi",
          "Gujar Nimbalkarwadi",
          "Jambulwadi",
          "Kolwadi",
          "Wagholi",
          "Nandoshi",
          "Sanas Nagar",
          "AUNDH"
        ];
      });
    } else {
      setState(() {
        servicesList = ["Bavdhan Khurd", "Bavdhan Budruk", "Vadgaon"];//["बावधान(खुर्द)","बावधान(बुद्रुक)","वडगाव"];
      });
    }
    print(servicesList);
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ready Reckoner Rate',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFF8D882),
        elevation: 0.0,
      ),
      //backgroundColor: Color(0xfffffab9),
      body:ModalProgressHUD(
        inAsyncCall: _isDataUploaded,
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: !_isFormVisible,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          //color: Colors.redAccent,
                          child: Center(
                              child: Text(
                                'Select Village',
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                              )),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        ListView.builder(
                          //scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: servicesList.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap:(){
                                setState(() {
                                  //village=servicesList[i].toString();
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RRVillageDataScreen(village:servicesList[i])));
                                  //_isFormVisible=true;
                                  //getVillageLocations();
                                  //print(village);
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.06,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  //color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey, //pink[800], width: 3.0/
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)), // Set rounded corner radius
                                  //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
                                ),
                                child: Text(servicesList[i].toString()),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // SingleChildScrollView(
      //   physics: ScrollPhysics(),
      //   child: Column(
      //     children: [
      //       Container(
      //         height: MediaQuery.of(context).size.height * 0.05,
      //         //color: Colors.redAccent,
      //         child: Center(
      //             child: Text(
      //           'Select Village',
      //           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
      //         )),
      //       ),
      //       Divider(
      //         color: Colors.black,
      //         thickness: 1,
      //       ),
      //       // Row(
      //       //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       //   children: <Widget>[
      //       //     Flexible(
      //       //       flex: 1,
      //       //       child: Padding(
      //       //         padding: const EdgeInsets.all(2.0),
      //       //         child: Container(
      //       //           child: FlatButton(
      //       //             shape: new RoundedRectangleBorder(
      //       //                 borderRadius: BorderRadius.all(
      //       //                     Radius.circular(10.0)),
      //       //                 side: BorderSide(color: Colors.black)),
      //       //             textColor: Colors.black,
      //       //             child: Text('From'),
      //       //             onPressed: () {},
      //       //           ),
      //       //         ),
      //       //       ),
      //       //     ),
      //       //     Flexible(
      //       //       flex: 1,
      //       //       child: Padding(
      //       //         padding: const EdgeInsets.all(2.0),
      //       //         child: Container(
      //       //           width: 55,
      //       //           child: FlatButton(
      //       //             shape: new RoundedRectangleBorder(
      //       //                 borderRadius: BorderRadius.all(
      //       //                     Radius.circular(10.0)),
      //       //                 side: BorderSide(color: Colors.black)),
      //       //             textColor: Colors.black,
      //       //             child: Text('To'),
      //       //             onPressed: () {},
      //       //           ),
      //       //         ),
      //       //       ),
      //       //     ),
      //       //     Flexible(
      //       //       flex: 1,
      //       //       child: Padding(
      //       //         padding: const EdgeInsets.all(2.0),
      //       //         child: Center(
      //       //           child: Container(
      //       //             height: 38,
      //       //             child: TextFormField(
      //       //               textAlign: TextAlign.center,
      //       //               decoration: new InputDecoration(
      //       //                 hintText: "Village",
      //       //                 fillColor: Colors.white,
      //       //                 focusedBorder: OutlineInputBorder(
      //       //                   borderSide:
      //       //                   BorderSide(color: Colors.black),
      //       //                   borderRadius: BorderRadius.all(
      //       //                     Radius.circular(10),
      //       //                   ),
      //       //                 ),
      //       //                 enabledBorder: OutlineInputBorder(
      //       //                   borderSide:
      //       //                   BorderSide(color: Colors.black),
      //       //                   borderRadius: BorderRadius.all(
      //       //                     Radius.circular(10),
      //       //                   ),
      //       //                 ),
      //       //               ),
      //       //             ),
      //       //           ),
      //       //         ),
      //       //       ),
      //       //     ),
      //       //     Flexible(
      //       //       flex: 1,
      //       //       child: Padding(
      //       //         padding: const EdgeInsets.all(2.0),
      //       //         child: Center(
      //       //           child: Container(
      //       //             height: 38,
      //       //             child: TextFormField(
      //       //               textAlign: TextAlign.center,
      //       //               decoration: new InputDecoration(
      //       //                 hintText: "zone",
      //       //                 fillColor: Colors.white,
      //       //                 focusedBorder: OutlineInputBorder(
      //       //                   borderSide:
      //       //                   BorderSide(color: Colors.black),
      //       //                   borderRadius: BorderRadius.all(
      //       //                     Radius.circular(10),
      //       //                   ),
      //       //                 ),
      //       //                 enabledBorder: OutlineInputBorder(
      //       //                   borderSide:
      //       //                   BorderSide(color: Colors.black),
      //       //                   borderRadius: BorderRadius.all(
      //       //                     Radius.circular(10),
      //       //                   ),
      //       //                 ),
      //       //               ),
      //       //             ),
      //       //           ),
      //       //         ),
      //       //       ),
      //       //     ),
      //       //     Flexible(
      //       //       flex: 1,
      //       //       child: Padding(
      //       //         padding: const EdgeInsets.all(2.0),
      //       //         child: Container(
      //       //           child: FlatButton(
      //       //             shape: new RoundedRectangleBorder(
      //       //                 borderRadius: BorderRadius.all(
      //       //                     Radius.circular(10.0)),
      //       //                 side: BorderSide(color: Colors.black)),
      //       //             textColor: Colors.black,
      //       //             child: Text(
      //       //               'Search',
      //       //               style: TextStyle(
      //       //                   fontSize: 11,
      //       //                   fontWeight: FontWeight.w500),
      //       //             ),
      //       //             onPressed: () {},
      //       //           ),
      //       //         ),
      //       //       ),
      //       //     ),
      //       //     Flexible(
      //       //       flex: 1,
      //       //       child: Padding(
      //       //         padding: const EdgeInsets.all(2.0),
      //       //         child: Container(
      //       //           width: screenWidth * 0.15,
      //       //           child: FlatButton(
      //       //             shape: new RoundedRectangleBorder(
      //       //                 borderRadius: BorderRadius.all(
      //       //                     Radius.circular(10.0)),
      //       //                 side: BorderSide(color: Colors.black)),
      //       //             textColor: Colors.black,
      //       //             child: Text('All'),
      //       //             onPressed: () {},
      //       //           ),
      //       //         ),
      //       //       ),
      //       //     ),
      //       //   ],
      //       // ),
      //       ListView.builder(
      //         //scrollDirection: Axis.vertical,
      //         physics: NeverScrollableScrollPhysics(),
      //         shrinkWrap: true,
      //         itemCount: servicesList.length,
      //         itemBuilder: (context, i) {
      //           return GestureDetector(
      //             onTap:(){
      //               setState(() {
      //                 village=servicesList[i].toString();
      //                 getVillageLocations();
      //                 //print(village);
      //               });
      //             },
      //             child: Container(
      //               height: MediaQuery.of(context).size.height * 0.06,
      //               margin: EdgeInsets.all(10),
      //               padding: EdgeInsets.all(10),
      //               alignment: Alignment.center,
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 border: Border.all(
      //                   color: Colors.grey, //pink[800], width: 3.0/
      //                 ),
      //                 borderRadius: BorderRadius.all(
      //                     Radius.circular(10.0)), // Set rounded corner radius
      //                 //boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
      //               ),
      //               child: Text(servicesList[i].toString()),
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
