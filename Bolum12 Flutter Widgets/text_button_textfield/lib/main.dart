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
  var tfController = TextEditingController();
  String alinanVeri = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veri Alımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfController,
                obscureText: true,//şifre özelliği verir
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                maxLength: 4,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Yazınız",
                  hintStyle: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                  filled: true,
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  prefixIcon: Icon(Icons.print),
                ),
              ),
            ),
            ElevatedButton(
              child: Text("Veriyi Al"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue),
                ),
              ),
              onPressed: () {
                setState(() {
                  alinanVeri = tfController.text;
                });
              },
            ),
            Text(
              "Gelen Veri : $alinanVeri",
              style: TextStyle(
                color: Colors.green,
                backgroundColor: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
