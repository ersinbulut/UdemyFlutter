import 'dart:collection';

import 'Ogrenciler.dart';

void main(){

  var o1 = Ogrenciler(100,"Ahmet","10F");
  var o2 = Ogrenciler(200,"Mehmet","12A");
  var o3 = Ogrenciler(300,"Zeynep","9C");

  var ogrenciler = HashMap<int,Ogrenciler>();

  ogrenciler[o1.no] = o1;
  ogrenciler[o2.no] = o2;
  ogrenciler[o3.no] = o3;

  var anahtarlar = ogrenciler.keys;

  for(var a in anahtarlar){

    var o = ogrenciler[a];

    print("**********");
    print("Öğrenci no : ${o!.no}");
    print("Öğrenci ad : ${o.ad}");
    print("Öğrenci sınıf : ${o.sinif}");
  }

}