import 'dart:collection';

void main(){

  var sayilar = HashMap<int,String>();

  var oranlar = HashMap<double,String>();

  oranlar.addAll({1.5:'Oran1',3.4:'Oran2'});

  var iller = HashMap<int,String>();

  iller[16] = "BURSA";//Ekleme
  iller[34] = "İSTANBUL";

  print(iller);//{16: BURSA, 34: İSTANBUL}

  iller[16] = "YENİ BURSA";//Güncelleme
  print(iller);//{16: YENİ BURSA, 34: İSTANBUL}

  print(iller[34]);//Veri okuma

  print(iller.length);//Boyutu : 2

  print(iller.isEmpty);//Boş mu dolu mu : false
  print(iller.containsKey(17));//Belirtilen key var mı yok mu : false
  print(iller.containsValue("İSTANBULX"));////Belirtilen değer var mı yok mu : false

  var anahtarlar = iller.keys;

  for(var a in anahtarlar){
    print("Sonuç : ${iller[a]}");
  }

  iller.remove(16);//Belirtilen key ile silme işlemi
  print(iller);

  iller.clear();//Bütün verileri silme
  print(iller);



}