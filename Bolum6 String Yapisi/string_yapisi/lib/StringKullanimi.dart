void main(){
  String str1 = "Merhaba";
  print(str1);

  String str2 = """
        NASILSIN
        MERHABA
        HEY
    """;

  print(str2);

  String str3 = "";

  if (str3.isEmpty){
    print("str3 boş");
  }else{
    print("str3 dolu");
  }

  int varA = 10;
  int varB = 20;

  print("$varA x $varB = ${varA*varB}");

  String str4 = "Merhaba";
  String str5 = " Dünya";
  print(str4+str5);

  String str6 = "Merhaba,Kotlin !";
  print("$str6 boyutu : ${str6.length}");

  String str7 = "Merhaba";
  String str8 = "Merhaba";

  if (str7 == str8){
    print("$str7 ve $str8 eşittir");
  }else{
    print("$str7 ve $str8 eşit değildir");
  }

}