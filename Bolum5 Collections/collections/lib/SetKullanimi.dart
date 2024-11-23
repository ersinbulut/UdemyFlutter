import 'dart:collection';

void main(){
  
  var sayilar = HashSet<int>();
  
  var isimler = HashSet.from(["Ahmet","Mehmet"]);

  var meyveler = HashSet<String>();

  meyveler.add("Çilek");
  meyveler.add("Muz");
  meyveler.add("Elma");
  meyveler.add("Kivi");
  print(meyveler);//{Kivi, Muz, Elma, Çilek}

  meyveler.add("Elma");//Aynı veri tekrar kayıt edilemez.
  print(meyveler);//{Kivi, Muz, Elma, Çilek}

  print(meyveler.elementAt(1));//İstenilen indeksteki elemanu verir.

  print(meyveler.length);//Boyutu verir : 4
  print(meyveler.isEmpty);//Dolu mu boş mu kontrolü yapar : false

  print(meyveler.contains("Muz"));//Liste içinde belirtilen eleman var mı : true
  
  for(var m in meyveler){
    print("Sonuç : $m");
  }

  for(var i=0;i<meyveler.length;i++){
    print("$i. indeksteki veri : ${meyveler.elementAt(i)}");
  }

  meyveler.remove("Kivi");//İstenilen elemanı siler
  print(meyveler);//{Muz, Elma, Çilek}

  meyveler.clear();//Bütün verileri siler
  print(meyveler);//{}
  
}