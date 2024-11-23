// @dart=2.12

import 'Adres.dart';
import 'Kisiler.dart';

void main(){

  var adres = Adres("Bursa","Osmangazi");

  var kisi = Kisiler("Ahmet",23,adres);

  print("Kişi ad : ${kisi.ad}");
  print("Kişi yaş : ${kisi.yas}");
  print("Kişi il : ${kisi.adres.il}");
  print("Kişi ilçe : ${kisi.adres.ilce}");

}