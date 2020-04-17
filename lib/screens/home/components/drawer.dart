import 'package:covid_alert/screens/sobre_screen/sobre_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  final bool isHomeScreen;
  final bool isSobreScreen;

  const CustomDrawer(
      {Key key, @required this.isHomeScreen, @required this.isSobreScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Image.asset(
                "lib/shared/assets/512x512.png",
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("lib/shared/assets/Rectangle.svg"),
              title: Text("Home"),
              onTap: isHomeScreen
                  ? () => Navigator.pop(context)
                  : () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
            ),
            ListTile(
              leading: SvgPicture.asset("lib/shared/assets/Subtract.svg"),
              title: Text("Sobre"),
              onTap: isSobreScreen
                  ? () => Navigator.pop(context)
                  : () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      SobreScreen()));
                    },
            ),
          ],
        ),
      ),
    );
  }
}
