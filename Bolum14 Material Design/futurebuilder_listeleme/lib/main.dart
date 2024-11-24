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

  Future<List<String>> verileriGetir() async {
    var ulkeListesi = ["Türkiye","Almanya","İtalya","Rusya","Çin"];

    return ulkeListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Futurebuilder List"),
      ),
      body: FutureBuilder<List<String>>(
        future: verileriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){

            var ulkeListesi = snapshot.data;

            return ListView.builder(
              itemCount: ulkeListesi?.length,
              itemBuilder: (context,indeks){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text(ulkeListesi![indeks]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );

          }else{
            return Center();
          }
        },
      ),

    );
  }
}
