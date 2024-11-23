import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool kontrol = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kodlama Teknikleri"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
                visible: kontrol,
                child: Text("Merhaba")
            ),
            RaisedButton(
              child: Text("Durum 1"),
              onPressed: (){
                setState(() {kontrol = true;});
              },
            ),
            RaisedButton(
              child: Text("Durum 2"),
              onPressed: (){
                setState(() {kontrol = false;});
              },
            ),
          ],
        ),
      ),
      
    );
  }
}
