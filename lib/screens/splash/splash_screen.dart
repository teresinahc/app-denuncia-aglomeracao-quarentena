import 'package:covid_alert/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplahScreen extends StatefulWidget {
  @override
  _SplahScreenState createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) async {
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          color: Color(0xFFFFF5F5),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Container(
                height: 0.07 * MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 0.025 * MediaQuery.of(context).size.height,
                      child: Text(
                        '#FIQUEEMCASA',
                        style: GoogleFonts.mavenPro(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 0, 0, 0.02),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.025 * MediaQuery.of(context).size.height,
                      child: Text(
                        '#FIQUEEMCASA',
                        style: GoogleFonts.mavenPro(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'A OMS (Organização Mundial de Saúde) declarou que o surto do novo coronavírus constitui uma Emergência de Saúde Pública de Importância Internacional.',
              style: GoogleFonts.mavenPro(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'lib/shared/assets/home_back.png',
                  height: 0.38 * MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  'lib/shared/assets/home.png',
                  width: 0.38 * MediaQuery.of(context).size.width,
                ),
              ],
            ),
            Text(
              'Ajude e denuncie aglomerações durante a quarentena devido ao COVID-19.',
              style: GoogleFonts.mavenPro(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            FloatingActionButton(
              onPressed: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
