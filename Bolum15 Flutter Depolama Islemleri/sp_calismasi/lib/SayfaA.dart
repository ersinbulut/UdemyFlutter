import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SayfaA extends StatefulWidget {
  @override
  _SayfaAState createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {

  Future<void> veriOku() async {

    var sp = await SharedPreferences.getInstance();

    String ad = sp.getString("ad") ?? "isim yok" ;
    int yas = sp.getInt("yas") ?? 99;
    double boy = sp.getDouble("boy") ?? 9.99;
    bool bekarMi = sp.getBool("bekarMi") ?? false;

    var arkadasListe = sp.getStringList("arkadasListe") ?? null;

    print("Ad : $ad");
    print("Yaş : $yas");
    print("Boy : $boy");
    print("Bekar mı ? : $bekarMi");

    for(var a in arkadasListe!){
      print("Arkadaş : $a");
    }

  }

  Future<void> veriSil() async {

    var sp = await SharedPreferences.getInstance();

    sp.remove("ad");

  }

  Future<void> veriGuncelle() async {

    var sp = await SharedPreferences.getInstance();

    sp.setInt("yas",100);

  }

  @override
  void initState() {
    super.initState();
    //veriSil();
    veriGuncelle();
    veriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa A"),
      ),
      body: Center(),
    );
  }
}
