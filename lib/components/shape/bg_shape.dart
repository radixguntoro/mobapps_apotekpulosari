import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:flutter/material.dart';

class BgShapeTop extends StatelessWidget {
  double getSmallDiameter(BuildContext context) => MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) => MediaQuery.of(context).size.width * 9/9;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          right: -getBigDiameter(context) / 3,
          top: -getBigDiameter(context) / 2,
          child: Container(
            width: getBigDiameter(context),
            height: getBigDiameter(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(15, 87, 49, 1),
            ),
          ),
        ),
        Positioned(
          left: -getSmallDiameter(context) / 3,
          top: -getSmallDiameter(context) / 2,
          child: Container(
            width: getSmallDiameter(context),
            height: getSmallDiameter(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(16, 96, 54, 1),
            ),
          ),
        ),
      ],
    );
  }
}

class BgShapeBottom extends StatelessWidget {
  double getSmallDiameter(BuildContext context) => MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) => MediaQuery.of(context).size.width * 9/9;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: -getBigDiameter(context) / 3,
          bottom: -getBigDiameter(context) / 1.5,
          child: Container(
            width: getBigDiameter(context),
            height: getBigDiameter(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(16, 96, 54, 2),
            ),
          ),
        ),
        Positioned(
          right: -getSmallDiameter(context) / 4,
          bottom: -getSmallDiameter(context) / 1.45,
          child: Container(
            width: getSmallDiameter(context),
            height: getSmallDiameter(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(15, 87, 49, 1),
            ),
          ),
        ),
      ],
    );
  }
}

class BgShapeBottomMix extends StatelessWidget {
  double getSmallDiameter(BuildContext context) => MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) => MediaQuery.of(context).size.width * 9/9;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: -getBigDiameter(context) / 3,
          bottom: -getBigDiameter(context) / 1.5,
          child: Container(
            width: getBigDiameter(context),
            height: getBigDiameter(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
        Positioned(
          right: -getSmallDiameter(context) / 4,
          bottom: -getSmallDiameter(context) / 1.45,
          child: Container(
            width: getSmallDiameter(context),
            height: getSmallDiameter(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(15, 87, 49, 1),
            ),
          ),
        ),
      ],
    );
  }
}


class BgShapeHalf extends StatelessWidget {
  double getFullWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double getFullHeight(BuildContext context) => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            width: getFullWidth(context),
            height: getFullHeight(context) * 2/3.2,
            decoration: BoxDecoration(
              color: ColorTheme.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              )
            ),
          ),
        ),
      ],
    );
  }
}