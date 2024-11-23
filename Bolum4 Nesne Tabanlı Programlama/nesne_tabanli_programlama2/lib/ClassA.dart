// @dart=2.12
import 'Interface1.dart';

class ClassA implements Interface1 {
  int _degisken = 10; // Private olarak degisken tanımı yapıldı

  @override
  int get degisken => _degisken;

  @override
  set degisken(int value) {
    _degisken = value;
  }

  @override
  void metod1() {
    print("Interface Merhaba");
  }

  @override
  String metod2() => "Interface Çalışması";
}
