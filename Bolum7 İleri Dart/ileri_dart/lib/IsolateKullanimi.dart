import 'dart:io';
import 'dart:isolate';

void main(){

  isYap("Main İş");

  Isolate.spawn(isYap,"Bir");
  Isolate.spawn(isYap,"İki");

}

void isYap(String isAdi) async {

  for(var i=0;i<10;i++){
    print("$isAdi : $i");
    sleep(const Duration(milliseconds:100));
  }

}

