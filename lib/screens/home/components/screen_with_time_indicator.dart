import 'package:covid_alert/shared/utils/parse_date.dart';
import 'package:flutter/material.dart';

class ScreenDateIndicator extends StatelessWidget {
  final bool hasNext;
  final DateTime headTime;
  final List<Widget> items;
  final double indicatorRadius;
  final double _spaceIndicator = 6.0;

  ScreenDateIndicator(
      {this.hasNext: false,
      @required this.headTime,
      @required this.items,
      this.indicatorRadius: 30.0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _indicator(),
        _body(context),
      ],
    );
  }

  _indicator() {
    return Positioned(
      top: indicatorRadius + _spaceIndicator,
      bottom: _spaceIndicator,
      left: (indicatorRadius / 2),
      child: hasNext
          ? Container(
              width: 1,
              color: Color(0xFFC2C2C2),
            )
          : Container(),
    );
  }

  _body(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: indicatorRadius,
                  height: indicatorRadius,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
                SizedBox(width: 5),
                Text(
                  parseDate(headTime),
                ),
              ],
            ),
            Container(
              // width: double.infinity,
              // color: Colors.red,
              width: MediaQuery.of(context).size.width - 32,
              padding: EdgeInsets.all(indicatorRadius),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items,
              ),
            ),
          ],
        )
      ],
    );
  }
}
