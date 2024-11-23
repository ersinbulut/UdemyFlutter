import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  final bool sonuc;
  SonucEkrani({required this.sonuc});

  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc
                ? Image.asset("resimler/mutlu_resim.png")
                : Image.asset("resimler/uzgun_resim.png"),
            Text(
              widget.sonuc ? "Kazandınız" : "Kaybettiniz",
              style: TextStyle(color: Colors.black54, fontSize: 36),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("TEKRAR DENE"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
