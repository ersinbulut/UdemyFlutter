import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_login_uygulamasi/Anasayfa.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // Uygulamanın ana sınıfı, StatelessWidget, kullanıcı etkileşimine göre değişmeyen widget'lar için kullanılır.

  Future<bool> oturumKontrol() async {
    // Kullanıcının oturum açıp açılmadığını kontrol eden fonksiyon
    // SharedPreferences'tan kullanıcı adı ve şifreyi alır ve kontrol eder.

    var sp = await SharedPreferences.getInstance(); // SharedPreferences'a erişim sağlama
    
    String spKullaniciAdi = sp.getString("kullaniciAdi") ?? "kullanıcı adı yok"; // SharedPreferences'tan "kullaniciAdi" anahtarına karşılık gelen değeri al, yoksa "kullanıcı adı yok" olarak ayarla
    String spSifre = sp.getString("sifre") ?? "şifre yok"; // SharedPreferences'tan "sifre" anahtarına karşılık gelen değeri al, yoksa "şifre yok" olarak ayarla
    
    if(spKullaniciAdi == "admin" && spSifre == "123"){ // Kullanıcı adı ve şifre doğruysa
      return true; // Oturum açılmış olarak işaretle
    }else{
      return false; // Oturum açılmamış olarak işaretle
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Uygulamanın başlık çubuğunda gösterilecek başlık
      debugShowCheckedModeBanner: false, // Debug banner'ını gizleme
      theme: ThemeData(
        primarySwatch: Colors.blue, // Uygulamanın ana renk paleti
        visualDensity: VisualDensity.adaptivePlatformDensity, // Görsel yoğunluk
      ),
      home: FutureBuilder<bool>(
        // FutureBuilder, gelecekte bir değer döndüren bir fonksiyonun sonucunu beklemek için kullanılır.
        future: oturumKontrol(), // oturumKontrol() fonksiyonunu çalıştırma
      builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Bekleme durumunda bir yükleme göstergesi ekleyin
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData && snapshot.data == true) {
              return Anasayfa();
            } else {
              return LoginEkrani();
            }
          },
      ),
    );
  }
}
class LoginEkrani extends StatefulWidget {

  @override
  _LoginEkraniState createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {
  // Login ekranının durumunu yöneten _LoginEkraniState sınıfı.

  var tfKullaniciAdi = TextEditingController(); // Kullanıcı adı giriş alanını kontrol eden TextEditingController.
  var tfSifre = TextEditingController(); // Şifre giriş alanını kontrol eden TextEditingController.

  var scaffoldKey = GlobalKey<ScaffoldState>(); // Scaffold'a erişim sağlayan GlobalKey.

  Future<void> girisKontrol() async {
    // Kullanıcının giriş bilgilerini kontrol eden fonksiyon.
    // Giriş bilgileri doğruysa, kullanıcıyı Anasayfa'ya yönlendirir.
    // Aksi halde, hata mesajı gösterir.

    var ka = tfKullaniciAdi.text; // Kullanıcı adı giriş alanından metni al.
    var s = tfSifre.text; // Şifre giriş alanından metni al.

    if(ka == "admin" && s == "123"){ // Giriş bilgileri doğruysa
      var sp = await SharedPreferences.getInstance(); // SharedPreferences'a erişim sağla.

      sp.setString("kullaniciAdi", ka); // SharedPreferences'a "kullaniciAdi" anahtarına karşılık gelen değeri kaydet.
      sp.setString("sifre", s); // SharedPreferences'a "sifre" anahtarına karşılık gelen değeri kaydet.

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Anasayfa())); // Anasayfa ekranına yönlendir.
    }else{ // Giriş bilgileri yanlışsa
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Giriş Hatalı"))); // Hata mesajı göster.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, // Scaffold'a GlobalKey'i ata.
      appBar: AppBar(
        title: Text("Login Ekranı"), // AppBar'ın başlığı
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0), // İçerik etrafına boşluk ekle.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Çocuk widget'ları dikey olarak ortala.
            children: <Widget>[
              TextField(
                controller: tfKullaniciAdi, // TextEditingController'ı giriş alanına ata.
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adı", // İpucu metni
                ),
              ),
              TextField(
                obscureText: true, // Şifreyi gizle.
                controller: tfSifre, // TextEditingController'ı giriş alanına ata.
                decoration: InputDecoration(
                  hintText: "Şifre", // İpucu metni
                ),
              ),
              ElevatedButton(
                child: Text("Giriş Yap"), // Butonun metni
                onPressed: (){ // Butona tıklandığında çalışacak fonksiyon.
                  girisKontrol(); // girisKontrol() fonksiyonunu çağır.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}