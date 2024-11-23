import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Başlık",style: TextStyle(color: Colors.white,fontSize: 16.0),),
            Text("Alt Başlık",style: TextStyle(color: Colors.white,fontSize: 12.0),),
          ],
        ),
        centerTitle: false,
        leading: IconButton(
          tooltip: "Menu Icon",
          icon: const Icon(Icons.dehaze),
          onPressed: (){
            print("Menu Icon Tıklandı");
          },
        ),
        actions: [
          TextButton(
            child: const Text("ÇIKIŞ",style: TextStyle(color: Colors.white),),
            onPressed: (){
              print("Çıkış Tıklandı");
            },
          ),
          IconButton(
            tooltip: "Bilgi",
            icon: Icon(Icons.info_outline),
            onPressed: (){
              print("Bilgi Tıklandı");
            },
          ),
          PopupMenuButton(
            child: Icon(Icons.more_vert),
            itemBuilder: (context) => const [
               PopupMenuItem(
                value: 1,
                child: Text("Sil"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Güncelle"),
              ),
            ],
            onSelected: (menuItemValue){
              if(menuItemValue == 1){
                print("Sil tıklandı");
              }
              if(menuItemValue == 2){
                print("Güncelle tıklandı");
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),

    );
  }
}
