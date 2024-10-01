void main(){

  String str1 = "Merhaba";//M-0 ,e-1,r-2,h-3,a-4,b-5,a-6

  //Metinden Parça alma
  print(str1.substring(0,3));//Mer

  //Metin içinde arama
  String str2 = "Merhaba";

  if(str2.contains("x")){
    print("içeriyor");
  }

  String str3 = "Merhaba";

  //Hepsini Büyük Harf Yapar
  print(str3.toUpperCase());//MERHABA
  //Hepsini Küçük Harf Yapar
  print(str3.toLowerCase());//merhaba

  String str4 = "Merhaba Nasılsın asdasd adasd adasda";

  //Parçalama yapar.
  var dizi = str4.split(" ");

  for(var d in dizi){
    print(d);
  }

  //Beyaz boşluk temizler
  String str5 = " Merhaba ";
  print(str5.trim());

}