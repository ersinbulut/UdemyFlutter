import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // SSL hatalarını bypass etmek için HttpOverrides ayarını kullanıyoruz
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // WebViewPlatform'u hem Android hem de iOS için ayarla
    if (WebViewPlatform.instance == null) {
      if (defaultTargetPlatform == TargetPlatform.android) {
        WebViewPlatform.instance = AndroidWebViewPlatform();
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        WebViewPlatform.instance = WebKitWebViewPlatform();
      }
    }

    // WebViewController'i başlat ve ayarları yap
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..clearCache() // Ön belleği temizleyerek ERR_CACHE_MISS hatasını önlemeye çalış
      ..loadRequest(Uri.parse("https://magiclinesarj.com/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Webview Kullanımı"),
      ),
      body: WebViewWidget(controller: _controller), // Controller ile WebViewWidget kullan
    );
  }
}

// SSL sertifikalarını bypass eden HttpOverrides sınıfı
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
