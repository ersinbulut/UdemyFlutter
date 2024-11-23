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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<int> faktoriyelHesapla(int sayi) async {
    int sonuc = 1;

    for(var i=1;i<=sayi;i++){
      sonuc = sonuc * i;
    }

    return sonuc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<int>(
              future: faktoriyelHesapla(5),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  print("Hata sonucu : ${snapshot.error}");
                }

                if(snapshot.hasData){
                  return Text("Sonuç : ${snapshot.data}");
                }else{
                  return Text("Gösterilecek Veri Yok");
                }

              },
            ),
          ],
        ),
      ),

    );
  }
}
