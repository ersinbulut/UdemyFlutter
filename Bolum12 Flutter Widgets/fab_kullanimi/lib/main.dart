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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fab Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Yazınız",
              ),
            ),
            FloatingActionButton(
              onPressed: (){
                print("Fab 2 tıklandı");
              },
              tooltip: "Fab2",
              child: Icon(Icons.print),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          print("Fab 1 tıklandı");
        },
        label: Text("Fab"),
        icon: Icon(Icons.audiotrack),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.pinkAccent,
      ),
    );
  }
}
