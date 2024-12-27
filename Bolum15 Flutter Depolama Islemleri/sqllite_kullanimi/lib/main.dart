import 'package:flutter/material.dart';
import 'Kisiler.dart';
import 'Kisilerdao.dart';

void main() {
  runApp(MyApp());
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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> kisileriGoster() async {
    var liste = await Kisilerdao().tumKisiler();

    for(Kisiler k in liste){
      print("*************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yaş : ${k.kisi_yas}");
    }
  }

  Future<void> ekle() async {
    await Kisilerdao().kisiEkle("Ece", 54);
  }

  Future<void> sil() async {
    await Kisilerdao().kisiSil(3);
  }

  Future<void> guncelle() async {
    await Kisilerdao().kisiGuncelle(4, "Yeni Ece", 99);
  }

  Future<void> kayitKontrol() async {
    int sonuc = await Kisilerdao().kayitKontrol("ahmetx");
    print("Veritabanında ahmet sayısı : $sonuc");
  }

  Future<void> getir() async {
      var kisi = await Kisilerdao().kisiGetir(2);

      print("******KİŞİ GETİR*******");
      print("Kişi id : ${kisi.kisi_id}");
      print("Kişi ad : ${kisi.kisi_ad}");
      print("Kişi yaş : ${kisi.kisi_yas}");

  }

  Future<void> aramaYap() async {
    var liste = await Kisilerdao().kisiArama("et");

    for(Kisiler k in liste){
      print("*************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yaş : ${k.kisi_yas}");
    }
  }

  Future<void> rasgele() async {
    var liste = await Kisilerdao().rasgele2kisiGetir();

    for(Kisiler k in liste){
      print("*************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yaş : ${k.kisi_yas}");
    }
  }

  @override
  void initState() {
    super.initState();
    //ekle();
    //sil();
    //guncelle();
    //kayitKontrol();
    //getir();
    //kisileriGoster();
    //aramaYap();
    rasgele();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sqllite kullanimi"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}
