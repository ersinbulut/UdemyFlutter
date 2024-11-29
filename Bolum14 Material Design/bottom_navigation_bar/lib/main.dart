import 'package:bottom_navigation_bar/SayfaBir.dart';
import 'package:bottom_navigation_bar/SayfaIki.dart';
import 'package:bottom_navigation_bar/SayfaUc.dart';
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
  var sayfaListesi = [SayfaBir(),SayfaIki(),SayfaUc()];
  // Seçili sekmenin indeksi
  int secilenIndeks = 0;
  @override
  Widget build(BuildContext context) {
    // Scaffold, uygulama ekranının temel yapısını oluşturur.
    return Scaffold(
      // AppBar, ekranın üst kısmında bulunan başlık çubuğudur.
      appBar: AppBar(
        // Başlık çubuğunun başlığı
        title: Text("Bottom Navigation Bar"),
        // Başlık çubuğunun rengi
        backgroundColor: Colors.deepPurple,
      ),
      // Ekranın ana içeriği
      body: sayfaListesi[secilenIndeks],
      // Alt menü çubuğu
      bottomNavigationBar: BottomNavigationBar(
        // Menü öğeleri
        items: const [
          // İlk öğe
          BottomNavigationBarItem(
            // Simge
            icon: Icon(Icons.looks_one),
            // Etiket
            label: "Bir",
          ),
          // İkinci öğe
          BottomNavigationBarItem(
            // Simge
            icon: Icon(Icons.looks_two),
            // Etiket
            label: "İki",
          ),
          // Üçüncü öğe
          BottomNavigationBarItem(
            // Simge
            icon: Icon(Icons.looks_3),
            // Etiket
            label: "Üç",
          ),
        ],
        // Menü çubuğunun rengi
        backgroundColor: Colors.deepPurple,
        // Seçili öğenin rengi
        selectedItemColor: Colors.orange,
        // Seçili olmayan öğenin rengi
        unselectedItemColor: Colors.white,
        // Seçili öğenin indeksi
        currentIndex: secilenIndeks,
        // Menü öğesine tıklandığında çağrılan fonksiyon
        onTap: (indeks){
          // Seçili sekmenin indeksini güncelle
          setState(() {
            secilenIndeks = indeks;
          });
        },
      ),
    );
  }
}
