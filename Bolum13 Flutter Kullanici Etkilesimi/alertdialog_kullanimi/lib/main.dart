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

  var tfControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert dialog kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Basit Alert"),
              onPressed: (){

                showDialog(
                    context: context,
                  builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Başlık"),
                        content: Text("İçerik"),
                        actions: [
                          TextButton(
                            child: Text("İptal"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text("Tamam"),
                            onPressed: (){
                              print("Tamam seçildi");
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                  }
                );


              },
            ),
            ElevatedButton(
              child: Text("Özel Alert"),
              onPressed: (){

                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Özel Alert",style: TextStyle(color: Colors.white),),
                        backgroundColor: Colors.indigoAccent,
                        content: SizedBox(
                          height: 80,
                          child: Column(
                            children: [
                              TextField(
                                controller: tfControl,
                                decoration: InputDecoration(
                                  labelText: "Veri",
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: Text("İptal",style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text("Veri Oku",style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              String alinanVeri = tfControl.text;
                              print("Veri okundu : $alinanVeri");
                              tfControl.text = "";
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                );


              },
            ),
          ],
        ),
      ),

    );
  }
}
