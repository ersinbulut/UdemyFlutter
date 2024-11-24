import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetaySayfa extends StatefulWidget {
  String ulkeAdi;

  DetaySayfa({required this.ulkeAdi});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay"),
      ),
      body: Center(
        child: Text(widget.ulkeAdi,style: TextStyle(fontSize: 30),),
      ),

    );
  }
}
