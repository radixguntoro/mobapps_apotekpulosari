import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:flutter/material.dart';

class HomeMenuPobb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        padding: EdgeInsets.only(top: (ModelAuth.permission != 99 && ModelAuth.permission != 1 ? 24 : 8), bottom: 16, left: 16, right: 16),
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .08),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 40,
                      margin: EdgeInsets.only(bottom: 8),
                      child: Image(
                        image: AssetImage("assets/images/icons/home_page/wallet.png")
                      ),
                    ),
                    Text(
                      "Saldo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .08),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 40,
                      margin: EdgeInsets.only(bottom: 8),
                      child: Image(
                        image: AssetImage("assets/images/icons/home_page/pobb.png")
                      ),
                    ),
                    Text(
                      "POBB",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}