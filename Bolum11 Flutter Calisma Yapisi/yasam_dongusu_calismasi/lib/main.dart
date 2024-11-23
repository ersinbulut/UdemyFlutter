import 'package:flutter/material.dart';
import 'package:yasam_dongusu_calismasi/SayfaA.dart';

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
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    print("initState() çalıştı");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.inactive){print("inactive() çalıştı");}
    if(state == AppLifecycleState.paused){print("paused() çalıştı");}
    if(state == AppLifecycleState.resumed){print("resumed() çalıştı");}
    if(state == AppLifecycleState.detached){print("detached() çalıştı");}
  }
  
  @override
  Widget build(BuildContext context) {
    print("build() çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Yaşam Döngüsü"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ElevatedButton(
             child: Text("Tıkla"),
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));
             },
           ),
          ],
        ),
      ),
      
    );
  }
}
