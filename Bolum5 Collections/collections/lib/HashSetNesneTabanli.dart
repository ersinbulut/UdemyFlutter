import 'dart:collection';

import 'Ogrenciler.dart';

void main(){
  var o1 = Ogrenciler(100,"Ahmet","10F");
  var o2 = Ogrenciler(200,"Mehmet","12A");
  var o3 = Ogrenciler(300,"Zeynep","9C");
  var o4 = Ogrenciler(300,"Zeynep","9C");
  //Aynı no daha önce kullanıldığı için hashsete eklenmez.

  var ogrenciler = HashSet<Ogrenciler>();

  ogrenciler.add(o1);
  ogrenciler.add(o2);
  ogrenciler.add(o3);
  ogrenciler.add(o4);

  for(var o in ogrenciler){
    print("**********");
    print("Öğrenci no : ${o.no}");
    print("Öğrenci ad : ${o.ad}");
    print("Öğrenci sınıf : ${o.sinif}");
  }


}