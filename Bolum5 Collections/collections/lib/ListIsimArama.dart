import 'dart:io';

void main(){


  var isimler = <String>[];

  isimler.add("ahmet");
  isimler.add("mehmet");
  isimler.add("zeynep");
  isimler.add("sedat");
  isimler.add("ercan");

  print("Aratmak için isim giriniz");
  String isim = stdin.readLineSync()!;

  for(var i in isimler){
    if(i == isim){
      print("İSİM MEVCUT");
      break;
    }
  }


}