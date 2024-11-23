import 'dart:math';

void main(){

  var sayilar = <int>[];

  var r = Random();

  for(var i=0;i<100;i++){
    int rasgeleSayi = r.nextInt(101);//0 - 100
    sayilar.add(rasgeleSayi);
  }

  sayilar.sort();

  for(var s in sayilar){
    print(s);
  }



}