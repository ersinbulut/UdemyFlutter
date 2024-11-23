import 'package:flutter/foundation.dart';
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
  bool kotlinDurum = false;
  bool dartDurum = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: Text("Kotlin"),
              value: kotlinDurum,
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.red,
              activeColor: Colors.deepPurple,
              onChanged: (bool? veri) {  // `bool veri` yerine `bool? veri` olarak değiştirdik
                if (veri != null) {       // Null kontrolü ekledik
                  if (kDebugMode) {
                    print("Kotlin seçildi : $veri");
                  }

                  setState(() {
                    kotlinDurum = veri;
                  });
                }
              },
            ),
            CheckboxListTile(
              title: Text("Dart"),
              value: dartDurum,
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.red,
              activeColor: Colors.deepPurple,
              onChanged: (bool? veri) {   // `bool veri` yerine `bool? veri` olarak değiştirdik
                if (veri != null) {       // Null kontrolü ekledik
                  if (kDebugMode) {
                    print("Dart seçildi : $veri");
                  }

                  setState(() {
                    dartDurum = veri;
                  });
                }
              },
            ),
            ElevatedButton(
              child: Text("Göster"),
              onPressed: (){
                print("Kotlin durum : $kotlinDurum");
                print("Dart durum : $dartDurum");
              },
            ),
          ],
        ),
      ),
    );
  }
}
