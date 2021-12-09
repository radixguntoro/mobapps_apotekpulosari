import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
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
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Tunggu Sebentar!",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Data sedang diproses.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .75,
                      child: Image(
                        image: AssetImage("assets/images/icons/resp_page/progress.png"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        valueColor: AlwaysStoppedAnimation<Color>(ColorTheme.primary),
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