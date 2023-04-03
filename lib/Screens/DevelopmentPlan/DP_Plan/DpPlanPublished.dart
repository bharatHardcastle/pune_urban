import 'package:flutter/material.dart';

import 'DpPlanScreen4.dart';
import 'DpPlanScreen5.dart';
import 'DpScreen2.dart';
import 'DpScreen3.dart';


class DpPlanPublished extends StatefulWidget {
  const DpPlanPublished({Key key}) : super(key: key);

  @override
  State<DpPlanPublished> createState() => _DpPlanPublishedState();
}

class _DpPlanPublishedState extends State<DpPlanPublished> {

  final DpPlans = [
          {
            "dpplanname": "Old Development Plan",
            "dp": [
                 {
                   //"Title":"Sanctioned DP 1966",
                   "dp1": [
                     {"da1":"Sanctioned DP 1966"},
                     {"da1":"Planning District 1 unit 1B (Parwati,Munjeri,Dhankawadi)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%201%20unit%201B.jpg"},
                     {"da1":"Planning District 2 (Kothrud,Hingane)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%202.jpg"},
                     {"da1":"Planning District 3 unit 1A (Bhamburda,Yerandavna)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%203%20%20unit%201%20A.jpg"},
                     {"da1":"Planning District 3 unit 1A part (Bhamburda,Yerandavna)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%203%20%20unit%201%20A%20prt.jpg"},
                     {"da1":"Planning District 3 unit 1A (Parvati, Munjeri)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%203%20unit%201A.jpg"},
                     {"da1":"Planning District 3 unit 1A part(Parvati, Munjeri)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%203%20unit%201A%20prt.jpg"},
                     {"da1":"Planning District 3 unit 1B (West of TPS Poona)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%203%20unit%201B.jpg"},
                     {"da1":"Planning District 4 part(Aundh,Pashan)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%204%20prt.jpg"},
                     {"da1":"Planning District 4(Aundh,Pashan)","url":"https://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%204.jpg"},
                     {"da1":"Planning District 5(Yeraravada,Lohogaon)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%205.jpg"},
                     {"da1":"Planning District 6(Mali Munjeri,Ghorpuri)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%206.jpg"},
                     {"da1":"Planning District 7(Mali Munjeri,Ghorpuri)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%207.jpg"},
                     {"da1":"Planning District 7 part (Hadapsar,Mundhava)","url":"http://pmc.gov.in/Dp_old_final/DP%201966_%20scan%20images/Planning%20District%207%20prt.jpg"},
                ],
              },
              {
                //"Title":"Sanctioned DP 1987 Sector 1",
                "dp1": [
                      {"da1":"Sanctioned DP 1987 Sector 1"},
                      {"da1":"Sheet-1 (Part of Kasba Peth)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20I/001.jpg"},
                      {"da1":"Sheet-2 (Part of Kasbe Pune)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20I/002.jpg"},
                      {"da1":"Sheet-3 (Part of Shaniwar Peth)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20I/003.jpg"},
                      {"da1":"Sheet-4 (Part of TPS-1,Kasba Peth,Shaniwar Peth,Mangalwar Peth,Somwar Peth,Rasta Peth,Ganesh Peth,Raviwar Peth,Budhwar Peth)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20I/004.jpg"},
                      {"da1":"Sheet-9 (Nana Peth,Bhawani Peth)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20I/009.jpg"},
                      {"da1":"Sheet-10 (Part of Sadashiv Peth)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20I/010.jpg"},
                      {"da1":"Sheet-11 (Part of Shukrawar Peth,Guruwar Peth,Ganj Peth,Ghorpade Peth)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20I/011.jpg"},
                   ],
               },
              {
                //"Title":"Sanctioned DP 1987 Sector 2 to 6",
                "dp1": [
                      {"da1":"Sanctioned DP 1987 Sector 2 to 6"},
                      {"da1":"Sheet-1 (No Map)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/001.jpg"},
                      {"da1":"Sheet-2 (Part of Khadki Cantonment Area)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/002.jpg"},
                      {"da1":"Sheet-3 (Part of Lohagaon,Dhanori,Yerwada)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/003.jpg"},
                      {"da1":"Sheet-4 (Part of Lohgaon)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/004.jpg"},
                      {"da1":"Sheet-5 (Part of Aundh,Pashan)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/005.jpg"},
                      {"da1":"Sheet-6 (Part of Bopodi,Bhamburda,TPS-1,Sangamwadi TPS,Yerwada)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/006.jpg"},
                      {"da1":"Sheet-7 (Part of Yerwada,Wadgaon Sheri,Mundhwa,Ghorpadi,Koregaon Park)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/007.jpg"},
                      {"da1":"Sheet-h (Part of Mundhwa,Hadapsar)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/008.jpg"},
                      {"da1":"Sheet-9 (Part of Pashan,Kothrud,Hingne BK)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/009.jpg"},
                      {"da1":"Sheet-10 (Part of TPS-1,TPS-3,Parvati,All Peth Area)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/010.jpg"},
                      {"da1":"Sheet-11 (Part of Pune Cantonment,Ghorpadi,Hadapsar,Wanawadi,Bibvewadi,TPS-3)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/011.jpg"},
                      {"da1":"Sheet-12 (Part of Hadapsar)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/012.jpg"},
                      {"da1":"Sheet-13 (Part of Hingne BK)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/013.jpg"},
                      {"da1":"Sheet-14 (Part of Katraj,Dhankawadi,Bibvewadi)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/014.jpg"},
                      {"da1":"Sheet-15 (Part of Bibvewadi,Kondhwa KH)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/015.jpg"},
                      {"da1":"Sheet-16 (Not open)","url":"http://pmc.gov.in/Dp_old_final/1987%20DP%20Sec%20II%20to%20VI/01.jpg"},
                ],
              }
            ]
          },
          {
            "dpplanname": "Draft Plan for old PMC Limit u/s 26(1)",
            "dp": [
              {
                //"Title":"Sanctioned DP 1966",
                "dp1": [
                  {"da1":"Sanctioned DP 1992 u/s 26(1) on 28/03/2013 Sector 1"},
                  {"da1":"Sector 1 of 1 Navi Peth,Sadashiv Peth,Narayan Peth,Shaniwar Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_1.jpg"},
                  {"da1":"Sector 1 of 2 Budhwar Peth,Shaniwar wada,Shaniwar Peth,Kasba Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_2.jpg"},
                  {"da1":"Sector 1 of 3 Nana Peth,Budhwar Peth,Raviwar Peth,Ganesh Peth,Rasta Peth,Somwar Peth,Kasba Peth,Mangalwar Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_3.jpg"},
                  {"da1":"Sector 1 of 4 Rasta Peth,Somwar Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_4.jpg"},
                  {"da1":"Sector 1 of 5 Navi Peth,Sadashiv Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_5.jpg"},
                  {"da1":"Sector 1 of 6 Shukrawar Peth,Sadashiv Peth,Narayan Peth,Budhwar Peth Shaniwar Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_6.jpg"},
                  {"da1":"Sector 1 of 7 Guruwar Peth,Ganj Peth,Bhavani Peth,Shukrawar Peth,Nana Peth,Budhwar Peth,Raviwar Peth,Ganesh Peth,Rasta Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_7.jpg"},
                  {"da1":"Sector 1 of h Bhavani Peth,Nana Peth,Rasta Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_8.jpg"},
                  {"da1":"Sector 1 of 9 Ghorpade Peth,Guruwar Peth,Shukrawar Peth,Sadashiv Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_9.jpg"},
                  {"da1":"Sector 1 of 10 Ghorpade Peth,Guruwar Peth,Ganj Peth,Bhavani Peth,Shukrawar Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_10.jpg"},
                ],
              },
              {
                //"Title":"Sanctioned DP 1987 Sector 1",
                "dp1": [
                  {"da1":"Sanctioned DP 1992 u/s 26(1) on 28/03/2013 Sector 2 to 6"},
                  {"da1":"Sector 2 to 6 of 1 Aundh,Bopodi","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_1.jpg"},
                  {"da1":"Sector 2 to 6 of 2 Yerawada,Kalas,Dhanori","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec_26_DP_SEC_I_26MARCH2013_2.jpg"},
                  {"da1":"Sector 2 to 6 of 3 Yerawada,Lohagaon,Wadgaon Sheri","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_3.jpg"},
                  {"da1":"Sector 2 to 6 of 4 Kothrud,Pashan","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_4.jpg"},
                  {"da1":"Sector 2 to 6 of 5 Kothrud,Erandawana,TPS-I,Suburban TPS,Bhambhura,Pashan,Aundh,Bopodi,Kothrud","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_5.jpg"},
                  {"da1":"Sector 2 to 6 of 6 Sangamwadi TPS,TPS-I,Suburban TPS,Koregaon Park,Ghorpadi,Kasbe Pune,Bhambhurda,Yerawada","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_6.jpg"},
                  {"da1":"Sector 2 to 6 of 7 Hadapsar,Sangamwadi TPS,Mundhwa,Ghorpadi,Yerawada,Wadgaon Sheri","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_7.jpg"},
                  {"da1":"Sector 2 to 6 of h Dhankawadi,Parvati,Hingne(BK),TPS-I,TPS-III,Kothrud,Erandawana","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_8.jpg"},
                  {"da1":"Sector 2 to 6 of 9 Dhankawadi,Kondhwa(KH),Bibvewadi,Parvati,TPS-III,Wanawadi,Ghorpadi","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_9.jpg"},
                  {"da1":"Sector 2 to 6 of 10 Kondhwa(KH),Wanawadi,Hadapsar,Ghorpadi","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_10.jpg"},
                  {"da1":"Sector 2 to 6 of 11 Katraj,Dhankawadi,Kondhwa(KH),Bibvewadi","url":"http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_11.jpg"},
                ],
              },
            ]
          },
          {
         "dpplanname": "Draft Plan for old PMC Limit u/s 28(4)",
            "dp": [
              {
                "dp1": [
                {"da1":"u/s 28(4) on 26/09/2015 Sector 1"},
                {"da1":"Sector 1 of 1 Navi Peth,Sadashiv Peth,Narayan Peth,Shaniwar Peth","url":"http://docs.google.com/viewerng/viewer?url=https://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%201.pdf"},
                {"da1":"Sector 1 of 2 Budhwar Peth,Shaniwar wada,Shaniwar Peth,Kasba Peth","url":"http://pmc.htgov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%202.pdf"},
                {"da1":"Sector 1 of 3 Nana Peth,Budhwar Peth,Raviwar Peth,Ganesh Peth, Rasta Peth,Somwar Peth,Kasba Peth,Mangalwar Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%203.pdf"},
                {"da1":"Sector 1 of 4 Rasta Peth,Somwar Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%203.pdf"},
                {"da1":"Sector 1 of 5 Navi Peth,Sadashiv Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%205.pdf"},
                {"da1":"Sector 1 of 6 Shukrawar Peth,Sadashiv Peth,Narayan Peth,Budhwar Peth Shaniwar Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%206.pdf"},
                {"da1":"Sector 1 of 7 anj Peth,Bhavani Peth,Shukrawar Peth, Nana Peth,Budhwar Peth,Raviwar Peth,Ganesh Peth,Rasta Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%207.pdf"},
                {"da1":"Sector 1 of h Bhavani Peth,Nana Peth,Rasta Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%208.pdf"},
                {"da1":"Sector 1 of 9 Ghorpade Peth,Guruwar Peth,Shukrawar Peth,Sadashiv Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%209.pdf"},
                {"da1":"Sector 1 of 10 Ghorpade Peth,Guruwar Peth,Ganj Peth,Bhavani Peth,Shukrawar Peth","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%2010.pdf"},
                ],
              },
              {
                "dp1": [
                  {"da1":"u/s 28(4) on 26/09/2015 Sector 2 to 6"},
                  {"da1":"Sector 2 to 6 of 1 Aundh,Bopodi","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%201.pdf"},
                  {"da1":"Sector 2 to 6 of 2 Yerawada,Kalas,Dhanori","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20II%20TO%20VI%20SHEET%20NO%202.pdf"},
                  {"da1":"Sector 2 to 6 of 3 Yerawada,Lohagaon,Wadgaon Sheri","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20II%20TO%20VI%20SHEET%20NO%203.pdf"},
                  {"da1":"Sector 2 to 6 of 4 Kothrud,Pashan","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20II%20TO%20VI%20SHEET%20NO%205.pdf"},
                  {"da1":"Sector 2 to 6 of 5 Kothrud,Erandawana,TPS-I,Suburban TPS,Bhambhura,Pashan,Aundh,Bopodi,Kothrud","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20I%20SHEET%20NO%205.pdf"},
                  {"da1":"Sector 2 to 6 of 6 Sangamwadi TPS,TPS-I,Suburban TPS,Koregaon Park,Ghorpadi,Kasbe Pune,Bhambhurda,Yerawada","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20II%20TO%20VI%20SHEET%20NO%206.pdf"},
                  {"da1":"Sector 2 to 6 of 7 Hadapsar,Sangamwadi TPS,Mundhwa,Ghorpadi,Yerawada,Wadgaon Sheri","url":"http//pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20II%20TO%20VI%20SHEET%20NO%208.pdf"},
                  {"da1":"Sector 2 to 6 of h Dhankawadi,Parvati,Hingne(BK),TPS-I,TPS-III,Kothrud,Erandawana","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20II%20TO%20VI%20SHEET%20NO%209.pdf"},
                  {"da1":"Sector 2 to 6 of 9 Dhankawadi,Kondhwa(KH),Bibvewadi,Parvati,TPS-III,Wanawadi,Ghorpadi","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20II%20TO%20VI%20SHEET%20NO%2010.pdf"},
                  {"da1":"Sector 2 to 6 of 10 Kondhwa(KH),Wanawadi,Hadapsar,Ghorpadi","url":"http://pmc.gov.in/Draft_Plan_Old_Village/28(4)/HD_pdf/SEC%2028(4)%20SEC%20II%20TO%20VI%20SHEET%20NO%2011.pdf"},
                ],
              },
            ]
         },
          {
            "dpplanname": "New Limit 23 Villages",
            "dp": [
                {
                  "dp1": [
                    {"da1": "Draft Development Plan"},
                    {
                      "da1": " Unit 1 Draft Plan",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT_1.pdf"
                    },
                    {
                      "da1": " Unit 2 Draft Plan  Bavdhan(Kh) and Kothrud",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT_2.pdf"
                    },
                    {
                      "da1": " Unit 3 Draft Plan Warje and Shiwane(p)",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT_3.pdf"
                    },
                    {
                      "da1": " Unit 4 Draft Plan  Hingane(Kh),Wadgaon(Bk) ,Wadgaon(Kh),Dhayari(P)and Pachgaon(Kuran)",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT_4.pdf"
                    },
                    {
                      "da1": " Unit 5 And 6 Draft Plan Dhankawadi and Ambegaon(Bk),Ambegaon(kh)(P)",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT_5&6.pdf"
                    },
                    {
                      "da1": " Unit 7 Draft Plan  Kondhwa(Kh),Kondhwa(BK) and Undri(P)",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT_7.pdf"
                    },
                    {
                      "da1": " Unit 8 Draft Plan Mohmadwadi and Hadapsar(P)",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT_8.pdf"
                    },
                    {
                      "da1": " Unit 9 Draft Plan Wadagaon Sheri and Kharadi",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT-9-1.pdf"
                    },
                    {
                      "da1": " Unit 9 Draft Plan Kharadi",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT-9-2.pdf"
                    },
                    {
                      "da1": " Unit 10 Draft Plan  Dhanori and Kalas",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/dp23villageplan21102008/P_UNIT_10.pdf"
                    },
                  ],
                },
                {
                  "dp1": [
                    {
                      "da1": "Part Sanctioned Date 17/05/2008 Unit-2 to 10 Road Maps and Gazette"
                    },
                    {
                      "da1": "Planning Unit No. 2 Bavdhan KH,Kothrud",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/Planning%20Unit%20No.2.jpg"
                    },
                    {
                      "da1": "Planning Unit No. 3 Warje,Shivne (P) ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/Planning%20Unit%20No.3.jpg"
                    },
                    {
                      "da1": "Planning Unit No. 4 Higne KH,Wadgaon BK,Wadgaon KH,Dhayari (P),Panchgaon Kuran",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/Planning%20Unit%20No.4.jpg"
                    },
                    {
                      "da1": "Planning Unit No. 5 & 6 Dhankwadi,Ambegaon BK,Ambegaon KH (P) & Katraj",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/Planning%20Unit%20No.5%20&%206.jpg"
                    },
                    {
                      "da1": "Planning Unit No. 7 Kondhwa KH,Kondhwa BK, & Undri (P) ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/Planning%20Unit%20No.7.jpg"
                    },
                    {
                      "da1": "Planning Unit No. 8 Mohmadwadi,Hadapsar (P) ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/Planning%20Unit%20No.8.jpg"
                    },
                    {
                      "da1": "Planning Unit No. 9 Wadgaon Sheri,Kharadi ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/Planning%20Unit%20No.9%20Kharadi.jpg"
                    },
                    {
                      "da1": "Planning Unit No. 9 Wadgaon Sheri,Kharadi ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/Planning%20Unit%20No.9_Vadgaonsheri.jpg"
                    },
                    {
                      "da1": "Planning Unit No. 10 Dhanori,Kalas ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/Planning%20Unit%20No.10.jpg"
                    },
                    {
                      "da1": "Gazette - 30/05/2009 Gazette - 30/05/2009",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_%20Road%20maps_17.05.2008_jpg/2009.05.30%20Rd,WW.Sewage%20Sanction.pdf"
                    },
                  ],
                },
                {
                  //"Title":"Sanctioned DP 1987 Sector 1",
                  "dp1": [
                    {"da1": " Part Sanctioned Date 18/09/2008"},
                    {
                      "da1": " DP Part Sanction 18/09/2008 Balewadi,Baner ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_1/18_09_2008_DP_Part_Sanction.jpg"
                    },
                    {
                      "da1": " EP 18/09/2008 Balewadi,Baner",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_1/18_09_2008_EP.jpg"
                    },
                  ],
                },
                {
                  "dp1": [
                    {
                      "da1": "Part Sanctioned Date 02/03/2012 Unit-2 to 10 Road Maps and Gazette"
                    },
                    {
                      "da1": "Unit No. 2 Bavdhan KH,Kothrud",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/UNIT_NO_2.jpg"
                    },
                    {
                      "da1": "Unit No. 3 Warje,Shivne (P)",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/UNIT_NO_3.jpg"
                    },
                    {
                      "da1": "Unit No. 4 Higne KH,Wadgaon BK,Wadgaon KH,Dhayari (P),Panchgaon Kuran ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/UNIT_NO_4.jpg"
                    },
                    {
                      "da1": "Unit No. 5 & 6 Dhankwadi,Ambegaon BK,Ambegaon KH (P) & Katraj",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/UNIT_NO_5_6.jpg"
                    },
                    {
                      "da1": "Unit No. 7 Kondhwa KH,Kondhwa BK, & Undri (P)",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/UNIT_NO_7.jpg"
                    },
                    {
                      "da1": "Unit No. 8 Mohmadwadi,Hadapsar (P)",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/UNIT_NO_8.jpg"
                    },
                    {
                      "da1": "Unit No. 9 Wadgaon Sheri,Kharadi ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/UNIT_NO_9.jpg"
                    },
                    {
                      "da1": "Unit No. 9A Wadgaon Sheri,Kharadi",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/UNIT_NO_9A.jpg"
                    },
                    {
                      "da1": "Unit No. 10 Dhanori,Kalas",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/UNIT_NO_10.jpg"
                    },
                    {
                      "da1": "Gazette -02/03/2012 Gazette -02/03/2012 ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/2012.03.02.pdf"
                    },
                    {
                      "da1": "EP Gazette -02/03/2012 EP Gazette -02/03/2012",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/2012.03.02%20EP%20Publish.pdf"
                    },
                    {
                      "da1": "DP Gazette -02/03/2012 DP Gazette -02/03/2012",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_02_03_2012/2012.03.02%20DP%20Sanction.pdf"
                    },
                  ],
                },
                {
                  "dp1": [
                    {
                      "da1": "Part Sanctioned Date 04/04/2012 Unit-2 to 10 Road Maps and Gazette"
                    },
                    {
                      "da1": "Unit No. 2 Bavdhan KH,Kothrud",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/UNIT_NO_2.jpg"
                    },
                    {
                      "da1": "Unit No. 3 Warje,Shivne (P)",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/UNIT_NO_3.jpg"
                    },
                    {
                      "da1": "Unit No. 4 Higne KH,Wadgaon BK,Wadgaon KH,Dhayari (P),Panchgaon Kuran ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/UNIT_NO_4.jpg"
                    },
                    {
                      "da1": "Unit No. 5 & 6 Dhankwadi,Ambegaon BK,Ambegaon KH (P) & Katraj ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/UNIT_NO_5_6.jpg"
                    },
                    {
                      "da1": "Unit No. 7 Kondhwa KH,Kondhwa BK, & Undri (P) ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/UNIT_NO_7.jpg"
                    },
                    {
                      "da1": "Unit No. 8 Mohmadwadi,Hadapsar (P) ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/UNIT_NO_8.jpg"
                    },
                    {
                      "da1": "Unit No. 9 Wadgaon Sheri,Kharadi ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/UNIT_NO_9.jpg"
                    },
                    {
                      "da1": "Unit No. 9A Wadgaon Sheri,Kharadi",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/UNIT_NO_9A.jpg"
                    },
                    {
                      "da1": "Unit No. 10 Dhanori,Kalas",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/UNIT_NO_10.jpg"
                    },
                    {
                      "da1": "Gazette EP Publish 04/04/2012 Gazette EP Publish 04/04/2012 ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/2012.04.04%20EP%20Publish.pdf"
                    },
                    {
                      "da1": "Gazette DP Sanction 04/04/2012 Gazette DP Sanction 04/04/2012 ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/2012.04.04%20DP%20Sanction.pdf"
                    },
                    {
                      "da1": "Gazette DCR EP Publish 04/04/2012 Gazette DCR EP Publish 04/04/2012 ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_04_04_2012/2012.04.04%20DCR%20EP-Publish.pdf"
                    },
                    {
                      "da1": "Gazette DCR Sanction 04/04/2012 Gazette DCR Sanction 04/04/2012",
                      "url": "http://pmc.gov.in/Draft_Plan_Old_Village/Sec26_DP_SEC_II_TO_VI_26march2013_9.jpg"
                    },
                  ],
                },
                {
                  "dp1": [
                    {"da1": "Proposed Modification u/s 37(1)(AAA 20/08/2013)"},
                    {
                      "da1": " Modification u/s 37 (1)(AAA) 20/08/2013 Balewadi,Baner",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_1/20.8.2013_37_1AAA.jpg"
                    },
                    {
                      "da1": " Gazette - Baner Balewadi Zone Change Balewadi,Baner",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_1/2013.08.20%20%20Baner%20Balewadi%20TP%20scheme,BT&%20ABZ%20Zone%20change%20_Sug.Obj-37(1)aaa.pdf"
                    },
                  ],
                },
                {
                  "dp1": [
                    {"da1": "Part sanctioned Date 30/08/2013"},
                    {
                      "da1": " EP Sanction 30/08/2013 Balewadi,Baner",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_1/30.8.2013_EP_SANCTION.jpg"
                    },
                    {
                      "da1": " Gazette - Baner Balewadi EP Sanction Balewadi,Baner",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_1/2013.08.30.Baner-Balewadi%20EP%20sanction.pdf"
                    },
                  ],
                },
                {
                  "dp1": [
                    {
                      "da1": "Part Sanctioned Date 13/02/2014 Unit 2 to 10 Road Maps and Gazette"
                    },
                    {
                      "da1": "Planning Unit No. 2 Bavdhan KH,Kothrud ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/Planning%20Unit%20No.2.pdf"
                    },
                    {
                      "da1": "Planning Unit No. 3 Warje,Shivne (P) ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/Planning%20Unit%20No.3.pdf"
                    },
                    {
                      "da1": "Planning Unit No. 4 Higne KH,Wadgaon BK,Wadgaon KH,Dhayari (P),Panchgaon Kuran ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/Planning%20Unit%20No.4.pdf"
                    },
                    {
                      "da1": "Planning Unit No. 5 and 6 Dhankwadi,Ambegaon BK,Ambegaon KH (P) & Katraj ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/Planning%20Unit%20No.5%20&%206.pdf"
                    },
                    {
                      "da1": "Planning Unit No. 7 Kondhwa KH,Kondhwa BK, & Undri (P) ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/Planning%20Unit%20No.7.pdf"
                    },
                    {
                      "da1": "Planning Unit No. 8 Mohmadwadi,Hadapsar (P) ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/Planning%20Unit%20No.8.pdf"
                    },
                    {
                      "da1": "Planning Unit No. 9 Kharadi Wadgaon Sheri,Kharadi ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/Planning%20Unit%20No.9%20Kharadi.pdf"
                    },
                    {
                      "da1": "Planning Unit No. 9 Vadgaon Sheri Wadgaon Sheri,Kharadi ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/Planning%20Unit%20No.9_Vadgaonsheri.pdf"
                    },
                    {
                      "da1": "Planning Unit No. 10 Dhanori,Kalas ",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/Planning%20Unit%20No.10.pdf"
                    },
                    {
                      "da1": "Gazette EP Sanction -13/02/2014 Gazette EP Sanction -13/02/2014",
                      "url": "http://pmc.gov.in/informpdf/dp23vill/Final/UNIT_NO_2_TO_10_13_02_2014_PDF/2014.2.13%20EP%20sanction%20sector%202%20to%2010.pdf"
                    },
                  ],
                },
                ],
              }
        ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
          title: new Text("Warning"),
          content: new Text("The Data in the next pages have very large size.Please make sure that you have high speed internet connection."),
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
      body: ListView.builder(
          itemCount: DpPlans.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(DpPlans[index]['dpplanname'].toString()),
            onTap:(){
              if(index==0){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DpScreen2(dpdata:DpPlans[index]['dp'])));
              }
              else if(index==1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DpScreen3(dpdata:DpPlans[index]['dp'])));
              }
              else if(index==2){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DpScreen4(dpdata:DpPlans[index]['dp'])));
              }
              else if(index==3){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DpScreen5(dpdata:DpPlans[index]['dp'])));
              }
            },
          )
      ),
    );
  }
}