import 'package:covid_alert/shared/models/denuncia.dart';
import 'package:covid_alert/shared/utils/parse_horary.dart';
import 'package:flutter/material.dart';

class DenunciaTile extends StatelessWidget {
  final Denuncia denuncia;

  const DenunciaTile({Key key, this.denuncia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          parseHorary(denuncia.dateTime),
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 8),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  renderField("Endereço", denuncia.address),
                  renderField("Tipo de evento", denuncia.event),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  renderField(String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$title: ",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Expanded(child: Text(content)),
      ],
    );
  }
}
