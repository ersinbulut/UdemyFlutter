import 'package:flutter/material.dart';
import 'package:sayfa_gecis_uygulamasi/Kisiler.dart';
import 'package:sayfa_gecis_uygulamasi/SayfaA.dart';

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

  @override
  Widget build(BuildContext context) {
    print("Çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Sayfa A'ya Git"),
              onPressed: (){

                var kisi = Kisiler(isim:"Ahmet",yas: 18,boy: 1.78,bekarMi: true,);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SayfaA(kisi: kisi,)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
