// @dart=2.12
import 'Isci.dart';
import 'Mudur.dart';
import 'Ogretmen.dart';
import 'Personel.dart';

void main(){

  Personel ogretmen = Ogretmen();

  Personel isci = Isci();

  var mudur = Mudur();

  mudur.terfiEttir(ogretmen);
  mudur.terfiEttir(isci);




}