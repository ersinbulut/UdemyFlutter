void main(){

  var dizi = <int>[2];

  try{
    dizi[1] = 8;
    print("İşlem Tamam");

  }catch (e){

    print("Dizinin boyutunu aştınız");

  }

}