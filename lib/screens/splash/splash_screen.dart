import 'package:covid_alert/screens/home/home_screen.dart';
import 'package:covid_alert/screens/initial_information/initial_information_screen.dart';
import 'package:covid_alert/shared/components/screen_with_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      bool firstOpen = _prefs.getBool("first_open") ?? true;
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                firstOpen ? InitialInformationScreen() : HomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    ScreenUtil.init(context, width: 411, height: 731, allowFontScaling: false);
    return Scaffold(
      body: ScreenWithBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2),
                  child: Image.asset("lib/shared/assets/512x512_croped.png"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "#FIQUEEMCASA",
                style: GoogleFonts.mavenPro(
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF515151),
                ),
              )
            ],
          ),
        ),
        backgroundElements: [
          Positioned(
              top: 0,
              child: Image.asset(
                "lib/shared/assets/background_splash.png",
                // color: Colors.red,
              ))
        ],
      ),
    );
  }
}
