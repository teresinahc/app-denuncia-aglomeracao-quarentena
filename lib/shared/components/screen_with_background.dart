import 'package:flutter/cupertino.dart';

class ScreenWithBackground extends StatelessWidget {
  final Widget child;
  final List<Widget> backgroundElements;

  const ScreenWithBackground(
      {Key key,
      @required this.child,
      this.backgroundElements: const <Widget>[]})
      : super(key: key);

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
      ]
        ..addAll(backgroundElements)
        ..add(child),
    );
  }
}
