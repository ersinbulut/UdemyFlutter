import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Uygulamanın başlık çubuğunda gösterilecek başlık
      debugShowCheckedModeBanner: false, // Debug banner'ını gizleme
      theme: ThemeData(
        primarySwatch: Colors.blue, // Uygulamanın ana renk paleti
        visualDensity: VisualDensity.adaptivePlatformDensity, // Görsel yoğunluk
      ),
      home: MyHomePage(), // Uygulamanın ana ekranı
    );
  }
}

class MyHomePage extends StatefulWidget {
  // StatefulWidget, kullanıcı etkileşimlerine göre değişebilen ekranlar için kullanılır.

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // MyHomePage'in durumunu yöneten sınıf

  int sayac = 0; // Uygulamanın açılış sayısını tutacak değişken

  Future<void> sayacKontrol() async {
    // Uygulamanın açılış sayısını SharedPreferences'tan alıp artıran ve kaydeden fonksiyon

    var sp = await SharedPreferences.getInstance(); // SharedPreferences'a erişim sağlama
    
    sayac = sp.getInt("sayac") ?? 0; // SharedPreferences'tan "sayac" anahtarına karşılık gelen değeri al, yoksa 0 olarak ayarla
    
    setState(() {
      sayac = sayac + 1; // Sayacı bir artır
    });
    
    sp.setInt("sayac", sayac); // Güncellenmiş sayacı SharedPreferences'a kaydet
  }

  @override
  void initState() {
    super.initState(); // StatefulWidget'in başlangıç durumunu ayarlama
    sayacKontrol(); // Uygulama başlatıldığında sayacKontrol() fonksiyonunu çağırma
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Prefences Sayac uygulamasi"), // Uygulamanın başlık çubuğu
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // İçerikleri dikey olarak ortala
          children: <Widget>[
            Text("Açılış Sayısı : $sayac", style: TextStyle(fontSize: 50)), // Açılış sayısını gösteren metin
          ],
        ),
      ),
    );
  }
}
