import 'Eatable.dart';
import 'Squeezable.dart';

class Elma implements Squeezable,Eatable {
  @override
  void howToEat() {
    print("Dilimle ve ye");
  }

  @override
  void howToSqueeze() {
    print("Blendır ile sık");
  }

}

