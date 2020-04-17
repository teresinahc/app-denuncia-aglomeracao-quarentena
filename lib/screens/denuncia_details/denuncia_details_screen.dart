import 'package:covid_alert/shared/components/app_bar.dart';
import 'package:covid_alert/shared/components/avatar.dart';
import 'package:covid_alert/shared/components/screen_with_background.dart';
import 'package:covid_alert/shared/models/denuncia.dart';
import 'package:covid_alert/shared/utils/parse_date.dart';
import 'package:covid_alert/shared/utils/parse_horary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'components/image_view.dart';

class DenunciaDetails extends StatefulWidget {
  final Denuncia denuncia;

  const DenunciaDetails({Key key, this.denuncia}) : super(key: key);

  @override
  _DenunciaDetailsState createState() => _DenunciaDetailsState();
}

class _DenunciaDetailsState extends State<DenunciaDetails> {
  final PageController _pageController = PageController();
  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    _pageController.dispose();
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: "Denúncia",
          leading: Leading.BACK,
          onLeadingPress: () {
            Navigator.pop(context);
          }),
      body: ScreenWithBackground(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(28),
                  vertical: ScreenUtil().setHeight(29)),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      (widget.denuncia.title != null &&
                              widget.denuncia.title.isNotEmpty)
                          ? widget.denuncia.title
                          : "Sem título",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(29),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    _buildDivider(h: ScreenUtil().setHeight(19)),
                    Text(
                      (widget.denuncia.description != null &&
                              widget.denuncia.description.isNotEmpty)
                          ? widget.denuncia.description
                          : "Sem descrição",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          color: Color(0xFF3E3E3E)),
                      textAlign: TextAlign.center,
                    ),
                    _buildDivider(h: ScreenUtil().setHeight(19)),
                    _imagensField(),
                    _buildDivider(h: ScreenUtil().setHeight(22)),
                    renderField(
                        title: "Endereço", content: widget.denuncia.address),
                    renderField(
                        title: "Categoria",
                        content: widget.denuncia.event,
                        colorContent: Theme.of(context).primaryColor,
                        contentIsBold: true),
                    renderField(
                        title: "Horário",
                        content:
                            "${parseDate(widget.denuncia.dateTime)} - ${parseHorary(widget.denuncia.dateTime)}"),
                    _buildDivider(h: 26),
                    _mapField()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildDivider({double h: 16}) {
    return SizedBox(
      height: h,
    );
  }

  _imagensField() {
    double radius = ((MediaQuery.of(context).size.width - 82) / 8);
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(13),
          vertical: ScreenUtil().setHeight(33)),
      child: widget.denuncia.imagesUrls.isEmpty
          ? Center(
              child: Text(
              "Sem imagens",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(0, 0, 0, 0.56)),
            ))
          : Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              runSpacing: 14,
              spacing: 14,
              children: widget.denuncia.imagesUrls.map<Widget>((url) {
                return Stack(
                  children: <Widget>[
                    Avatar(
                      image: NetworkImage(url),
                      radius: radius,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageView(url: url))),
                    ),
                  ],
                );
              }).toList(),
            ),
    );
  }

  renderField(
      {String title,
      String content,
      Color colorContent,
      contentIsBold: false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$title: ",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setHeight(16)),
        ),
        Expanded(
            child: Text(
          content,
          style: TextStyle(
              color: colorContent,
              fontSize: ScreenUtil().setHeight(16),
              fontWeight: contentIsBold ? FontWeight.bold : null),
        )),
      ],
    );
  }

  _mapField() {
    return Container(
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: MapboxMap(
            onMapCreated: _onMapCreated,
            myLocationRenderMode: MyLocationRenderMode.COMPASS,
            initialCameraPosition:
                CameraPosition(target: LatLng(51.5, -0.09), zoom: 15),
            styleString: "mapbox://styles/mex978/ck90jsj9k0ak61iqp0fd92pon",
          ),
        ));
  }
}
