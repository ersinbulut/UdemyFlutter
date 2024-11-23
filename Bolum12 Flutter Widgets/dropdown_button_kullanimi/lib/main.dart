import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> ulkelerListe = [];
  String secilenUlke = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkelerListe.addAll(["Türkiye", "İtalya", "Almanya", "Rusya", "Çin"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: secilenUlke,
              items: ulkelerListe.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    "Ülke : $value",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                  ),
                );
              }).toList(),
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String? secilenVeri) {
                if (secilenVeri != null) {
                  setState(() {
                    secilenUlke = secilenVeri;
                  });
                }
              },
            ),
            SizedBox(height: 20), // Adding space between dropdown and text
            Text("Seçilen Ülke : $secilenUlke", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20), // Adding space between text and button
            ElevatedButton(
              child: Text("Göster"),
              onPressed: () {
                print("En son seçilen ülke : $secilenUlke");
              },
            ),
          ],
        ),
      ),
    );
  }
}
