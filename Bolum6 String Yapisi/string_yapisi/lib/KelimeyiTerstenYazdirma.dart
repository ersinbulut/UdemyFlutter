import 'dart:io';

void main(){


  print("Kelime giriniz");

  String kelime = stdin.readLineSync()!;

  //ahmet : a 0 ,h 1,m 2, e 3 , t 4

  //4,3,2,1,0

  //5

  String tersKelime = "";

  for( var i=kelime.length-1;i>-1;i--){
    tersKelime = tersKelime + kelime[i];
  }

  print(tersKelime);

}