import 'package:flutter/material.dart';
import 'package:tabs_kullanimi/Sayfa1.dart';
import 'package:tabs_kullanimi/Sayfa2.dart';
import 'package:tabs_kullanimi/Sayfa3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
    return DefaultTabController(
      // Tab kontrolcüsünün uzunluğu (tab sayısı) 3 olarak ayarlanır.
      length: 3,
      // Scaffold widget'ı, uygulama ekranının temel yapısını oluşturur.
      child: Scaffold(
        // AppBar, ekranın üst kısmında bulunan başlık çubuğudur.
        appBar: AppBar(
          // Başlık çubuğunun başlığı "Tabs Kullanımı" olarak ayarlanır.
          title: const Text("Tabs Kullanımı"),
          // Başlık çubuğunun rengi koyu mor olarak ayarlanır.
          backgroundColor: Colors.deepPurple,
          // TabBar, başlık çubuğunun altına yerleştirilen sekme çubuğudur.
          bottom: const TabBar(
            // Sekme çubuğunda gösterilecek sekmeler.
            tabs: [
              // İlk sekme "Bir" metnini gösterir.
              Tab(text: "Bir",),
              // İkinci sekme "looks_two" simgesini gösterir.
              Tab(icon: Icon(Icons.looks_two),),
              // Üçüncü sekme "Üç" metnini ve "looks_3" simgesini gösterir.
              Tab(text: "Üç",icon: Icon(Icons.looks_3),),
            ],
            // Sekme çubuğunun gösterge rengini pembe olarak ayarlar.
            indicatorColor: Colors.pink,
            // Sekme çubuğunun etiket rengini turuncu olarak ayarlar.
            labelColor: Colors.orange,
          ),
        ),
        // TabBarView, sekme çubuğunun altına yerleştirilen ve sekmelerin içeriğini gösteren bölümdür.
        body: TabBarView(
          // Sekmelerin içeriğini gösteren widget'lar.
          children: [
            // İlk sekmenin içeriği Sayfa1 widget'ıdır.
            Sayfa1(),
            // İkinci sekmenin içeriği Sayfa2 widget'ıdır.
            Sayfa2(),
            // Üçüncü sekmenin içeriği Sayfa3 widget'ıdır.
            Sayfa3(),
          ],
        ),

      ),
    );
   }
  }
