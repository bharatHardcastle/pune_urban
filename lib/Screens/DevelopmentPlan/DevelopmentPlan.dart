import 'package:flutter/material.dart';

class DevelopmentPlan extends StatefulWidget {
  const DevelopmentPlan({Key key}) : super(key: key);

  @override
  State<DevelopmentPlan> createState() => _DevelopmentPlanState();
}

class _DevelopmentPlanState extends State<DevelopmentPlan> {

  List<String> images = [
    "assets/Images/site.png",
    "assets/Images/zone.png",
    "assets/Images/reportcertificateissue.png",
    "assets/Images/dpplan.png",
  ];
  var name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Development Plan',style: TextStyle(color: Colors.black)
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFF8D882),
        elevation: 0.0,
      ),
      // backgroundColor:Color(0xfffffab9),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(
            padding:EdgeInsets.only(left: 12,right: 12),
            height: MediaQuery.of(context).size.height*0.50,
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 25.0
              ),
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                    onTap: (){
                      if(index==0){
                        Navigator.pushNamed(context, '/siteplan');
                      }
                      else if(index==1){
                        Navigator.pushNamed(context, '/zonecertificate');
                      }
                      else if(index==2){
                        Navigator.pushNamed(context, '/certificateissue');
                      }
                      else if(index==3){
                        Navigator.pushNamed(context, '/dpplanspublished');
                      }
                    },
                    child: Image.asset(images[index])
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



