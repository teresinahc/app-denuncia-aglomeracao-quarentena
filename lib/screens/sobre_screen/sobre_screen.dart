import 'package:covid_alert/screens/home/components/drawer.dart';
import 'package:covid_alert/shared/components/app_bar.dart';
import 'package:flutter/material.dart';

class SobreScreen extends StatefulWidget {
  @override
  _SobreScreenState createState() => _SobreScreenState();
}

class _SobreScreenState extends State<SobreScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CustomDrawer(
        isHomeScreen: false,
        isSobreScreen: true,
      ),
      appBar: appBar(
          title: "Sobre",
          leading: Leading.DRAWER,
          onLeadingPress: () {
            _key.currentState.openDrawer();
          }),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            _title("Sobre o app"),
            _buildDivider(),
            _content(
                "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet"),
            _buildDivider(),
            _title("Quem somos"),
            _buildDivider(),
            _content(
                "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet"),
            _buildDivider(),
            _title("Contribuidores"),
            _buildDivider(),
            _content(
                "Ana Paula Mendes - Idealizadora\nSampaio Leal - Front/UI\nMax Lima - Mobile/Back"),
          ],
        ),
      ),
    );
  }

  _title(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15)),
        ),
        SizedBox(
          width: 9,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ],
    );
  }

  _content(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  _buildDivider({h: 21}) {
    return SizedBox(
      height: 21,
    );
  }
}
