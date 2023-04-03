import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQ',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      body:
    //   new ListView.separated(
    //     //padding: const EdgeInsets.all(8),
    //     itemCount: faq.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return new ExpansionTile(
    //         title: new Text(faq[index].title, style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
    //
    //         children: <Widget>[
    //           new Column(
    //             children: _buildExpandableContent(faq[index]),
    //           ),
    //         ],
    //       );
    //     },
    //     separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey,),
    //   ),
    // );
      new ListView.builder(
        itemCount: faq.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(faq[i].title, style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
            children: <Widget>[
              new Column(
                children: _buildExpandableContent(faq[i]),
              ),

            ],
          );
        },
      ),
    );
  }

  _buildExpandableContent(FAQ faq) {

    List<Widget> columnContent = [];

    for (String content in faq.contents)
      columnContent.add(
        new ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: new Text(content,style: new TextStyle(fontSize: 15.0),),//style: new TextStyle(fontSize: 15.0),
          ),
          //leading: new Icon(website.icon),
        ),
      );

    return columnContent;
  }
}

class FAQ {
  final String title;
  List<String> contents = [];

  FAQ(this.title, this.contents);
}

List<FAQ> faq = [
  FAQ(
    'Which documents are require for submission of building permission proposal?',
    ['List of documents for submission of building permission proposal are given below:\n1. Application form (MRTP form & Development form)\n2.  Licence Engineer/Architect registration copy\n3. Ownership document -latest copy of 7/12 extract/property card/ B. FORM(Applicable in TP Scheme)\n4. Proposed building drawing -5 copies\n5. Demarcation copy (Within 4 year of application)\n6. copy of sanction layout (if applicable)\n7. Zoning demarcation h. NOC from Land acquisition department, PMC\n9. Property Tax clearance certificate\n10. Appointment letter of Structural Engineer\n11. Title &  search report\n12. ULC order (If applicable)\n13. Shapath patra  & Band patra (Rs.300/- Stamp paper)\n14. Copy of Registered power of attorney\n15. No objection certificate from water supply department (If applicable)\n16. No objection certificate from fire department (If applicable)\n17. No objection certificate from charity Commissioner (In case of Trust Property)\n18. No objection certificate from air force department (If applicable)\n19. No objection Certificate from Railway Department, MIDC, Maharashtra Pollution control Board, Central Pollution control Board, The district executive magistrate Etc  (If  Applicable)\n20. No objection certificate from labour commissioner (If Applicable)\n21. No objection certificate from Up Nibhandak (Deputy Registrar)(applicable for Society redevelopment project\n'],
  ),
  FAQ(
    'What is minimum plot area required for building permission?',
    ['As per sanction development control rule clause13.4 ,20.00 Sq.Mtr is minimum plot area required for building permission.'],
  ),
  FAQ(
    'How & Where we get development control rule copy?',
    ['Copy of Development control rule is available Pune corporation’s  website www.punecorporation.org,. The details path & link are as below:\n'
      'A.For Pune Municipal Corporation old city limit\n'
      'Path:http://www.punecorporation.org-Development Plan-DC Rules Old Limits\n'
      'Link:http://www.punecorporation.org/informpdf/DC%20RULES_OLDLIMIT.pdf\n\n'

      'As per MRTP act 1966 Section 26(1), Development control rule submitted to Government for Pune Municipal Corporation old city limit\n'
      'Path:http://www.punecorporation.org-Draft Plan for old PMC Limit u/s 26(1)\n'
      'Link:http://www.punecorporation.org/dpoldvill.aspx\n\n'

      'As per MRTP act 1966 Section 28(4), Development control rule Published by Government for Pune Municipal Corporation old city limit\n'
      'PAth:http://www.punecorporation.org- Draft Plan for old PMC Limit u/s 28(4)\n'
      'Link:http://www.punecorporation.org/DP_corrected_HD.aspx\n\n'

      'As per MRTP act 1966 Section 30, Development control rule Published by Government for Pune Municipal Corporation old city limit\n'
      'Path:http://www.punecorporation.org- Draft Plan for old PMC Limit u/s 28(4)\n'
      'Link:http://www.punecorporation.org/DP_corrected_HD.aspx\n\n'

      'B.For Pune Municipal Corporation Extended city limit (New 23 Villages)\n'
      'Path:http://www.punecorporation.org- DP Plan 23 Villages\n'
      'Link:http://www.punecorporation.org/dp23vill.aspx\n\n'],
  ),
  FAQ(
    'What is a procedure of sanctioning of updated building proposal?',
    ['following are the steps for sanctioning of updated building proposal\n'
    '•	Perform PreDCR by Lic.Arch/Engineer\n'
    '•	Submission of PreDCR via Online\n'
    '•	Getting scrutiny challan after submission of proposal\n'
    '•	Physical submission of file along with paid  scrutiny challan & requisite documnets in Building development department\n'
    '•	Scrutiny of proposal from Building Inspector(AutoDCR cell)\n'
    '•	Site visit by Building Inspector\n'
    '•	After completion technical and legal fulfilment in the building proposal, proposal is put up for sanctioning to Deputy Engineer/Executive Engineer (As per Case type)\n'
    '•	Special Building proposal like Petrol pump, Proposal under R7, Zone change etc are sanctioned by Hon. Municipal Commissioner.\n'
    '•	development charges/premium charges challans are issued After sanctioning building proposal\n'
    '•	After payment of challans commencement certificate alongwith drawing  is issued by.\n\n'],
  ),
  FAQ(
    'How do we know that particular building have commencement certificate /Completion Certificate?',
    ['This information is available  on following website of pmc http://www.punecorporation.org – online service – building sanction/ 	registrations.\n'
    '(Link:-http://203.153.37.242/bpams/PMC/subscriberlogin.aspx)\n'
    'Also requisite information are available at  (Zone wise) Building permission department\n'
    'Zone No.:	1,4,5,6\n'
    'Office Address:	Building Permission Department, Pune Municipal  Corporation  Main Building,Shivajinagar,Pune-411005\n'
    'Zone No.:	2,3\n'
    'Office Address:	Building Permission Department, Sawarkar Bhavan,Near Balgandharva theatre, Pune Municipal  Corporation ,Shivajinagar,Pune-411005\n'
    'Zone No.:	7\n'
    'Office Address:	Building Permission Department, Tilak Road Ward Office,Hirabaugh,Tilak Road,Pune Municipal  Corporation ,Pune\n\n'],
  ),
  FAQ(
    'Specify FSI Index available In Pune Municipal Corporation limit?',
    ['A.Old City Limit: As per sanction development control rule following are the details of FSI  Index available\n'
    'Congested Area:\n'
    'Upto 9.0 Mtr road width =	1.5 for residential purpose\n'
    'Road width more than 9.0 =	1.5 for residential purpose & 0.5 for Commercial purpose\n'
    'In non- congested area =	1.0\n'
    'Also for other various building proposal type, FSI specified in sanction development\n'
    'Control rule, clause no.N 2.2.2 to 2.2.h are applicable.\n\n'

    'B. New City Limit:  As per sanction development control rule clause M-16 following are the details of FSI index available\n'
    'In case of unauthorised sub division, the FSI shall be restricted to .75 in non congested area and 1.0 in congested area.\n'
     'In case sanction layout, FSI permissible is 1.0\n'
     '1987 sanctioned development control rule are applicable for Gaothan  area shown In newly merged village in DP\n\n'],
  ),
  FAQ(
    'What are the Premium & Other charges applicable for Building Permission?',
    ['Following are the details of Premium & Other charges applicable for Building Permission (Current rate)\n'

      'Sr.No:			1\n'
      'Fee:			Scrutiny Fee\n'
      'Residential:		Rs.50 per 10 Sq.Mtr ,Subject to Minimum Rs.300/- & Maximum Rs.30000/-\n'
      'Commercial:	Rs.100 per 10 Sq.Mtr ,Subject to Minimum Rs.2000/- & Maximum Rs.50000/-\n'
      'Industrial:		Rs.100 per 10 Sq.Mtr ,Subject to Minimum Rs.2000/- & Maximum Rs.50000/-\n\n'

      'Sr.No:			2\n'
      'Fee:			Land Development Fee\n'
      'Residential:		0.5% of open Plot Rate from Ready reckoner\n'
      'Commercial:	1.0% of open Plot Rate from Ready reckoner\n'
      'Industrial:		0.75% of open Plot Rate from Ready reckoner\n\n'

      'Sr.No:			3\n'
      'Fee:			Building Development Charges\n'
      'Residential:		2.0% of open Plot Rate from Ready reckoner\n'
      'Commercial:	4.0% of open Plot Rate from Ready reckoner\n'
      'Industrial:		3.0% of open Plot Rate from Ready reckoner\n\n'

      'Premium Charges—————————\n\n'

      'Sr.No:			I\n'
      'Fee:			Balcony Charges, Zone A, Zone B, Zone C, Zone D\n'
      'Residential:		 Rs.2500 Per Sq.Mtr, Rs.3000 Per Sq.Mtr, Rs.1750 Per Sq.Mtr, Rs.1000 Per Sq.Mtr\n'
      'Commercial:	 —————, —————, Rs.3000 Per Sq.Mtr, Rs.1750 Per Sq.Mtr\n'
      'Industrial:		—————, —————,—————, —————,\n\n'

      'Sr.No:			II\n'
      'Fee:			Stair, Passage, Lift Area, Zone A, Zone B, Zone C, Zone D\n'
      'Residential:		60% of open Plot Rate from Ready reckoner  or below mentioned charges whichever is more. , Rs.4800 Per Sq.Mtr, Rs.5400 Per Sq.Mtr, Rs.3100 Per Sq.Mtr, Rs.2400 Per Sq.Mtr\n'
      'Commercial:	120% of open Plot Rate from Ready reckoner\n'
      'Industrial:		120% of open Plot Rate from Ready reckoner\n'


      'Sr.No:			III\n'
      'Fee:			Terrace\n'
      'Residential:		40% of open Plot Rate from Ready reckoner\n'
      'Commercial:	80% of open Plot Rate from Ready reckoner\n'
      'Industrial:		80% of open Plot Rate from Ready reckoner\n\n'


      'Sr.No:			IV\n'
      'Fee:			Upkar\n'
      'Residential:		1% of open Plot Rate from Ready reckoner for total building area\n'
      'Commercial:	1.5% of open Plot Rate from Ready reckoner for total building area\n'
      'Industrial:		1.5% of open Plot Rate from Ready reckoner for total building area\n\n'


      'Sr.No:			V\n'
      'Fee:			Colony line developmet (Water line)\n'
      'Residential:		Rs.3640 per meter ,Length consider= 1/4th length of total Perimeter of plot  & Rs.10550 lump sum for Plot area below 200 Sq.Mtr\n'
      'Commercial:	Rs.3640 per meter ,Length consider= 1/4th length of total Perimeter of plot  & Rs.10550 lump sum for Plot area below 200 Sq.Mtr\n'
      'Industrial:		Rs.3640 per meter ,Length consider= 1/4th length of total Perimeter of plot  & Rs.10550 lump sum for Plot area below 200 Sq.Mtr\n\n'

      'Sr.No:			VI\n'
      'Fee:			LBT (As applicable), Building Height upto 4th floor, Building Height from 4th to 6th floor, Building Height more than 6th floor\n'
      'Residential:		Rs.100 Per Floor/Per Sq.Mtr, Rs.150 Per Floor/Per Sq.Mtr, Rs.200 Per Floor/Per Sq.Mtr\n'
      'Commercial:	—————\n'
      'Industrial:		—————'],
  ),
  FAQ(
    'What ois the maximum height permissible in Pune Municipal Corporation limit?',
    ['Maximum height upto 100 meter is permissible.\n'
'Details of height permissible is available in sanction development control rule table no.27 &Clause No.21.6.6.\n'
'Also following government notification is applicable for building height in between 36 to 100 meter.\n\n'

'A.PMC Old limit\n'
'--------------------------------------\n\n'
'Govt.Notification No. TPS1807/252/PR.KR.630/07/NAVI-13 DATED:15/11/2007\n'

'Table showing building height details are under :\n'

'Sr.No.:	1'
'Permissible height of high rise building:	More than 36 mtr upto 40 mtr\n'
'Minimum approach road required Mtr:	2000\n'
'Minimum plot area required Sq.Mtr:	12\n'
'Set back margin except front margin Mtr:	9\n'
'Front margin Mtr:	9\n\n'


'Sr.No.:	2\n'
'Permissible height of high rise building:	More than 40 mtr upto 50 mtr\n'
'Minimum plot area required Sq.Mtr:	4000\n'
'Minimum approach road required Mtr:	15\n'
'Set back margin except front margin Mtr:	9\n'
'Front margin Mtr:	12\n\n'


'Sr.No.:	3\n'
'Permissible height of high rise building:	More than 50 mtr upto 70 mtr\n'
'Minimum plot area required Sq.Mtr:	6000\n'
'Minimum approach road required Mtr:	18\n'
'Set back margin except front margin Mtr:	10\n'
'Front margin Mtr:	12\n\n'


'Sr.No.:	4\n'
'Permissible height of high rise building:	More than 70 mtr upto 100 mtr\n'
'Minimum plot area required Sq.Mtr:	8000\n'
'Minimum approach road required Mtr:	24\n'
'Set back margin except front margin Mtr:	12\n'
'Front margin Mtr:	12\n\n'

'A.PMC Extended(New) limit\n'
'--------------------------------------\n\n'
'Govt.Notification No. TPS1806/2125/PR.KR.435(A)/06/NAVI-13 DATED:12/07/2010\n'
'Table showing building height details are under  (DC rule No.21.6.6)\n\n'

'Sr.No.:	1\n'
'Permissible height of high rise building:	More than 36 mtr upto 50 mtr\n'
'Minimum plot area required Sq.Mtr:	2000\n'
'Minimum approach road required Mtr:	12\n'
'Set back margin except front margin Mtr:	9\n'
'Front margin Mtr:	9\n\n'


'Sr.No.:	2\n'
'Permissible height of high rise building:	More than 50 mtr upto 70 mtr\n'
'Minimum plot area required Sq.Mtr:	6000\n'
'Minimum approach road required Mtr:	18\n'
'Set back margin except front margin Mtr:	10\n'
'Front margin Mtr:	12\n\n'


'Sr.No.:	3\n'
'Permissible height of high rise building:	More than 70 mtr upto 100 mtr\n'
'Minimum plot area required Sq.Mtr:	8000\n'
'Minimum approach road required Mtr:	24\n'
'Set back margin except front margin Mtr:	12\n'
'Front margin Mtr:	12\n\n'
    ],
  ),
  FAQ(
    'Whether TDR is applicable on plot? How much .Please give details?',
    ['Yes. Maximum permissible TDR is govern as per government notification TPS/1813/3067/PR.Kr.122/12/MANAPA/NAVI-13 dated: 28/1/2016 & 02/05/2016 clause 5.4.1 as below :\n'
  'Sr.No.:	1\n'
  'Plots Fronting on Road width:9mt and above but less than 12\n'
  'Maximum permissible TDR Loading:	0.40\n\n'


  'Sr.No.:	2\n'
  'Plots Fronting on Road width:	       12mt and above but less than 18\n'
  'Maximum permissible TDR Loading:	0.65\n\n'


  'Sr.No.:	3\n'
  'Plots Fronting on Road width:18mt and above but less than 24\n'
  'Maximum permissible TDR Loading:	0.90\n\n'


  'Sr.No.:	4\n'
  'Plots Fronting on Road width:24mt and above but less than 30\n'
  'Maximum permissible TDR Loading:	1.15\n\n'


  'Sr.No.:	5\n'
  'Plots Fronting on Road width:Above than 30 mt.\n'
  'Maximum permissible TDR Loading:	1.4\n\n'
    ],
  ),
  FAQ(
    'Is building permission is given in Green zone?',
    ['Yes. As per uses mention in following clauses of sanction development control rule,construction is permissible in Green Zone.\n'

'A: Old Limit-Permission is as per sanction development control rule Clause No. M 7, Page.No.134 ,135& 205\n'

'B: New Limit-Along with old limit sanction development control rule Clause No.M 7, Page .No. 134,135 & 205, permission is applicable as per clause M-12 (A),P.No.14 in updated PMC limit sanction development control rule.\n\n'
    ],
  ),
  FAQ(
    'Weather Building permission will allow on BDP Reserved plots?',
    ['AS per Govt Gazette No.TPS/1814/697/ Sr.No.134/14/BDP/EP/ sanction /UD-13,\n'
    'Date:05/08/2015 specified used are allowed. No private construction is allowed.\n\n'
    ],
  ),
  FAQ(
    'For Building Completion certificate which documents are essential?',
    ['Following documents are essential for Building Completion Certificate-\n'
      '1.	Application in format\n'
      '2.	Building Completion certificate from Lic.Arch/Engg\n'
      '3.	Structure Engineers letter\n'
      '4.	Property Tax NOC\n'
      '5.	Completion Affidavit\n'
      '6.	Garden Department NOC\n'
      '7.	Fire Department NOC (if required)\n'
      'h.	Lift NOC (if required)\n'
      '9.	Mahrashtra State Pollution Control Board NOC (if required)\n'
      '10.	Part Completion Affidavit (Wherever applicable)\n'
      '11.	Solar system installation documents\n'
      '12.	Sewage treatment (STP) NOC (if required)\n'
      '13.	 Vermi composting NOC\n\n'
    ],
  ),
  FAQ(
    'For Plinth certificate which documents are essential?',
    ['For Plinth certificate following documents are essential\n'
    '1.	Application form\n'
    '2.	Architect letter for Completion of work upto Plinth level\n'
      '3.	Structural Engineers letter\n'
      '4.	Structure Design Details drawings\n'
      '5.	Site actual drawing Details\n\n'
    ],
  ),
  FAQ(
    'If I have property Tax Bill of Receipt then, it means my Building is legal?',
    ['No, if you have Tax Bill it doesn’t mean you have legal Building or  sanction building.\n\n'
    ],
  ),
  FAQ(
    'If developer has not satisfied all clauses of agreement with customer then where were customer give complents?',
    ['Developer doesn’t/fails to provide facilities according to clauses, there complaint should be registered at consumer court or civil court. If complaint against Building Permission or Sanctioned drawing that compliant should be registered at Building Development Department Pune Municipal Corporation.\n\n'
    ],
  ),
  FAQ(
    'If proposal is submitted at corporation for Building Sanction, how many days required for process of Commencement/Sanction.?',
    ['After submitted all essential documents with proposal as per M.R.T.P. 1966 Act clause 45 & Development Control rules within 60 days Sanction / Commencement Certificate will be issued.\n\n'
    ],
  ),
  FAQ(
    'When does Environment Clearance Certificate is essential in Building Permission process?',
    ['In plot/ land having construction area more than 20,000 sq.m. then it is essential to take Environment Clearance Certificate.\n\n'
    ],
  ),
  FAQ(
    'Weather old limit of Pune Municipal Corporation area Draft Development Control rules submitted to govt for sanction? Can we obtain copy of Draft Development Control?',
    ['Yes, Draft Development Control rules  for  old limit are submitted to state Government for approval.\n\n'
    ],
  ),
  FAQ(
    'Is any facility available in Pune Municipal Corporation for immediate Building Sanction? If available. then what is a procedure of Sanction?',
    ['Within 24 hrs proposals are sanction by Fast Track System in PMC.The information of Fast Track System is available on following website.http://www.punecorporation.org- online service –Fast Track modalities.\n'
      'Link-http://www.punecorporation.org/ informpdf/ City%20Engineer%20office/FAST TRACK modalities.pdf\n\n'
    ],
  ),
  FAQ(
    'In building permission department, what is the process of registration for Architect/Engineer?',
    ['Registration of architect is by council of architect. Licence to Engineer is given by PMC.This information is available on Pune Municipal Corporation website on  following path & link.http://www.punecorporation.org- online service – Building Sanction /registration.\n'
      'Link-http://203.153.37.242/bpams/PMC/subscriberlogin.aspxFor details information connect Building Development Department, Pune Municipal Corporation, Main Building, first floor, Shivajinagar, Pune-411005\n\n'
    ],
  ),
  FAQ(
    'Where does  details procedure is available for  structural Audit perform by Pune Municipal Corporation ?',
    ['This information is available on Pune Municipal Corporation website following\n'
    'link: http://www.punecorporation.org./informpdf/City%20Engineer%20office/Structural_Engg_list.pdf\n'
    'For details information connect Building Development Department, Pune Municipal Corporation, Main Building, first floor, Shivajinagar, Pune-411005'
    ],
  ),
];