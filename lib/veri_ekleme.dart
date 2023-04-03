import 'package:aloziraat/dosya_ekleme.dart';
import 'package:aloziraat/kay%C4%B1t_ekrani_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class VeriEkleme {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DosyaEkleme _dosyaEkleme = DosyaEkleme();
  String mediaUrl = "";

  Future<KayitEkran> ekleKayit(
      String adsoyad,
      String yasi,
      String cinsiyet,
      String egitimdurumu,
      String ziraifaaliyetsuresi,
      String ilveilce,
      String koykasabanahiye,
      String postabilgileri,
      String telefon,
      String ceptelefonu,
      String eposta,
      String danisaninziraifaaliyetalani,
      String dufikbilginotu,
      String hayvanturuvesayisi,
      String agacturuvesayisi,
      String tarlaurunturuveuretimmiktari,
      PickedFile pickedFile,
      String danisaninproblemi,
      String psiaciklama) async {
    var ref = _firestore.collection("KayitEkran");

    if (pickedFile == null) {
      mediaUrl = '';
    } else {
      mediaUrl = await _dosyaEkleme.resimEkle(File(pickedFile.path));
    }

    var documentRef = await ref.add({
      'adsoyad': adsoyad,
      'yasi': yasi,
      'cinsiyet': cinsiyet,
      'egitimdurumu': egitimdurumu,
      'ziraifaaliyetsuresi': ziraifaaliyetsuresi,
      'ilveilce': ilveilce,
      'koykasabanahiye': koykasabanahiye,
      'postabilgileri': postabilgileri,
      'telefon': telefon,
      'ceptelefonu': ceptelefonu,
      'eposta': eposta,
      'danisaninziraifaaliyetalani': danisaninziraifaaliyetalani,
      'dufikbilginotu': dufikbilginotu,
      'hayvanturuvesayisi': hayvanturuvesayisi,
      'agacturuvesayisi': agacturuvesayisi,
      'tarlaurunturuveuretimmiktari': tarlaurunturuveuretimmiktari,
      'dosya': mediaUrl,
      'danisaninproblemi': danisaninproblemi,
      'psiaciklama': psiaciklama
    });

    return KayitEkran(
        id: documentRef.id,
        adsoyad: adsoyad,
        yasi: yasi,
        cinsiyet: cinsiyet,
        egitimdurumu: egitimdurumu,
        ziraifaaliyetsuresi: ziraifaaliyetsuresi,
        ilveilce: ilveilce,
        koykasabanahiye: koykasabanahiye,
        postabilgileri: postabilgileri,
        telefon: telefon,
        ceptelefonu: ceptelefonu,
        eposta: eposta,
        danisaninziraifaaliyetalani: danisaninziraifaaliyetalani,
        dufikbilginotu: dufikbilginotu,
        hayvanturuvesayisi: hayvanturuvesayisi,
        agacturuvesayisi: agacturuvesayisi,
        tarlaurunturuveuretimmiktari: tarlaurunturuveuretimmiktari,
        dosya: mediaUrl,
        danisaninproblemi: danisaninproblemi,
        psiaciklama: psiaciklama);
  }
}
