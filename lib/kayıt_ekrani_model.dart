import 'package:cloud_firestore/cloud_firestore.dart';

class KayitEkran {
  String? id;
  String? adsoyad;
  String? yasi;
  String? cinsiyet;
  String? egitimdurumu;
  String? ziraifaaliyetsuresi;
  String? ilveilce;
  String? koykasabanahiye;
  String? postabilgileri;
  String? telefon;
  String? ceptelefonu;
  String? eposta;
  String? danisaninziraifaaliyetalani;
  String? dufikbilginotu;
  String? hayvanturuvesayisi;
  String? agacturuvesayisi;
  String? tarlaurunturuveuretimmiktari;
  String? dosya;
  String? danisaninproblemi;
  String? psiaciklama;

  KayitEkran(
      {this.id,
      this.adsoyad,
      this.yasi,
      this.cinsiyet,
      this.egitimdurumu,
      this.ziraifaaliyetsuresi,
      this.ilveilce,
      this.koykasabanahiye,
      this.postabilgileri,
      this.telefon,
      this.ceptelefonu,
      this.eposta,
      this.danisaninziraifaaliyetalani,
      this.dufikbilginotu,
      this.hayvanturuvesayisi,
      this.agacturuvesayisi,
      this.tarlaurunturuveuretimmiktari,
      this.dosya,
      this.danisaninproblemi,
      this.psiaciklama});

  factory KayitEkran.fromSnapshot(DocumentSnapshot snapshot) {
    return KayitEkran(
      id: snapshot.id,
      adsoyad: snapshot["adsoyad"],
      yasi: snapshot["yasi"],
      cinsiyet: snapshot["cinsiyet"],
      egitimdurumu: snapshot["egitimdurumu"],
      ziraifaaliyetsuresi: snapshot["ziraifaaliyetsuresi"],
      ilveilce: snapshot["ilveilce"],
      koykasabanahiye: snapshot["koykasabanahiye"],
      postabilgileri: snapshot["postabilgileri"],
      telefon: snapshot["telefon"],
      ceptelefonu: snapshot["ceptelefonu"],
      eposta: snapshot["eposta"],
      danisaninziraifaaliyetalani: snapshot["danisaninziraifaaliyetalani"],
      dufikbilginotu: snapshot["dufikbilginotu"],
      hayvanturuvesayisi: snapshot["hayvanturuvesayisi"],
      agacturuvesayisi: snapshot["agacturuvesayisi"],
      tarlaurunturuveuretimmiktari: snapshot["tarlaurunturuveuretimmiktari"],
      dosya: snapshot["dosya"],
      danisaninproblemi: snapshot["danisaninproblemi"],
      psiaciklama: snapshot["psiaciklama"],
    );
  }
}
