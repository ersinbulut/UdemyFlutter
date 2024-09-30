import 'dart:io';

import 'package:collections/Ogrenciler.dart';

void main(){

  var sayac = 1;
  var ogrenciler = List<Ogrenciler>();

  while(true){

    print("Öğrenci adı giriniz");
    String ad = stdin.readLineSync();

    print("Öğrenci sınıfı giriniz");
    String sinif = stdin.readLineSync();

    var yeniOgrenci = Ogrenciler(sayac,ad,sinif);
    sayac = sayac + 1;

    ogrenciler.add(yeniOgrenci);

    print("Çıkmak için (1) - Devam etmek için diğer sayılar");
    int cikis = int.parse(stdin.readLineSync());

    if(cikis == 1){

      for(var ogrenci in ogrenciler){
        print("**********");
        print("Öğrenci no : ${ogrenci.no}");
        print("Öğrenci ad : ${ogrenci.ad}");
        print("Öğrenci sınıf : ${ogrenci.sinif}");
      }

      print("Çıkış yapıldı");
      break;
    }
  }


}