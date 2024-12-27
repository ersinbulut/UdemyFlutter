import 'Kisiler.dart';
import 'VeritabaniYardimcisi.dart';

class Kisilerdao {

  Future<List<Kisiler>> tumKisiler() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (i) {

      var satir = maps[i];

      return Kisiler(satir["kisi_id"],satir["kisi_ad"],satir["kisi_yas"]);

    });
  }

  Future<void> kisiEkle(String kisiAd,int kisiYas) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = <String,dynamic>{};
    bilgiler["kisi_ad"] = kisiAd;
    bilgiler["kisi_yas"] = kisiYas;

    await db.insert("kisiler", bilgiler);
  }

  Future<void> kisiSil(int kisiId) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("kisiler",where: "kisi_id = ?",whereArgs: [kisiId]);
  }

  Future<void> kisiGuncelle(int kisiId,String kisiAd,int kisiYas) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = <String,dynamic>{};
    bilgiler["kisi_ad"] = kisiAd;
    bilgiler["kisi_yas"] = kisiYas;

    await db.update("kisiler", bilgiler,where: "kisi_id=?",whereArgs: [kisiId]);
  }

  Future<int> kayitKontrol(String kisiAd) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT count(*) AS sonuc FROM kisiler WHERE kisi_ad='$kisiAd'");

    return maps[0]["sonuc"];
  }

  Future<Kisiler> kisiGetir(int kisiId) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_id=$kisiId");

    var satir = maps[0];

    return Kisiler(satir["kisi_id"],satir["kisi_ad"],satir["kisi_yas"]);
  }

  Future<List<Kisiler>> kisiArama(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_ad like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {

      var satir = maps[i];

      return Kisiler(satir["kisi_id"],satir["kisi_ad"],satir["kisi_yas"]);

    });
  }

  Future<List<Kisiler>> rasgele2kisiGetir() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler ORDER BY RANDOM() LIMIT 2");

    return List.generate(maps.length, (i) {

      var satir = maps[i];

      return Kisiler(satir["kisi_id"],satir["kisi_ad"],satir["kisi_yas"]);

    });
  }


}