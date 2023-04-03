import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
class RRVillageDataScreen extends StatefulWidget {
  final String village;
  const RRVillageDataScreen({Key key, this.village}) : super(key: key);

  @override
  State<RRVillageDataScreen> createState() => _RRVillageDataScreenState();
}

class _RRVillageDataScreenState extends State<RRVillageDataScreen> {

  var _isFormVisible = false;
  bool _isDataUploaded =false;
  List<String> locationnameList = [];
  var division,subdivision,openspace,locationdata,district,taluka,villagename,rate,assessmenttype,assessmentrange,residential,office,shop,industrial;
  var villagedata;
  var locationname;
  bool _islocation =false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVillageLocations();
  }

  void getVillageLocations() async {
    locationnameList.clear();
    var uri = Uri.parse(
        "http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/getLocationbyVillage.php");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['VILLAGE_NAME'] =widget.village;
    //print(village);
    print(request);
    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) async {
        var data = jsonDecode(value);
        //print(data);
        if(data.length==1){
          setState(() {
            locationname='NA';
            getVillageLocationsRates();
            _islocation=false;
          });
        }
        else{
          setState(() {
            for (var i = 0; i < data.length; i++) {
              //print(data[i]['DATA_VALUE']);
              locationnameList.add(data[i]['DATA_VALUE']);
              //villageitems.add(villagenames);
              //  PolyIdList.add(data[i]['DATA_VALUE']);
              // getVillageLocationsRates();
            }
            print(locationnameList);
            _islocation=true;
            //getVillageLocationsRates();
          });
        }
      });
    }
  }

  void getVillageLocationsRates() async {
    var uri = Uri.parse(
        "http://115.124.127.208/PHP/PMC/api_beta/Urban_Mobile/fetchFinalRR.php");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['VILLAGE_NAME'] =widget.village;
    request.fields['LOCATION'] = locationname;
    //print(village);
    print(request);
    var response = await request.send();
    print(response.statusCode );
    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) async {
        var data = jsonDecode(value);
        print(data);
        setState(() {
          for (var i = 0; i < data.length; i++) {
            locationdata = data[i]['LOCATION'];
            district = data[i]['DISTRICT'];
            taluka = data[i]['TALUKA'];
            villagename = data[i]['VILLAGE'];
            division = data[i]['DIVISION'];
            subdivision = data[i]['SUBDIVISION'];
            openspace = data[i]['OPEN_SPACE'];
            residential = data[i]['RESIDENTIAL_FLATS'];
            office = data[i]['OFFICE'];
            shop = data[i]['SHOPS'];
            industrial = data[i]['INDUSTRIAL'];
            //print(villagedata);
            print(locationdata);
          }
        });
        showDialog(
          context: context,
          builder: (BuildContext context) => new AlertDialog(
            title: new Text("Information"),
            content: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Village: ${locationdata}"),
                SizedBox(height: 10,),
                Text("Year: ${district}"),
                SizedBox(height: 10,),
                Text("Landmark: ${taluka}"),
                SizedBox(height: 10,),
                Text("Zone: ${division}"),
                SizedBox(height: 10,),
                Text("Subzone: ${subdivision}"),
                SizedBox(height: 10,),
                Text("Land: ${openspace}"),
                SizedBox(height: 10,),
                Text("Residential: ${residential}"),
                SizedBox(height: 10,),
                Text("Office: ${office}"),
                SizedBox(height: 10,),
                Text("Shops: ${shop}"),
                SizedBox(height: 10,),
                Text("Industrial: ${industrial}"),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("CLOSE"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
        // print(data[0]);
        // print(data[0]['LOCATION']);
        // print(data[0]['DISTRICT']);
        // print(data[0]['TALUKA']);
        // print(data[0]['VILLAGE']);
        // print(data[0]['DIVISION']);
        // print(data[0]['SUBDIVISION']);
        // print(data[0]['OPEN_SPACE']);
        // print(data[0]['RESIDENTIAL_FLATS']);
        // print(data[0]['OFFICE']);
        // print(data[0]['SHOPS']);
        // print(data[0]['INDUSTRIAL']);
        // print(data[0]['UNIT']);
        // print(data[0]['RATE']);
        // print(data[0]['ASSESSMENT_TYPE']);
        // print(data[0]['ASSESSMENT_RANGE']);
      });
    }
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
                                widget.village,
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
                          itemCount: locationnameList.length,
                          itemBuilder: (context, i) {
                            return Visibility(
                              visible:_islocation,
                              child: GestureDetector(
                                onTap:(){
                                  setState(() {
                                    locationname=locationnameList[i].toString();
                                    //_isFormVisible=true;
                                    getVillageLocationsRates();
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
                                  child: Text(locationnameList[i].toString()),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Visibility(
                  //   visible: !_isFormVisible,
                  //   child: Container(
                  //     //  height: 600,
                  //     child: SingleChildScrollView(
                  //       child: SingleChildScrollView(
                  //         scrollDirection: Axis.horizontal,
                  //         child:DataTable(
                  //           border: TableBorder.all(),
                  //           headingRowColor: MaterialStateColor.resolveWith((states) => Color(0xff0F52BA)),
                  //           columns: const <DataColumn>[
                  //             DataColumn(
                  //               label: Text(
                  //                 'VILLAGE',
                  //               ),
                  //             ),
                  //             DataColumn(
                  //               label: Text(
                  //                 'YEAR',
                  //               ),
                  //             ),
                  //             DataColumn(
                  //               label: Text(
                  //                 'LANDMARK',
                  //               ),
                  //             ),
                  //             DataColumn(
                  //               label: Text(
                  //                 'ZONE',
                  //               ),
                  //             ),
                  //             DataColumn(
                  //               label: Text(
                  //                 'SUBZONE',
                  //               ),
                  //             ),
                  //             DataColumn(
                  //               label: Text(
                  //                 'LAND',
                  //               ),
                  //             ),
                  //             DataColumn(
                  //               label: Text(
                  //                 'RESIDENTIAL',
                  //               ),
                  //             ),
                  //             DataColumn(
                  //               label: Text(
                  //                 'OFFICE',
                  //               ),
                  //             ),
                  //             DataColumn(
                  //               label: Text(
                  //                 'SHOP',
                  //               ),
                  //             ),
                  //             DataColumn(
                  //               label: Text(
                  //                 'INDUSTRIAL',
                  //               ),
                  //             ),
                  //           ],
                  //           rows: <DataRow>[
                  //             DataRow(
                  //               cells: <DataCell>[
                  //                 DataCell(Text(locationdata!=null?locationdata:'')),
                  //                 DataCell(Text(district!=null?district:'')),
                  //                 DataCell(Text(taluka!=null?taluka:'')),
                  //                 DataCell(Text(division!=null?division:'')),
                  //                 DataCell(Text(subdivision!=null?subdivision:'')),
                  //                 DataCell(Text(openspace!=null?openspace:'')),
                  //                 DataCell(Text(residential!=null?residential:'')),
                  //                 DataCell(Text(office!=null?office:'')),
                  //                 DataCell(Text(shop!=null?shop:'')),
                  //                 DataCell(Text(industrial!=null?industrial:'')),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //         // Table(
                  //         //   defaultColumnWidth: FixedColumnWidth(180.0),
                  //         //   border: TableBorder.all(
                  //         //       color: Colors.black,
                  //         //       style: BorderStyle.solid,
                  //         //       width: 1),
                  //         //   children: [
                  //         //     TableRow( children: [
                  //         //       Column(children:[Text('LOCATION', style: TextStyle(fontSize: 15.0))]),
                  //         //       Column(children:[Text('DISTRICT', style: TextStyle(fontSize: 15.0))]),
                  //         //       Column(children:[Text('TALUKA', style: TextStyle(fontSize: 15.0))]),
                  //         //       Column(children:[Text('VILLAGE', style: TextStyle(fontSize: 15.0))]),
                  //         //       Column(children:[Text('DIVISION', style: TextStyle(fontSize: 15.0))]),
                  //         //       Column(children:[Text('SUBDIVISION', style: TextStyle(fontSize: 15.0))]),
                  //         //       Column(children:[Text('OPEN SPACE', style: TextStyle(fontSize: 15.0))]),
                  //         //       Column(children:[Text('RATE', style: TextStyle(fontSize: 15.0))]),
                  //         //       Column(children:[Text('ASSESSMENT TYPE', style: TextStyle(fontSize: 15.0))]),
                  //         //       Column(children:[Text('ASSESSMENT RANGE', style: TextStyle(fontSize: 15.0))]),
                  //         //     ]),
                  //         //     TableRow( children: [
                  //         //       Column(children:[Text(locationdata!=null?locationdata:'')]),
                  //         //       Column(children:[Text(division!=null?division:'')]),
                  //         //       Column(children:[Text(taluka!=null?taluka:'')]),
                  //         //       Column(children:[Text(villagename!=null?villagename:'')]),
                  //         //       Column(children:[Text(division!=null?division:'')]),
                  //         //       Column(children:[Text(subdivision!=null?subdivision:'')]),
                  //         //       Column(children:[Text(openspace!=null?openspace:'')]),
                  //         //       Column(children:[Text(rate!=null?rate:'')]),
                  //         //       Column(children:[Text(assessmenttype!=null?assessmenttype:'')]),
                  //         //       Column(children:[Text(assessmentrange!=null?assessmentrange:'')]),
                  //         //     ]),
                  //         //     // TableRow( children: [
                  //         //     //   Column(children:[Text('Javatpoint')]),
                  //         //     //   Column(children:[Text('MySQL')]),
                  //         //     //   Column(children:[Text('5*')]),
                  //         //     // ]),
                  //         //     // TableRow( children: [
                  //         //     //   Column(children:[Text('Javatpoint')]),
                  //         //     //   Column(children:[Text('ReactJS')]),
                  //         //     //   Column(children:[Text('5*')]),
                  //         //     // ]),
                  //         //   ],
                  //         // ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
