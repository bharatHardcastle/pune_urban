import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:photo_view/photo_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Widgets/Loading.dart';

class DpPlanPdfView extends StatefulWidget {
  final String url;
  final String name;
  const DpPlanPdfView({Key key, this.url, this.name}) : super(key: key);

  @override
  State<DpPlanPdfView> createState() => _DpPlanPdfViewState();
}

class _DpPlanPdfViewState extends State<DpPlanPdfView> {
  bool isLoading=true;
  final _key = UniqueKey();
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    print(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            widget.name,
            style: TextStyle(color: Colors.black),
          ),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xFFF8D882),
        elevation: 0.0,
      ),
      body:widget.url.contains('.pdf')?Center(
        child:PDF().fromUrl(
          widget.url,
          //placeholder: (double progress) => Center(child: Text('$progress %')),
          placeholder: (double progress) => CircularProgressIndicator( value: 20,color:Colors.green,strokeWidth:6,),
          errorWidget: (dynamic error) => Center(
              child: Center(
                  child: Icon(Icons.error),
              )
          ),//error.toString()
        ),
        // WebView(
        //   zoomEnabled: true,
        //   key: _key,
        //   onWebResourceError: (WebResourceError webviewer) {
        //     print("Internet Error");
        //   },
        //   initialUrl: widget.url,
        //   javascriptMode: JavascriptMode.unrestricted,
        //   onWebViewCreated: (WebViewController webViewController) {
        //     _controller.complete(webViewController);
        //   },
        // ),
          // onPageFinished: (finish) {
          //   setState(() {
          //     isLoading = false;
          //   });
          // },
      ):
      Center(
        child:
        CachedNetworkImage(
          //height:MediaQuery.of(context).size.height,
          imageBuilder: (context, imageProvider) => PhotoView(
            imageProvider: imageProvider,
          ),
          imageUrl: widget.url,
          placeholder: (context,url) => CircularProgressIndicator( value: 20,color:Colors.green,strokeWidth:6,),
          errorWidget: (context,url,error) => new Icon(Icons.error),
        ),
      ),
      // Center(
      //   child: CachedNetworkImage(
      //     //height:MediaQuery.of(context).size.height,
      //     imageUrl: widget.url,
      //     placeholder: (context,url) => CircularProgressIndicator( value: 20,color:Colors.green,strokeWidth:6,),
      //     errorWidget: (context,url,error) => new Icon(Icons.error),
      //   ),
      // )
    );
  }
}