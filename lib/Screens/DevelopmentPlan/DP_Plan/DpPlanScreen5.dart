
import 'package:flutter/material.dart';

import 'DpPlanPdfView.dart';


class DpScreen5 extends StatefulWidget {
  final List<Map<String, Object>> dpdata;
  const DpScreen5({Key key, this.dpdata}) : super(key: key);

  @override
  State<DpScreen5> createState() => _DpScreen5State();
}

class _DpScreen5State extends State<DpScreen5> {

  List dp;
  var Dsub=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(widget.dpdata.toString());
    _getData();
  }

  _getData(){
    setState(() {
      for (int i = 0; i < widget.dpdata.length; i++) {
        var title=widget.dpdata[i]['Title'];
        dp=widget.dpdata[i]['dp1'];
        print(title);
        for (int j = 0; j < dp.length; j++) {
          Dsub.add(dp[j]);
          print(Dsub);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dp Plan Published',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      body: ListView.separated(
        itemCount: Dsub.length,
        itemBuilder: (context, int currentIndex) {
          return ListTile(
              tileColor: currentIndex==0||currentIndex==11||currentIndex==22||currentIndex==38||currentIndex==55?Colors.grey[300]:Colors.transparent,
              title: currentIndex==0||currentIndex==11||currentIndex==22||currentIndex==38||currentIndex==55?Center(
                child: Text(
                  Dsub[currentIndex]['da1'],style:TextStyle(fontWeight: FontWeight.bold,),
                ),
              ):Text(
                Dsub[currentIndex]['da1'],
              ),
              //trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print(Dsub[currentIndex]['url']);
                //Toast.show("${strings[currentIndex]} ", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DpPlanPdfView(url:Dsub[currentIndex]['url'],name:Dsub[currentIndex]['da1']),
                    ),
                  );
                });
              });
        },
        separatorBuilder: (context, index) {
          return Divider(color:Colors.grey,);
        },
      ),
      // ListView.builder(
      //     itemCount: Dsub.length,
      //     itemBuilder: (BuildContext context, int index){
      //       return ListTile(
      //         title: Text(Dsub[index]['da1'].toString()),
      //         onTap:(){
      //           //Navigator.push(context, MaterialPageRoute(builder: (context)=>DpScreen2(dpdata:DpPlans[index]['dp'])));
      //         },
      //       );
      //   }
      // ),
    );
  }
}