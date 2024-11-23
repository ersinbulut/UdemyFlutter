import 'package:back_stack_kullanimi/SonucEkrani.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget {
  @override
  _OyunEkraniState createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oyun Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Oyun Bitti"),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
