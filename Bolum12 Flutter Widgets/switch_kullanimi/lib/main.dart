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

  bool switchKontrol = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: switchKontrol,
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
              inactiveTrackColor: Colors.black54,
              inactiveThumbColor: Colors.black,
              onChanged: (veri){
                setState(() {
                  switchKontrol = veri;
                });

                print("Switch : $veri");
              },
            ),
            ElevatedButton(
              child: Text("Göster"),
              onPressed: (){
                print("Switch Durum : $switchKontrol");
              },
            ),
          ],
        ),
      ),

    );
  }
}
