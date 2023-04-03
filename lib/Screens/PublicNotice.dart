import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'PublicNotice/NoticeDetails.dart';
class PublicNotice extends StatefulWidget {
  const PublicNotice({Key key}) : super(key: key);

  @override
  State<PublicNotice> createState() => _PublicNoticeState();
}

class _PublicNoticeState extends State<PublicNotice> {

  //List<String> AllNotices = [];
  Future<List> _value;
  Notice _notice = new Notice();
  String srNo,title,text,date;
  bool _isFormVisible=false;
  bool _isDataUploaded =false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _value=_notice.getNotices();
    });
  }

  // void fetchNotices() async {
  // var Notices;
  //   var uri = Uri.parse(
  //       "http://115.124.127.208/PMC/fetchNotice.php");//CHANGED BY BHARAT DATE-25/AUGUEST/2022.
  //   var request = new http.MultipartRequest("POST", uri);
  //   //request.fields['VILLAGE_NAME'] =widget.village;
  //   //print(village);
  //   print(request);
  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     response.stream.transform(utf8.decoder).listen((value) async {
  //       var data = jsonDecode(value);
  //       print(data);
  //       // setState(() {
  //       //   for (var i = 0; i < data.length; i++) {
  //       //     Notices=data[i].toString();
  //       //     AllNotices.add(Notices);
  //       //     //AllNotices.add(data[i]['NOTICE_TITLE']);
  //       //     print(AllNotices);
  //       //   }
  //       // });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Public Notice',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF8D882),
        elevation: 0.0,
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isDataUploaded,
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: !_isFormVisible,
                    child: Container(
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Notice>>(
                              future:_value,
                              builder: (context,
                                  AsyncSnapshot<List<Notice>> snapshot) {
                                return snapshot.hasData
                                    ? dataBody(snapshot.data)
                                    : Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(
                                          8.0, 250, 8, 10),
                                      child: Center(
                                        child: Text(
                                          "No data Found",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight:
                                              FontWeight.w500),
                                        ),
                                      ),
                                    ));
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView dataBody(List<Notice> data) {
    return SingleChildScrollView(
      child: DataTable(
        //columnSpacing: MediaQuery.of(context).size.width * 0.07,
         sortAscending:true,
        border: TableBorder.all(),
        headingRowColor: MaterialStateColor.resolveWith((states) => Color(0xfffffab9)),
        // sortColumnIndex: 0,
        columns: [
          // DataColumn(
          //   label: RichText(
          //     text: TextSpan(
          //       style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.w600),
          //       text: 'Sr No',
          //     ),
          //   ),
          //   numeric: false,
          //   tooltip: "This is First Name",
          // ),
          DataColumn(
            label: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.w600),
                text: 'Title',
              ),
            ),
            numeric: false,
            tooltip: "This is First Name",
          ),
          DataColumn(
            label: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.w600),
                text: 'Message',
              ),
            ),
            numeric: false,
            tooltip: "This is First Name",
          ),
          DataColumn(
            label: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.w600),
                text: 'Date',
              ),
            ),
            numeric: false,
            tooltip: "This is First Name",
          ),
        ],
        rows: data
            .map(
              (notice) => DataRow(
              cells: [
                // DataCell(
                //   Text(
                //     notice.srNo,
                //     textAlign: TextAlign.center,
                //   ),
                //   onTap: () {
                //     setState(() {
                //       // _isFormVisible = true;
                //       // _isdataLoaded = true;
                //       srNo = notice.srNo;
                //       title = notice.title;
                //       text = notice.text;
                //       date = notice.date;
                //       // Toast.show("MIS", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                //       showNotice(notice.title,notice.text,notice.date);
                //     });
                //   },
                // ),
                DataCell(
                  Text(notice.title, textAlign: TextAlign.center),
                  onTap: () {
                    setState(() {
                      // _isFormVisible = true;
                      // _isdataLoaded = true;
                      srNo = notice.srNo;
                      title = notice.title;
                      text = notice.text;
                      date = notice.date;
                      // Toast.show("${user.name}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      showNotice(notice.title,notice.text,notice.date);
                    });
                  },
                ),
                DataCell(
                  Center(
                      child: Text(notice.text,
                          textAlign: TextAlign.center)),
                  onTap: () {
                    setState(() {
                      // _isFormVisible = true;
                      // _isdataLoaded = true;
                      srNo = notice.srNo;
                      title = notice.title;
                      text = notice.text;
                      date = notice.date;
                      // Toast.show("${user.mobileNo}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      // mobileNo = user.mobileNo;
                      showNotice(notice.title,notice.text,notice.date);
                    });
                  },
                ),
                DataCell(
                  Text(notice.date, textAlign: TextAlign.center),
                  onTap: () {
                    setState(() {
                      // _isFormVisible = true;
                      // _isdataLoaded = true;
                      srNo = notice.srNo;
                      title = notice.title;
                      text = notice.text;
                      date = notice.date;
                      // Toast.show("${user.zone}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      showNotice(notice.title,notice.text,notice.date);
                    });
                  },
                ),
                // DataCell(
                //   Text(user.total_new_pendency, textAlign: TextAlign.center),
                //   onTap: () {
                //     setState(() {
                //       // _isFormVisible = true;
                //       // _isdataLoaded = true;
                //       print('Selected ${user.zone}');
                //       complaintId = user.complaintId;
                //       name = user.name;
                //       mobileNo = user.mobileNo;
                //       zone = user.zone;
                //       total_new_pendency=user.total_new_pendency;
                //       Toast.show("total pendency", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                //       showMis(user.mobileNo);
                //     });
                //   },
                // ),
              ]),
        )
            .toList(),
      ),
    );
  }

  Future<void> showNotice(String title,String smg,String date) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        NoticeDetails(title:title,
            smg:smg,
            date:date)
    )
    );
  }
}

class  Notice{
  String srNo,
      title,
      text,
      date;
      static List<Notice> notice = [];

  Notice(
      {
        this.srNo,
        this.title,
        this.text,
        this.date,
      });

  Future<List<Notice>> getNotices() async {
    notice.clear();
    var data, datavalue;
    var uri = Uri.parse(
        "http://115.124.127.208/PMC/fetchNotice.php");
    var request = new http.MultipartRequest("POST", uri);

    print(request);

    var response = await request.send().timeout(const Duration(minutes: 2));
    if (response.statusCode == 200) print('Uploaded!');
    response.stream.transform(utf8.decoder).transform(json.decoder).listen((value) async {
      data = value;
      // data = value;
      print(data);
      for (var i = 0; i < data.length; i++) {
        datavalue = data[i];
        print(datavalue);
        notice.add(
          Notice(
            srNo: datavalue["SR_NO"],
            title: datavalue["NOTICE_TITLE"],
            text: datavalue["NOTICE_TEXT"],
            date: datavalue["DATE"],
          ),
        );
      }
    });
    return notice;
  }
}
