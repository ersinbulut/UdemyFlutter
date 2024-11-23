import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sayitahmin_uygulamasi/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var tfTahmin = TextEditingController();
  int rasgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rasgeleSayi = Random().nextInt(101); // 0 - 100
    print("Rasgele Sayı : $rasgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hak : $kalanHak",
              style: TextStyle(color: Colors.pink, fontSize: 30),
            ),
            Text(
              "Yardım : $yonlendirme",
              style: TextStyle(color: Colors.black54, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,//klaye türü
                textAlign: TextAlign.center,//yazdığımız şeyin konumu
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("TAHMİN ET"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.pink, // Text color
                ),
                onPressed: () {
                  if (tfTahmin.text.isEmpty) return;

                  setState(() {
                    kalanHak -= 1;
                  });

                  int? tahmin = int.tryParse(tfTahmin.text);

                  if (tahmin == null) {
                    setState(() {
                      yonlendirme = "Lütfen geçerli bir sayı giriniz.";
                    });
                    return;
                  }

                  if (tahmin == rasgeleSayi) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true)),
                    );
                    return;
                  } else if (tahmin > rasgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini Azalt";
                    });
                  } else {
                    setState(() {
                      yonlendirme = "Tahmini Arttır";
                    });
                  }

                  if (kalanHak == 0) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false)),
                    );
                  }

                  tfTahmin.clear();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
