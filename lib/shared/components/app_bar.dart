import 'package:flutter/material.dart';

enum Leading { BACK, DRAWER }

Widget leadingIcon({Leading type, Function onPressed}) {
  switch (type) {
    case Leading.BACK:
      return IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: onPressed,
      );
    case Leading.DRAWER:
      return IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: onPressed,
      );
    default:
      return null;
  }
}

AppBar appBar(
    {@required String title, Leading leading, Function onLeadingPress}) {
  return AppBar(
    title: Text(title),
    leading: leadingIcon(type: leading, onPressed: onLeadingPress),
    titleSpacing: 4,
  );
}
