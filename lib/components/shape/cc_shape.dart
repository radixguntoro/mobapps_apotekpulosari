import 'package:flutter/material.dart';

class CcShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 24,
          bottom: 32,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 95, 0, 1),
              shape: BoxShape.circle
            ),
          ),
        ),
        Positioned(
          right: 56,
          bottom: 32,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 0, 27, .80),
              shape: BoxShape.circle
            ),
          ),
        ),
        Positioned(
          left: 36,
          top: 24,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Color.fromRGBO(4, 60, 62, 1),
              shape: BoxShape.circle
            ),
          ),
        ),
        Positioned(
          left: 24,
          top: 24,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Color.fromRGBO(5, 81, 84, 1),
              shape: BoxShape.circle
            ),
          ),
        ),
        Positioned(
          left: -16,
          bottom: -64,
          child: Transform.rotate(
            angle: 12.0,
            child: Container(
              width: 200,
              height: 125,
              decoration: BoxDecoration(
                color: Color.fromRGBO(5, 81, 84, 1),
                borderRadius: BorderRadius.circular(16)
              ),
            ),
          )
        ),
        Positioned(
          left: -40,
          bottom: -56,
          child: Transform.rotate(
            angle: 12.0,
            child: Container(
              width: 200,
              height: 125,
              decoration: BoxDecoration(
                color: Color.fromRGBO(4, 60, 62, 1),
                borderRadius: BorderRadius.circular(16)
              ),
            ),
          )
        ),
      ],
    );
  }
}



