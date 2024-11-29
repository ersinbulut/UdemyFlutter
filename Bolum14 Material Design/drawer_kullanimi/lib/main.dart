import 'package:drawer_kullanimi/SayfaBir.dart';
import 'package:drawer_kullanimi/SayfaIki.dart';
import 'package:drawer_kullanimi/SayfaUc.dart';
import 'package:flutter/material.dart';

// Uygulamanın başlangıç noktası
void main() {
  runApp(const MyApp());
}

// Uygulamanın ana widget'ı
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // MaterialApp, uygulamanın temel yapısını oluşturur.
    return MaterialApp(
      // Uygulamanın başlığı
      title: 'Flutter Demo',
      // Hata ayıklama modunda gösterilecek banner'ı devre dışı bırakır.
      debugShowCheckedModeBanner: false,
      // Uygulamanın tema ayarları
      theme: ThemeData(
        // Ana renk
        primarySwatch: Colors.blue,
      ),
      // Ana ekran
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Ana ekran widget'ı
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Ana ekran widget'ının durumu
class _MyHomePageState extends State<MyHomePage> {
  // Sayfa listesi
  var sayfaListe = [SayfaBir(),SayfaIki(),SayfaUc()];
  // Seçili sekmenin indeksi
  int secilenIndeks = 0;
  @override
  Widget build(BuildContext context) {
    // Scaffold, uygulama ekranının temel yapısını oluşturur.
    return Scaffold(
      // AppBar, ekranın üst kısmında bulunan başlık çubuğudur.
      appBar: AppBar(
        // Başlık çubuğunun başlığı
        title: const Text("Drawer Kullanımı"),
        // Başlık çubuğunun rengi
        backgroundColor: Colors.deepPurple,
      ),
      // Ekranın ana içeriği
      body: sayfaListe[secilenIndeks],
      // Çekmece menü
      drawer: Drawer(
        // Çekmece menüsünün içeriği
        child: ListView(
          // İçeriğin padding'i
          padding: EdgeInsets.zero,
          // Çekmece menüsünün çocuk widget'ları
          children: [
            // Başlık bölümü
            const DrawerHeader(
              // Başlık bölümünün süslemeleri
              decoration: BoxDecoration(color: Colors.deepPurple,),
              // Başlık metni
              child: Text("Başlık Tasarımı",style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
            // Menü öğeleri
            ListTile(
              // Menü öğesinin başlığı
              title: const Text("Sayfa Bir"),
              // Menü öğesine tıklandığında çalışacak fonksiyon
              onTap: (){
                // Seçili sekmenin indeksini güncelle
                setState(() {secilenIndeks = 0;});
                // Çekmece menüsünü kapat
                Navigator.pop(context);
              },
            ),
            ListTile(
              // Menü öğesinin başlığı
              title: const Text("Sayfa İki",style: TextStyle(color: Colors.pink),),
              // Menü öğesine tıklandığında çalışacak fonksiyon
              onTap: (){
                // Seçili sekmenin indeksini güncelle
                setState(() {secilenIndeks = 1;});
                // Çekmece menüsünü kapat
                Navigator.pop(context);
              },
            ),
            ListTile(
              // Menü öğesinin başlığı
              title: const Text("Sayfa Üç"),
              // Menü öğesinin önünde gösterilecek simge
              leading: Icon(Icons.looks_3,color: Colors.orange,),
              // Menü öğesine tıklandığında çalışacak fonksiyon
              onTap: (){
                // Seçili sekmenin indeksini güncelle
                setState(() {secilenIndeks = 2;});
                // Çekmece menüsünü kapat
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
