import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_extend/share_extend.dart';

import '../../constants.dart';

class KnowYourOfficersDetails extends StatefulWidget {
  const KnowYourOfficersDetails({Key key, this.htmlElement}) : super(key: key);
  final htmlElement;

  @override
  State<KnowYourOfficersDetails> createState() => _KnowYourOfficersDetailsState();
}

class _KnowYourOfficersDetailsState extends State<KnowYourOfficersDetails> {
  ScreenshotController _screenshotController = ScreenshotController();
  void _saveImage(Uint8List uint8List) async {
    //final dir = await getExternalStorageDirectory();
    final dir = Directory('/storage/emulated/0/Download');
    DateTime now = DateTime.now();
    final myImagePath = dir.path + "/$now.jpeg";
    File imageFile = File(myImagePath);
    if(! await imageFile.exists()){
      await imageFile.create(recursive: true);
    } await imageFile.writeAsBytes(uint8List);
    print(myImagePath);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('File downloaded successfully'),
    ));

  }
  void _shareImage(Uint8List uint8List) async {
    final dir = await getTemporaryDirectory();
    final myImagePath = dir.path + "/myimg.jpeg";
    File imageFile = File(myImagePath);
    if(! await imageFile.exists()){
      imageFile.create(recursive: true);
    } imageFile.writeAsBytes(uint8List);
    print(myImagePath);
    ShareExtend.share(imageFile.path, "image");
  }
  @override
  Widget build(BuildContext context) {
    print('the passed element is ${widget.htmlElement}');
    var document = parse(widget.htmlElement);
    var result = document.getElementsByTagName('td');
    //var heading = document.getElementsByTagName('tr');

    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Know Your Officers',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme:IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
        backgroundColor:Color(0xfffffab9),
        elevation: 0.0,
      ),
      body:  Stack(
          children:[
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  //color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Screenshot(
                          controller: _screenshotController,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            color: Colors.white,
                            child: Column(
                              children: [
                                // Text(heading.first.text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                                GridView.builder(
                                  padding: EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 10, bottom: 10),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: result.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: width(context) /100),
                                  itemBuilder: (context, index) {
                                    final item = result[index].text;
                                    return  Container(
                                        decoration: BoxDecoration(
                                          //border: Border.
                                        ),
                                        child: Text(item,style: TextStyle(fontSize: 12,color: Colors.black),maxLines: 3,)
                                    )


                                    ;
                                  },
                                ),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              //alignment: Alignment.bottomCenter,
              bottom:height(context)*0.05,
              left: width(context)*0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: ()async{
                    // var status = await Permission.manageExternalStorage;
                    // print(status.isGranted);
                    // await Permission.manageExternalStorage.request();
                    // if (status.isGranted != true) {
                    //   print('first if condition');
                    //   // We didn't ask for permission yet or the permission has been denied before but not permanently.
                    await Permission.storage.request();
                    //
                    //
                    //   if(status.isGranted == true){
                    //     print('second if condition');
                    _screenshotController.capture(
                        delay: const Duration(microseconds: 10)
                    ).then((capturedImage) async {
                      print(capturedImage.runtimeType);
                      _saveImage(capturedImage);
                    }).catchError((onError) {
                      print(onError);
                    });
                    //   }else{
                    //     print('second else condition');
                    //     final snackBar = SnackBar(content: Text('Please allow storage permission'));
                    //
                    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //
                    //   }
                    //
                    //
                    // }else{
                    //print('first else condition');

                    // }

                  }, child: const Text('Download')),
                  SizedBox(width: width(context)*0.35,),
                  ElevatedButton(onPressed: (){
                    _screenshotController.capture(
                        delay: const Duration(microseconds: 10)
                    ).then((capturedImage) async {
                      print(capturedImage.runtimeType);
                      _shareImage(capturedImage);
                    }).catchError((onError) {
                      print(onError);
                    });
                  }, child: const Text('Share')),
                ],
              ),
            )
          ]
      ),
    );
  }
}

// @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(
  //         'Know Your Officers',
  //         style: TextStyle(color: Colors.black),
  //       ),
  //       //automaticallyImplyLeading: false,
  //       iconTheme:IconThemeData(color: Colors.black),
  //       backgroundColor:Color(0xfffffab9),
  //       elevation: 0.0,
  //     ),
  //     body: Center(
  //       child: SingleChildScrollView(
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
  //           //color: Colors.white,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Screenshot(
  //                   controller: _screenshotController,
  //                   child: Container(
  //                       //color: Colors.white,
  //                       child: Html(data: widget.htmlElement))
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   ElevatedButton(onPressed: ()async{
  //                     // var status = await Permission.manageExternalStorage;
  //                     // print(status.isGranted);
  //                     // await Permission.manageExternalStorage.request();
  //                     // if (status.isGranted != true) {
  //                     //   print('first if condition');
  //                     //   // We didn't ask for permission yet or the permission has been denied before but not permanently.
  //                     await Permission.storage.request();
  //                     //
  //                     //
  //                     //   if(status.isGranted == true){
  //                     //     print('second if condition');
  //                     _screenshotController.capture(
  //                         delay: const Duration(microseconds: 10)
  //                     ).then((capturedImage) async {
  //                       print(capturedImage.runtimeType);
  //                       _saveImage(capturedImage);
  //                     }).catchError((onError) {
  //                       print(onError);
  //                     });
  //                     //   }else{
  //                     //     print('second else condition');
  //                     //     final snackBar = SnackBar(content: Text('Please allow storage permission'));
  //                     //
  //                     //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //                     //
  //                     //   }
  //                     //
  //                     //
  //                     // }else{
  //                     //print('first else condition');
  //
  //                     // }
  //
  //                   }, child: const Text('Download')),
  //                   ElevatedButton(onPressed: (){
  //                     _screenshotController.capture(
  //                         delay: const Duration(microseconds: 10)
  //                     ).then((capturedImage) async {
  //                       print(capturedImage.runtimeType);
  //                       _shareImage(capturedImage);
  //                     }).catchError((onError) {
  //                       print(onError);
  //                     });
  //                   }, child: const Text('Share')),
  //
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
//}
