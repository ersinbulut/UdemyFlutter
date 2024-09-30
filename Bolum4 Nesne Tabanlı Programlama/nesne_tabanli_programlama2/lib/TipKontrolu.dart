// @dart=2.12
import 'Saray.dart';

void main(){

  var saray = Saray(3,30);

  if(saray is Saray){
    print("Saraydır");
  }else{
    print("Saray Değildir");
  }


}