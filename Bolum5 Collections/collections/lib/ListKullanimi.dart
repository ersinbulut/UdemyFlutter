void main(){

  //Tanımlama Yöntemleri
  var sayilar = List();

  var sonuclar = new List(); // new tercihen kullanılabilir etkisi yoktur.

  var iller = List<String>();

  var plakalar = [16,34,6];

  var meyveler = List<String>();

  meyveler.add("Çilek");
  meyveler.add("Muz");
  meyveler.add("Elma");
  meyveler.add("Kivi");
  meyveler.add("Kiraz");

  print(meyveler.isEmpty);//Dolu mu Boş mu kontrolü : false
  print(meyveler.length);//Boyutu : 5
  print(meyveler.first);//Listenin ilk elemanı : Çilek
  print(meyveler.last);//Listenin son elemanı : Kiraz

  print(meyveler.contains("Kiraz"));//İçeriği listede arar : true

  var liste = meyveler.reversed;//Listeyi terse çevirir.
  print(liste);//(Kiraz, Kivi, Elma, Muz, Çilek)

  meyveler.sort();//Listeyi sıralar
  print(meyveler);//[Elma, Kiraz, Kivi, Muz, Çilek]

  meyveler.removeAt(2);//İstenilen indeksteki veriyi siler.
  print(meyveler);//[Elma, Kiraz, Muz, Çilek]

  meyveler.remove("Kiraz");//İstenilen elemanı siler.
  print(meyveler);//[Elma, Muz, Çilek]

  meyveler.clear();//Bütün listeyi siler.
  print(meyveler);//[]

}

