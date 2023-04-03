import 'package:aloziraat/veri_ekleme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

void kvkkToast() {
  Fluttertoast.showToast(
      msg: "Göndermek İçin KVKK'yı Kabul Ediniz",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void kutuKontrolToast() {
  Fluttertoast.showToast(
      msg: "Lütfen İstenen Bilgilerin Hepsini Doldurunuz",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void gonderildiToast() {
  Fluttertoast.showToast(
      msg: "BAŞARIYLA GÖNDERİLDİ",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

void resimEklendiToast() {
  Fluttertoast.showToast(
      msg: "Dosya Yüklendi",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(aloziraat());
}

class aloziraat extends StatefulWidget {
  const aloziraat({Key? key}) : super(key: key);

  @override
  State<aloziraat> createState() => _aloziraatState();
}

class _aloziraatState extends State<aloziraat> {
  String? secim1 = null;
  String? secim2 = null;
  String? secim3 = null;
  bool sartcheck = false;

  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  PickedFile? profileImage;

  TextEditingController adsoyadcontroller = TextEditingController();
  TextEditingController yascontroller = TextEditingController();
  TextEditingController egitimdurumucontroller = TextEditingController();
  TextEditingController ziraifaaliyetsuresicontroller = TextEditingController();
  TextEditingController ilveilcecontroller = TextEditingController();
  TextEditingController koykasabanahiyecontroller = TextEditingController();
  TextEditingController postabilgilericontroller = TextEditingController();
  TextEditingController telefoncontroller = TextEditingController();
  TextEditingController ceptelefonucontroller = TextEditingController();
  TextEditingController epostacontroller = TextEditingController();
  TextEditingController dufikbilginotucontroller = TextEditingController();
  TextEditingController hayvanturuvesayisicontroller = TextEditingController();
  TextEditingController agacturuvesayisicontroller = TextEditingController();
  TextEditingController tarlaurunturuveuretimmiktaricontroller =
      TextEditingController();
  TextEditingController psiaciklamacontroller = TextEditingController();

  VeriEkleme _veriEkleme = VeriEkleme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Center(
              child: Text("ALO ZİRAAT ÇİFTÇİ KAYIT FORMU"),
            ),
          ),
          backgroundColor: Colors.yellow.shade50,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/logo.jpg"),
                  colorFilter: ColorFilter.mode(
                      Colors.yellow.shade50.withOpacity(0.2),
                      BlendMode.dstATop)),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38)),
                        child: Text("Danışanın Kişisel Bilgileri",
                            style: TextStyle(fontSize: 32))),
                    TextField(
                      controller: adsoyadcontroller,
                      decoration: InputDecoration(
                          filled: true, labelText: "Adı Soyadı"),
                    ),
                    TextField(
                      controller: yascontroller,
                      decoration:
                          InputDecoration(filled: true, labelText: "Yaşı"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Text(
                            "Cinsiyet",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: DropdownButton(
                            value: secim1,
                            items: [
                              DropdownMenuItem(
                                child: Text("Erkek"),
                                value: "Erkek",
                              ),
                              DropdownMenuItem(
                                child: Text("Kadın"),
                                value: "Kadın",
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                secim1 = value.toString();
                              });
                            },
                            hint: Text("Seçiniz"),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: egitimdurumucontroller,
                      decoration: InputDecoration(
                          filled: true, labelText: "Eğitim Durumu"),
                    ),
                    TextField(
                      controller: ziraifaaliyetsuresicontroller,
                      decoration: InputDecoration(
                          filled: true, labelText: "Zirai Faaliyet Süresi"),
                    ),
                    Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38)),
                        child: Text("Adres Bilgileri",
                            style: TextStyle(fontSize: 32))),
                    TextField(
                      controller: ilveilcecontroller,
                      decoration: InputDecoration(
                          filled: true, labelText: "İl ve İlçe"),
                    ),
                    TextField(
                      controller: koykasabanahiyecontroller,
                      decoration: InputDecoration(
                          filled: true, labelText: "Köy, Kasaba, Nahiye"),
                    ),
                    TextField(
                      controller: postabilgilericontroller,
                      decoration: InputDecoration(
                          filled: true, labelText: "Posta Bilgileri"),
                    ),
                    Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38)),
                        child: Text("İletişim Bilgileri",
                            style: TextStyle(fontSize: 32))),
                    TextField(
                      controller: telefoncontroller,
                      decoration:
                          InputDecoration(filled: true, labelText: "Telefon"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                    ),
                    TextField(
                      controller: ceptelefonucontroller,
                      decoration: InputDecoration(
                          filled: true, labelText: "Cep Telefonu"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                    ),
                    TextField(
                      controller: epostacontroller,
                      decoration:
                          InputDecoration(filled: true, labelText: "E-posta"),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 7, top: 8),
                          child: Text(
                            "Danışanın Zirai Faaliyet Alanı",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: DropdownButton(
                            value: secim2,
                            items: [
                              DropdownMenuItem(
                                child: Text("Hayvancılık"),
                                value: "Hayvancılık",
                              ),
                              DropdownMenuItem(
                                child: Text("Bahçe Ziraatı"),
                                value: "Bahçe Ziraatı",
                              ),
                              DropdownMenuItem(
                                child: Text("Tarla Ziraatı"),
                                value: "Tarla Ziraatı",
                              ),
                              DropdownMenuItem(
                                child: Text("Sera Ziraatı"),
                                value: "Sera Ziraatı",
                              ),
                              DropdownMenuItem(
                                child: Text("Gıda Üretimi"),
                                value: "Gıda Üretimi",
                              ),
                              DropdownMenuItem(
                                child: Text(
                                    "Zirai Üretimle İlişkili Diğer Alanlar"),
                                value: "Zirai Üretimle İlişkili Diğer Alanlar",
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                secim2 = value.toString();
                              });
                            },
                            hint: Text("Seçiniz"),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38)),
                        child: Text(
                            "Danışanın Üretim Faaliyetine İlişkin Bilgiler",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                            ))),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                      maxLines: 5,
                      controller: dufikbilginotucontroller,
                      decoration: InputDecoration(
                          filled: true,
                          labelText:
                              "Danışanın üretim faaliyetlerine ilişkin kısa bilgi notu:",
                          labelStyle: TextStyle(fontSize: 14)),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                      maxLines: 5,
                      controller: hayvanturuvesayisicontroller,
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Hayvan varlığı -> Hayvan türü ve sayısı:",
                          labelStyle: TextStyle(fontSize: 14)),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                      maxLines: 5,
                      controller: agacturuvesayisicontroller,
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Bahçe varlığı -> Ağaç türleri ve sayısı:",
                          labelStyle: TextStyle(fontSize: 14)),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                      maxLines: 5,
                      controller: tarlaurunturuveuretimmiktaricontroller,
                      decoration: InputDecoration(
                          filled: true,
                          labelText:
                              "Tarla varlığı -> Ürün türü ve üretim miktarı:",
                          labelStyle: TextStyle(fontSize: 14)),
                    ),
                    Row(
                      children: [
                        Text("Dosya Yükle:"),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 4),
                          color: Colors.amberAccent,
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black87),
                            ),
                            onPressed: () {
                              yukleButon(ImageSource.gallery, context: context);
                            },
                            child: Text('Dosya Yükle'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 7, top: 8),
                          child: Text(
                            "Danışanın sorusu ve karşılaştığı problem:",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: DropdownButton(
                            value: secim3,
                            items: [
                              DropdownMenuItem(
                                child: Text("Genel"),
                                value: "Genel",
                              ),
                              DropdownMenuItem(
                                child: Text("Bölgesel"),
                                value: "Bölgesel",
                              ),
                              DropdownMenuItem(
                                child: Text("Bireysel"),
                                value: "Bireysel",
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                secim3 = value.toString();
                              });
                            },
                            hint: Text("Seçiniz"),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                      maxLines: 5,
                      controller: psiaciklamacontroller,
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Problem ve soruna ilişkin açıklama:",
                          labelStyle: TextStyle(fontSize: 14)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'KVKK KANUNU',
                              style: new TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch(
                                      'https://www.mevzuat.gov.tr/mevzuat?MevzuatNo=6698&MevzuatTur=1&MevzuatTertip=5');
                                },
                            ),
                            TextSpan(
                              text:
                                  ' kapsamında kişisel verilerimin işlenmesini ve üniversite bilgi sistemleri dışında paylaşılmamasını kabul ediyorum. ',
                              style: new TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Checkbox(
                      value: sartcheck,
                      activeColor: Colors.green,
                      onChanged: (bool? veri) {
                        setState(
                          () {
                            sartcheck = veri!;
                            print(sartcheck);
                          },
                        );
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      color: Colors.green,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          if (profileImage == null) {
                            kutuKontrolToast();
                          } else {
                            if (adsoyadcontroller.text != "" &&
                                yascontroller.text != "" &&
                                secim1 != null &&
                                egitimdurumucontroller.text != "" &&
                                ziraifaaliyetsuresicontroller.text != "" &&
                                ilveilcecontroller.text != "" &&
                                koykasabanahiyecontroller.text != "" &&
                                postabilgilericontroller.text != "" &&
                                telefoncontroller.text != "" &&
                                ceptelefonucontroller.text != "" &&
                                epostacontroller.text != "" &&
                                secim2 != null &&
                                dufikbilginotucontroller.text != "" &&
                                hayvanturuvesayisicontroller.text != "" &&
                                agacturuvesayisicontroller.text != "" &&
                                tarlaurunturuveuretimmiktaricontroller.text !=
                                    "" &&
                                profileImage != null &&
                                secim3 != null &&
                                psiaciklamacontroller.text != "") {
                              if (sartcheck == true) {
                                _veriEkleme.ekleKayit(
                                    adsoyadcontroller.text,
                                    yascontroller.text,
                                    secim1!,
                                    egitimdurumucontroller.text,
                                    ziraifaaliyetsuresicontroller.text,
                                    ilveilcecontroller.text,
                                    koykasabanahiyecontroller.text,
                                    postabilgilericontroller.text,
                                    telefoncontroller.text,
                                    ceptelefonucontroller.text,
                                    epostacontroller.text,
                                    secim2!,
                                    dufikbilginotucontroller.text,
                                    hayvanturuvesayisicontroller.text,
                                    agacturuvesayisicontroller.text,
                                    tarlaurunturuveuretimmiktaricontroller.text,
                                    profileImage!,
                                    secim3!,
                                    psiaciklamacontroller.text);
                                gonderildiToast();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => gonderildi()));
                              } else {
                                kvkkToast();
                              }
                            } else {
                              kutuKontrolToast();
                            }
                          }
                        },
                        child: Text('GÖNDER'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void yukleButon(ImageSource source, {required BuildContext context}) async {
    try {
      final pickedFile = await _pickerImage.getImage(source: source);
      setState(() {
        profileImage = pickedFile!;
        print("resim ekleme");
        resimEklendiToast();
      });
    } catch (e) {
      setState(() {
        _pickImage = e;
        print("Hatamız: " + _pickImage);
      });
    }
  }
}

class gonderildi extends StatelessWidget {
  const gonderildi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade50,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text("BAŞARIYLA GÖNDERİLMİŞTİR"),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/tik.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
