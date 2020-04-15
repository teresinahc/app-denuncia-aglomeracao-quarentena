import 'package:flutter/cupertino.dart';

class ScreenWithBackground extends StatelessWidget {
  final Widget child;

  const ScreenWithBackground({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Image.asset(
            "lib/shared/assets/Vector.png",
            width: MediaQuery.of(context).size.width,
          ),
        ),
        child
      ],
    );
  }
}
