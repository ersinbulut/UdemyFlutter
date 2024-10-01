void main(){

  var dizi = <int>[5];

  dizi[0] = 10 ;//Veri ekleme
  dizi[1] = 20 ;
  dizi[2] = 30 ;
  dizi[3] = 40 ;
  dizi[4] = 50 ;

  print(dizi);

  //Veri okuma
  print(dizi[1]);//20

  dizi[3] = 99 ; //Güncelleme
  print(dizi);

  //Döngü ile veri okuma

  for(var d in dizi){
    print("Sonuç : $d");
  }

  for(var i=0;i<dizi.length;i++){
    print("$i. indeksteki veri : ${dizi[i]}");
  }

}