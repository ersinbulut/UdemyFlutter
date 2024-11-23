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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String resimAdi = "django.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage.assetNetwork(
              placeholder: "resimler/placeholder.png",
              image: "http://kasimadalan.pe.hu/filmler/resimler/$resimAdi",
            ),
            ElevatedButton(
              child: Text("Resim 1"),
              onPressed: (){

                setState(() {
                  resimAdi = "django.png";
                });
              },
            ),
            ElevatedButton(
              child: Text("Resim 2"),
              onPressed: (){
                setState(() {
                  resimAdi = "inception.png";
                });
              },
            ),
          ],
        ),
      ),

    );
  }
}
