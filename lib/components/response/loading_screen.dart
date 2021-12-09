import 'package:apotik_pulosari/components/utilities/color.dart';
// import 'package:apotik_pulosari/modules/utility/models/model_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: ColorTheme.primary,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 32),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 88,
                        height: 88,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: ColorTheme.primary,
                          shape: BoxShape.circle
                        ),
                        child: Container(
                          child: Image(
                            image: AssetImage("assets/images/logo.png"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: SpinKitThreeBounce(
                        color: Colors.white,
                        size: 24.0,
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Tunggu Sebentar...",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Container(
                    //   child: Text(
                    //     "${ModelConnection.timeSecond}",
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       color: Colors.white
                    //     ),
                    //   ),
                    // ),
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