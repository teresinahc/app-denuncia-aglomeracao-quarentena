import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  final String url;

  const ImageView({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Visualização de imagem"),
      ),
      body: Center(
        child: PhotoView(
          loadFailedChild: Text(
            "Erro ao carregar a imagem!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.contained,
          imageProvider: NetworkImage(url),
        ),
      ),
    );
  }
}
