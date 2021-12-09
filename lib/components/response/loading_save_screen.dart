import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mdi/mdi.dart';

class LoadingSaveScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ColorsBase.primary.withOpacity(0.16),
                        shape: BoxShape.circle
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorTheme.primary,
                          shape: BoxShape.circle
                        ),
                        child: Icon(
                          Mdi.timerSand,
                          size: 56,
                          color: Colors.white,
                        ),
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24, bottom: 16),
                      child: SpinKitThreeBounce(
                        color: ColorTheme.primary,
                        size: 24.0,
                      )
                    ),
                    Container(
                      child: Text(
                        "Proses Menyimpan...",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}