import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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

  var tfgirdi = TextEditingController();

  Future<void> veriYaz() async {
    var ad = await getApplicationDocumentsDirectory();

    var uygulamaDosyalamaYolu = await ad.path;

    var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

    dosya.writeAsString(tfgirdi.text);

    tfgirdi.text = "";
  }

   Future<void> veriOku() async {
    try {
      // Uygulama belgeler dizinini al
      var ad = await getApplicationDocumentsDirectory();

      // Dizin yolunu al
      var uygulamaDosyalamaYolu = ad.path;

      // Dosya yolunu belirle
      var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

      // Dosyadan veri oku
      String okunanVeri = await dosya.readAsString();

      // Okunan veriyi TextField'a ata
      setState(() {
        tfgirdi.text = okunanVeri;
      });
    } catch (e) {
      // Hata durumunda ekrana veya loga yaz
      debugPrint("Hata: $e");
    }
  }
  Future<void> veriSil() async {

      var ad = await getApplicationDocumentsDirectory();

      var uygulamaDosyalamaYolu = await ad.path;

      var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

      if(dosya.existsSync()){
        dosya.delete();
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dosya İslemleri"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfgirdi,
                decoration: InputDecoration(
                  hintText: "Veri giriniz",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Yaz"),
                  onPressed: (){

                    veriYaz();
                  },
                ),
                ElevatedButton(
                  child: Text("Oku"),
                  onPressed: (){

                    veriOku();
                  },
                ),
                ElevatedButton(
                  child: Text("Sil"),
                  onPressed: (){

                    veriSil();
                  },
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
