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
  int radioDeger = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile(
              title: Text("Galatasaray"),
              value: 1,
              groupValue: radioDeger,
              activeColor: Colors.red,
              onChanged: (int? veri) {  // `int veri` yerine `int? veri` olarak değiştirdik
                if (veri != null) {      // Null kontrolü ekledik
                  setState(() {
                    radioDeger = veri;
                  });
                  print("Galatasaray seçildi");
                }
              },
            ),
            RadioListTile(
              title: Text("Fenerbahçe"),
              value: 2,
              groupValue: radioDeger,
              activeColor: Colors.indigo,
              onChanged: (int? veri) {  // `int veri` yerine `int? veri` olarak değiştirdik
                if (veri != null) {      // Null kontrolü ekledik
                  setState(() {
                    radioDeger = veri;
                  });
                  print("Fenerbahçe seçildi");
                }
              },
            ),
            ElevatedButton(
              child: Text("Göster"),
              onPressed: () {
                if (radioDeger == 1) {
                  print("Button : Galatasaray seçildi");
                }
                if (radioDeger == 2) {
                  print("Button : Fenerbahçe seçildi");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
