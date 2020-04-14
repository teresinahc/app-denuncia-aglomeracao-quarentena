import 'package:covid_alert/shared/components/app_bar.dart';
import 'package:covid_alert/shared/components/avatar.dart';
import 'package:covid_alert/shared/components/custom_text_form_field.dart';
import 'package:covid_alert/shared/models/denuncia.dart';
import 'package:flutter/material.dart';

import 'components/image_view.dart';

class DenunciaDetails extends StatefulWidget {
  final Denuncia denuncia;

  const DenunciaDetails({Key key, this.denuncia}) : super(key: key);

  @override
  _DenunciaDetailsState createState() => _DenunciaDetailsState();
}

class _DenunciaDetailsState extends State<DenunciaDetails> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _labelSection("Dados da denúncia"),
                  if (widget.denuncia.title != null &&
                      widget.denuncia.title.isNotEmpty)
                    _field(
                        fieldName: "Título (Opcional)",
                        initialValue: widget.denuncia.title),
                  if (widget.denuncia.address != null &&
                      widget.denuncia.address.isNotEmpty)
                    _field(
                        fieldName: "Endereço",
                        initialValue: widget.denuncia.address),
                  if (widget.denuncia.event != null &&
                      widget.denuncia.event.isNotEmpty)
                    _field(
                        fieldName: "Tipo de acontecimento",
                        initialValue: widget.denuncia.event),
                  if (widget.denuncia.description != null &&
                      widget.denuncia.description.isNotEmpty)
                    _field(
                        fieldName: "Descrição (Opcional)",
                        initialValue: widget.denuncia.description),
                  if (widget.denuncia.dateTime != null)
                    _field(
                        fieldName: "Data",
                        initialValue: widget.denuncia.dateTime),
                  _buildDivider(),
                  _labelSection("Imagens da denúcia"),
                  _imagensField(),
                ],
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

  _labelSection(text) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(8),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  _field({@required String fieldName, @required dynamic initialValue}) {
    return CustomTextFormField(
      enabled: false,
      fieldName: fieldName,
      initialValue: initialValue is DateTime
          ? "${initialValue.day.toString().padLeft(2, "0")}/${initialValue.month.toString().padLeft(2, "0")}/${initialValue.year}"
          : initialValue,
    );
  }

  _imagensField() {
    double radius = ((MediaQuery.of(context).size.width - 82) / 8);
    return Wrap(
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
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageView(url: url))),
            ),
          ],
        );
      }).toList(),
    );
  }
}
