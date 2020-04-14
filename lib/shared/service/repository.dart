import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_alert/shared/models/denuncia.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class Repository {
  final Firestore _firestore = Firestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Stream<List<Denuncia>> getDenuncias() {
    return _firestore.collection("denuncias").snapshots().map((query) {
      return query.documents.map((DocumentSnapshot doc) {
        return Denuncia.fromDocument(doc);
      }).toList();
    });
  }

  Future<DocumentReference> addDenuncia(Denuncia denuncia) {
    return _firestore.collection("denuncias").add(denuncia.toJson());
  }

  Future<String> uploadFile(String docID, File image) async {
    final _reference =
        _storage.ref().child('images/$docID/${Path.basename(image.path)}}');

    StorageUploadTask uploadTask = _reference.putFile(image);

    await uploadTask.onComplete;

    return _reference.getDownloadURL().then((fileURL) {
      return fileURL;
    });
  }
}
