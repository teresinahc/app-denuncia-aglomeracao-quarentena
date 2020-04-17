import 'package:covid_alert/screens/home/home_screen.dart';
import 'package:covid_alert/shared/components/screen_with_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialInformationScreen extends StatefulWidget {
  @override
  _InitialInformationScreenState createState() =>
      _InitialInformationScreenState();
}

class _InitialInformationScreenState extends State<InitialInformationScreen> {
  final PageController _pageController = PageController();
  int page = 0;
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _pageController.dispose();
    pageIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEF3535),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(44),
            top: ScreenUtil().setHeight(24)),
        child: FloatingActionButton(
          backgroundColor: Color(0xFFECD515),
          onPressed: () async {
            if (page == 2) {
              SharedPreferences _prefs = await SharedPreferences.getInstance();
              await _prefs.setBool("first_open", false);
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        HomeScreen(),
                  ));
            } else {
              _pageController.animateToPage(page + 1,
                  duration: Duration(milliseconds: 400), curve: Curves.ease);
            }
          },
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                pageIndexNotifier.value = value;
                setState(() {
                  page = value;
                });
              },
              controller: _pageController,
              children: [_page1(), _page2(), _page3()],
            ),
          ),
          PageViewIndicator(
            pageIndexNotifier: pageIndexNotifier,
            length: 3,
            normalBuilder: (controller, index) => Circle(
              size: ScreenUtil().setSp(10),
              color: Color.fromRGBO(255, 255, 255, 0.5),
            ),
            highlightedBuilder: (controller, index) => ScaleTransition(
              scale: CurvedAnimation(
                parent: controller,
                curve: Curves.ease,
              ),
              child: Circle(
                size: ScreenUtil().setSp(14),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _page1() {
    return ScreenWithBackground(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(26)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("lib/shared/assets/corona_virus.svg"),
              SizedBox(
                height: ScreenUtil().setHeight(59),
              ),
              Text(
                  "A OMS (Organização Mundial de Saúde) declarou que o surto do novo coronavírus constitui uma Emergência de Saúde Pública de Importância Internacional.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20), color: Colors.white))
            ],
          ),
        ),
      ),
      backgroundElements: [
        Positioned(
            top: MediaQuery.of(context).size.height * 0.215,
            child: IgnorePointer(
              child: Container(
                  child: Image.asset("lib/shared/assets/initial_1.png")),
            ))
      ],
    );
  }

  Widget _page2() {
    return ScreenWithBackground(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(26)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/shared/assets/home.png"),
              SizedBox(
                height: ScreenUtil().setHeight(90),
              ),
              Text(
                  "Ajude e denuncie aglomerações durante a quarentena devido ao COVID-19.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20), color: Colors.white))
            ],
          ),
        ),
      ),
      backgroundElements: [
        Positioned(
            top: MediaQuery.of(context).size.height * 0,
            child: IgnorePointer(
              child: Container(
                  child: Image.asset("lib/shared/assets/initial_2.png")),
            ))
      ],
    );
  }

  Widget _page3() {
    return ScreenWithBackground(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(26)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("#FIQUE",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  offset: Offset(4.0, 0.0),
                                  blurRadius: 0.0,
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                ),
                              ],
                              fontSize: ScreenUtil().setSp(54),
                              fontFamily: "PoetsenOne",
                              color: Color(0xFFFBFF26))),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 18),
                            child: Text("EM",
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        offset: Offset(4.0, 0.0),
                                        blurRadius: 0.0,
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                      ),
                                    ],
                                    fontSize: ScreenUtil().setSp(22),
                                    fontFamily: "PoetsenOne",
                                    color: Color(0xFFFBFF26))),
                          ),
                          Container(
                            child: Text("CASA",
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        offset: Offset(4.0, 0.0),
                                        blurRadius: 0.0,
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                      ),
                                    ],
                                    fontSize: ScreenUtil().setSp(80),
                                    fontFamily: "PoetsenOne",
                                    color: Color(0xFFFBFF26))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(141),
              ),
              Text(
                "Cuide da saúde de todos. Fique em casa!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(20), color: Colors.white),
              )
            ],
          ),
        ),
      ),
      backgroundElements: [
        Positioned(
            top: MediaQuery.of(context).size.height * 0,
            child: IgnorePointer(
              child: Container(
                  child: Image.asset("lib/shared/assets/initial_3.png")),
            ))
      ],
    );
  }
}
