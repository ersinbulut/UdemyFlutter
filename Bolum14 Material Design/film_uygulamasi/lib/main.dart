import 'package:film_uygulamasi/DetaySayfa.dart';
import 'package:film_uygulamasi/Filmler.dart';
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

  // Bu fonksiyon, filmler listesini içeren bir Future<List<Filmler>> döndürür.
  Future<List<Filmler>> filmleriGetir() async {

    // Boş bir filmler listesi oluşturulur.
    var filmlerListesi = <Filmler>[];

    // Her bir film nesnesi oluşturulur ve film bilgilerini içerir.
    var f1 = Filmler(1, "Anadoluda", "anadoluda.png", 15.99);
    var f2 = Filmler(2,"Django","django.png",9.99);
    var f3 = Filmler(3,"Inception","inception.png",7.99);
    var f4 = Filmler(4,"Interstellar","interstellar.png",21.99);
    var f5 = Filmler(5,"The Hateful Eight","thehatefuleight.png",5.99);
    var f6 = Filmler(6,"The Pianist","thepianist.png",17.99);

    // Oluşturulan film nesneleri filmler listesine eklenir.
    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    // Filmler listesi döndürülür.
    return filmlerListesi;
  }

  // build() metodu, uygulama ekranının nasıl görüneceğini belirler.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar, ekranın üst kısmında bulunan başlık çubuğudur.
      appBar: AppBar(
        // Başlık çubuğunun başlığı "Filmler" olarak ayarlanır.
        title: Text("Filmler"),
        // Başlık çubuğunun rengi koyu mor olarak ayarlanır.
        backgroundColor: Colors.deepPurple,
      ),
      // Body, ekranın ana içeriğini gösteren bölümdür.
      body: FutureBuilder<List<Filmler>>(
        // FutureBuilder, filmleriGetir() fonksiyonunun sonucunu bekler.
        future: filmleriGetir(),
        // FutureBuilder, beklenen verilerin durumuna göre farklı widget'lar döndürür.
        builder: (context,snapshot){
          // Eğer filmler listesi yüklendiyse (hasData = true)
          if(snapshot.hasData){

            // Yüklenen filmler listesi alınır.
            var filmlerListesi = snapshot.data;

            // GridView.builder, filmleri bir ızgara görünümünde gösterir.
            return GridView.builder(
              // ızgara görünümünde gösterilecek öğe sayısı.
              itemCount: filmlerListesi!.length,
              // ızgara görünümünün nasıl oluşturulacağını belirler.
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // ızgara görünümünde her satırda gösterilecek sütun sayısı.
                crossAxisCount: 2,
                // ızgara görünümünde her öğenin genişlik/yükseklik oranı.
                childAspectRatio: 2 / 3.5,
              ),
              // ızgara görünümünde her öğenin nasıl oluşturulacağını belirler.
              itemBuilder: (context,indeks){
                // ızgara görünümünde gösterilecek film nesnesi.
                var film = filmlerListesi[indeks];

                // GestureDetector, bir öğeye dokunulduğunda bir işlem yapar.
                return GestureDetector(
                  // Öğeye dokunulduğunda DetaySayfa ekranına yönlendirilir.
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film,)));
                  },
                  // Card, öğenin çevresini çerçeveler.
                  child: Card(
                    // Column, öğenin içeriklerini dikey olarak sıralar.
                    child: Column(
                      // İçerikler eşit aralıklarla dağıtılır.
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,//aralarda boşluk oluşturur.
                      // Column'ın içindeki içerikler.
                      children: [
                        // Padding, öğenin çevresine boşluk ekler.
                        Padding(
                          // Boşluk miktarı.
                          padding: const EdgeInsets.all(8.0),
                          // Image.asset, bir resim dosyasını gösterir.
                          child: Image.asset("resimler/${film.film_resim_adi}"),
                        ),
                        // Text, bir metin gösterir.
                        Text(film.film_adi,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        // Text, bir metin gösterir.
                        Text("${film.film_fiyat} \u{20BA}",style: TextStyle(fontSize: 16,),),
                      ],
                    ),
                  ),
                );

              },
            );

          }else{
            // Eğer filmler listesi henüz yüklenmediyse boş bir ekran gösterilir.
            return Center();
          }
        },
      ),

    );
  }
}
