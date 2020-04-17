import 'package:covid_alert/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialInformationScreen extends StatefulWidget {
  @override
  _InitialInformationScreenState createState() =>
      _InitialInformationScreenState();
}

class _InitialInformationScreenState extends State<InitialInformationScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      backgroundColor: Color(0xFFFFF5F5),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    HomeScreen(),
              ));
        },
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 18,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(ScreenUtil().setSp(29)),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      child: FittedBox(
                        child: Text(
                          '#FIQUEEMCASA',
                          style: GoogleFonts.mavenPro(
                            fontSize: ScreenUtil().setSp(42),
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 0, 0, 0.02),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setHeight(23),
                      child: Text(
                        '#FIQUEEMCASA',
                        style: GoogleFonts.mavenPro(
                          fontSize: ScreenUtil().setSp(34),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  'A OMS (Organização Mundial de Saúde) declarou que o surto do novo coronavírus constitui uma Emergência de Saúde Pública de Importância Internacional.',
                  style: GoogleFonts.mavenPro(
                    fontSize: ScreenUtil().setSp(22),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        child: Image.asset(
                          'lib/shared/assets/home_back.png',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        'lib/shared/assets/home.png',
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: ScreenUtil().setHeight(6),
              ),
              Expanded(
                child: Text(
                  'Ajude e denuncie aglomerações durante a quarentena devido ao COVID-19.',
                  style: GoogleFonts.mavenPro(fontSize: ScreenUtil().setSp(22)),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
