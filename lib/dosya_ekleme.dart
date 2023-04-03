import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DosyaEkleme {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future <String> resimEkle(File file) async{
    var yukleme = _firebaseStorage
        .ref()
        .child(
            "${DateTime.now().millisecondsSinceEpoch}.${file.path.split(".").last}")
        .putFile(file);
    
    yukleme.snapshotEvents.listen((event) { });

    var storageRef = await yukleme.whenComplete(() => null);
    return await storageRef.ref.getDownloadURL();

  }
}
