class Denuncia {
  DateTime dateTime;
  String address;
  List<String> imagesUrls;
  String event;

  Denuncia({this.dateTime, this.address, this.imagesUrls, this.event});

  Denuncia.fromJson(Map<String, dynamic> json) {
    dateTime = DateTime.fromMicrosecondsSinceEpoch(json['dateTime']);
    address = json['address'];
    imagesUrls = json['imagesUrls'].cast<String>();
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateTime'] = this.dateTime;
    data['address'] = this.address;
    data['imagesUrls'] = this.imagesUrls;
    data['event'] = this.event;
    return data;
  }
}
