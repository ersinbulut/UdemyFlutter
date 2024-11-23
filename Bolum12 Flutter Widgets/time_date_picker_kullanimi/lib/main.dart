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

  var tfTarih = TextEditingController();
  var tfSaat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("time date picker kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: tfSaat,
              decoration: InputDecoration(
                hintText: "Saat giriniz",
              ),
              onTap: (){
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                ).then((alinanSaat) {
                  setState(() {
                    tfSaat.text = "${alinanSaat?.hour}:${alinanSaat?.minute}";
                  });
                });
              },
            ),
            TextField(
              controller: tfTarih,
              decoration: InputDecoration(
                hintText: "Tarih giriniz",
              ),
              onTap: (){
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                ).then((alinanTarih) {
                  setState(() {
                    tfTarih.text = "${alinanTarih?.day}/${alinanTarih?.month}/${alinanTarih?.year}";
                  });
                });
              },
            ),

          ],
        ),
      ),

    );
  }
}
