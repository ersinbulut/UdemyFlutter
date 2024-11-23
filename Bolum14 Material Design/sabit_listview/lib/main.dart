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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sabit Listview"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text("Güneş"),
            subtitle: Text("Güneş alt başlık"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print("Güneş tıklandı");
            },
          ),
          ListTile(
            leading: Icon(Icons.brightness_2),
            title: Text("Ay"),
            subtitle: Text("Ay alt başlık"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print("Ay tıklandı");
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Yıldız"),
            subtitle: Text("Yıldız alt başlık"),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              print("Yıldız tıklandı");
            },
          ),
          GestureDetector(
            onTap: (){
              print("Card tıklandı");
            },
            child: Card(
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Text("Card Tasarım"),
                    Spacer(),
                    Icon(Icons.more_vert)
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print("Container tıklandı");
            },
            child: Container(
              height: 50,
              color: Colors.red,
              child: Text("Merhaba"),
            ),
          ),
        ],
      ),

    );
  }
}
