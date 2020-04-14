import 'package:cloud_firestore/cloud_firestore.dart';

class Denuncia {
  String title;
  String description;
  DateTime dateTime;
  String address;
  List<String> imagesUrls;
  String event;

  Denuncia(
      {this.title,
      this.description,
      this.dateTime,
      this.address,
      this.imagesUrls,
      this.event});

  Denuncia.fromDocument(DocumentSnapshot doc) {
    title = doc['title'];
    description = doc['description'];
    dateTime = (doc['dateTime'] as Timestamp).toDate();
    address = doc['address'];
    imagesUrls = doc['imagesUrls']?.cast<String>() ?? [];
    event = doc['event'];
  }

  Denuncia.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    dateTime = DateTime.fromMicrosecondsSinceEpoch(json['dateTime']);
    address = json['address'];
    imagesUrls = json['imagesUrls'].cast<String>();
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['dateTime'] = this.dateTime;
    data['address'] = this.address;
    data['imagesUrls'] = this.imagesUrls;
    data['event'] = this.event;
    return data;
  }
}
