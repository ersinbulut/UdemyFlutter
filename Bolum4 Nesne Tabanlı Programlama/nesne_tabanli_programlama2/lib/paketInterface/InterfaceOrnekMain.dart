import 'AmasyaElmasi.dart';
import 'Aslan.dart';
import 'Eatable.dart';
import 'Elma.dart';
import 'Squeezable.dart';
import 'Tavuk.dart';

void main(){

  var aslan = Aslan();
  Elma amasyaElmasi = AmasyaElmasi();
  var elma = Elma();
  Eatable tavuk = Tavuk();

  var nesneler = [aslan,amasyaElmasi,elma,tavuk];

  for(var n in nesneler){
    if(n is Eatable){
      n.howToEat();
    }

    if(n is Squeezable){
      n.howToSqueeze();
    }
  }


}