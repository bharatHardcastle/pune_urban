import 'package:flutter/material.dart';
import 'package:pune_urban/splashscreen.dart';

import 'Models/thememodel.dart';
import 'Screens/AboutPmc.dart';
import 'Screens/BuildingDevelopment/ApprovedProjects.dart';
import 'Screens/BuildingDevelopment/BuildingDevelopmentDash.dart';
import 'Screens/BuildingDevelopment/FastTrackProjects.dart';
import 'Screens/BuildingDevelopment/OnGoingProjects.dart';
import 'Screens/Credits/Credits.dart';
import 'Screens/DevelopmentPlan/DP_Plan/DpPlanPublished.dart';
import 'Screens/DevelopmentPlan/DevelopmentPlan.dart';
import 'Screens/DevelopmentPlan/SitePlan.dart';
import 'Screens/DevelopmentPlan/SitePlan_Issue/SitePlanIssue.dart';
import 'Screens/DevelopmentPlan/Zone_certificate/ZoneCertificate.dart';
import 'Screens/FAQScreen.dart';
import 'Screens/Feedback.dart';
import 'Screens/LevelCertificate.dart';
import 'Screens/PMC/About_Us.dart';
import 'Screens/DashBoard.dart';
import 'Screens/PublicNotice.dart';
import 'Screens/WebViews/KnowYourOfficers.dart';
import 'Screens/PMC/PmcInformation.dart';
import 'Screens/ReadyReckonerRate/ReadyReckonerRateDash.dart';
import 'Screens/SevenTwelveData.dart';
import 'Screens/TDROnlineFile/TDROnlineFile.dart';
import 'Screens/UseFulWebsites/UsefulWebsites.dart';
import 'Screens/WebViews/KnowYourWard.dart';
import 'Screens/WebViews/knowBPDocumwnts.dart';
import 'Screens/gismapdata.dart';
import 'Screens/officersScreenMap.dart';
import 'Screens/puneBoundryWebView.dart';
/*
 * Created by Bharat on 26/7/2022.
 * ">=2.16.2 <3.0.0"
 */

// @dart=2.9

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/Dash': (BuildContext context) => DashBoard(),
        '/0': (BuildContext context) => AboutPmc(),
        '/AboutUs': (BuildContext context) => AboutUsPmc(),
        '/Information': (BuildContext context) => PmcInformation(),
        '/1': (BuildContext context) => KnowYourOfficers(),
        '/2': (BuildContext context) => KnowBpDocuments(),
        '/3': (BuildContext context) =>KnowYourWard(),
        '/4': (BuildContext context) => BuildingDevelopment(),
        '/5': (BuildContext context) =>DevelopmentPlan(),
        '/6': (BuildContext context) =>TDROnlineFile(),
        '/7': (BuildContext context) =>LevelCertificate(),
        '/8': (BuildContext context) =>PublicNotice(),
        '/9': (BuildContext context) =>ReadyReckonerRateDash(),
        '/10': (BuildContext context) =>puneBoundryWebview(),
        '/11': (BuildContext context) =>gisMapData(),
        '/12': (BuildContext context) => UsefulWebsites(),
        '/13': (BuildContext context) =>FeedbackForm(),
        '/14': (BuildContext context) =>Credits(),
        '/15': (BuildContext context) =>FAQScreen(),
        '/siteplan': (BuildContext context) =>SitePlan(),
        '/zonecertificate': (BuildContext context) =>ZoneCertificate(),
        '/certificateissue': (BuildContext context) =>SitePlanIssue(),
        '/dpplanspublished': (BuildContext context) =>DpPlanPublished(),
        '/Approved': (BuildContext context) =>ApprovedProjects(),
        '/On-Going': (BuildContext context) =>OnGoingProjects(),
        '/Fasttrack': (BuildContext context) =>FastTrackProjects(),
      },
      title: 'Pune Urban',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: SplashScreen(),
    );
  }
}
