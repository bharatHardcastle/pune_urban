import 'package:flutter/material.dart';

class officersScreenMap extends StatefulWidget {
  const officersScreenMap({Key key}) : super(key: key);

  @override
  State<officersScreenMap> createState() => _officersScreenMapState();
}

class _officersScreenMapState extends State<officersScreenMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Know Your Officers',
          style: TextStyle(color: Colors.black),
        ),
        //automaticallyImplyLeading: false,
        iconTheme:IconThemeData(color: Colors.black),
        backgroundColor:Color(0xfffffab9),
        elevation: 0.0,
      ),
    );
  }
}
