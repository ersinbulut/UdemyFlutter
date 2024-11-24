import 'package:dinamik_gridview/DetaySayfa.dart';
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

  var ulkeler = ["Türkiye","Almanya","İtalya","Rusya","Çin"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinamik gridview"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1,
        ),
        itemCount: ulkeler.length,
        itemBuilder: (context,indeks){
          return GestureDetector(
            onTap: (){
              //print("${ulkeler[indeks]} seçildi");
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(ulkeAdi: ulkeler[indeks],)));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        print("Text ile ${ulkeler[indeks]} seçildi");
                      },
                        child: Text(ulkeler[indeks])),
                    Spacer(),
                    PopupMenuButton(
                      child: Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        PopupMenuItem(value:1,child: Text("Sil"),),
                        PopupMenuItem(value:2,child: Text("Güncelle"),),
                      ],
                      onSelected: (menuItemValue){
                        if(menuItemValue == 1){
                          print("${ulkeler[indeks]} silindi");
                        }
                        if(menuItemValue == 2){
                          print("${ulkeler[indeks]} güncellendi");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
