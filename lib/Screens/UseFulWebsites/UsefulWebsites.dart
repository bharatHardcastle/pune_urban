import 'package:flutter/material.dart';

import 'WebviewForUrls.dart';

class UsefulWebsites extends StatefulWidget {
  const UsefulWebsites({Key key}) : super(key: key);

  @override
  State<UsefulWebsites> createState() => _UsefulWebsitesState();
}

class _UsefulWebsitesState extends State<UsefulWebsites> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text(
          'Useful Websites',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      body: new ListView.separated(
        //padding: const EdgeInsets.all(8),
        itemCount: website.length,
        itemBuilder: (BuildContext context, int index) {
          return new ExpansionTile(
            title: new Text(website[index].title, style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
            children: <Widget>[
              new Column(
                children: _buildExpandableContent(website[index]),
              ),

            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey,),
     ),
    );

    //   new ListView.builder(
    //     itemCount: website.length,
    //     itemBuilder: (context, i) {
    //       return new ExpansionTile(
    //         title: new Text(website[i].title, style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
    //
    //         children: <Widget>[
    //           new Column(
    //             children: _buildExpandableContent(website[i]),
    //           ),
    //
    //         ],
    //       );
    //     },
    //   ),
    // );
  }

  _buildExpandableContent(Website website) {

    List<Widget> columnContent = [];

    for (String content in website.contents)
      columnContent.add(
        GestureDetector(
          onTap:(){
            Navigator.push(context,MaterialPageRoute(builder:(context)=>WebviewForUrls(url:content,webtitle:website.title)));
          },
          child: new ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: new Text(content, style: new TextStyle(fontSize: 16.0),),
            ),
            //leading: new Icon(website.icon),
          ),
        ),
      );

    return columnContent;
  }
}

class Website {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Website(this.title, this.contents, this.icon);
}

List<Website> website = [
  Website(
    'Government of India',
    ['http://india.gov.in/'],
    Icons.motorcycle,
  ),
  Website(
    'Pune Muncipal Corporation',
    ['http://pmc.gov.in/en'],
    Icons.directions_car,
  ),
  Website(
    'Government of Maharashtra',
    ['http://www.maharashtra.gov.in/'],
    Icons.directions_car,
  ),
  Website(
    'Maharashtra Police',
    ['http://mahapolice.gov.in/'],
    Icons.directions_car,
  ),
  Website(
    'Pune Police',
    ['http://punepolice.co.in/'],
    Icons.directions_car,
  ),
  Website(
    'Pune Traffic Police',
    ['http://punepolice.co.in/traffic-branch.php'],
    Icons.directions_car,
  ),
  Website(
    'Pimpri-Chinchwad Muncipal Corporation',
    ['http://punecorporation.org'],
    Icons.directions_car,
  ),
  Website(
    'RTO Pune',
    ['http://rtopune.info'],
    Icons.directions_car,
  ),
  Website(
    'RTO Pimpri Chinchwad',
    ['http://www.mahatranscom.in'],
    Icons.directions_car,
  ),
  Website(
    'National Highway Authority of India',
    ['http://www.nhai.org'],
    Icons.directions_car,
  ),
  Website(
    'Mumbai Police',
    ['http://mumbaipolice.maharashtra.gov.in/'],
    Icons.directions_car,
  ),
  Website(
    'Collector Office Pune',
    ['http://pune.gov.in/'],
    Icons.directions_car,
  ),
  Website(
    'Divisional Commissioner Office Pune',
    ['http://www.divcompune.in'],
    Icons.directions_car,
  ),
  Website(
    'Pune Cantonment Board',
    ['http://www.punecantonmentboard.org/'],
    Icons.directions_car,
  ),
  Website(
    'Kirkee Cantonment Board',
    ['http://www.cbkirkee.org.in'],
    Icons.directions_car,
  ),
  Website(
    'National Informatics Centre',
    ['https://www.nic.in/'],
    Icons.directions_car,
  ),
  Website(
    'Center for Police Research',
    ['http://www.cprpune.org/'],
    Icons.directions_car,
  ),
  Website(
    'National Crime Records Bureau',
    ['http://ncrb.gov.in/'],
    Icons.directions_car,
  ),
];