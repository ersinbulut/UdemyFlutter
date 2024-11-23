import 'Ogrenciler.dart';

void main(){

  var o1 = Ogrenciler(100,"Ahmet","10F");
  var o2 = Ogrenciler(200,"Mehmet","12A");
  var o3 = Ogrenciler(300,"Zeynep","9C");

  var ogrenciler = <Ogrenciler>[];

  ogrenciler.add(o1);
  ogrenciler.add(o2);
  ogrenciler.add(o3);

  print("İlk Hali");

  for(var o in ogrenciler){
    print("**********");
    print("Öğrenci no : ${o.no}");
    print("Öğrenci ad : ${o.ad}");
    print("Öğrenci sınıf : ${o.sinif}");
  }

  Comparator<Ogrenciler> siralama1 = (x,y) => x.no.compareTo(y.no);
  ogrenciler.sort(siralama1);

  print("Sayısal Küçükten Büyüğe");

  for(var o in ogrenciler){
    print("**********");
    print("Öğrenci no : ${o.no}");
    print("Öğrenci ad : ${o.ad}");
    print("Öğrenci sınıf : ${o.sinif}");
  }

  Comparator<Ogrenciler> siralama2 = (y,x) => x.no.compareTo(y.no);
  ogrenciler.sort(siralama2);

  print("Sayısal Büyükten Küçüğe");

  for(var o in ogrenciler){
    print("**********");
    print("Öğrenci no : ${o.no}");
    print("Öğrenci ad : ${o.ad}");
    print("Öğrenci sınıf : ${o.sinif}");
  }

  Comparator<Ogrenciler> siralama3 = (x,y) => x.ad.compareTo(y.ad);
  ogrenciler.sort(siralama3);

  print("Metinsel Küçükten Büyüğe");

  for(var o in ogrenciler){
    print("**********");
    print("Öğrenci no : ${o.no}");
    print("Öğrenci ad : ${o.ad}");
    print("Öğrenci sınıf : ${o.sinif}");
  }

  Comparator<Ogrenciler> siralama4 = (y,x) => x.ad.compareTo(y.ad);
  ogrenciler.sort(siralama4);

  print("Metinsel Büyükten Küçüğe");

  for(var o in ogrenciler){
    print("**********");
    print("Öğrenci no : ${o.no}");
    print("Öğrenci ad : ${o.ad}");
    print("Öğrenci sınıf : ${o.sinif}");
  }

}