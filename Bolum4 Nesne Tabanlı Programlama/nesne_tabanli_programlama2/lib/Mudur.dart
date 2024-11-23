// @dart=2.12
import 'Isci.dart';
import 'Ogretmen.dart';
import 'Personel.dart';

class Mudur extends Personel {
  void iseAl(Personel p){
    p.iseAlindi();
  }

  void terfiEttir(Personel p){

    if( p is Ogretmen){
      p.maasArttir();
    }

    if( p is Isci){
      print("İşçiler terfi alamaz");
    }
  }
}


