import 'package:flutter/material.dart';

class Infostate {
  static emptyData(context) {
    return Container(
      margin: EdgeInsets.only(top: 48),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              "Oops!",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 24),
            child: Text(
              "Data masih kosong",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Image(
              width: 208,
              image: AssetImage("assets/images/icons/state_page/noresult.png"),
            ),
          ),
        ],
      ),
    );
  }
  static emptyCart(context) {
    return Container(
      margin: EdgeInsets.only(top: 48),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              "Oops!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 24),
            child: Text(
              "Keranjang masih kosong",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Image(
              width: 208,
              image: AssetImage("assets/images/icons/state_page/emptycart.png"),
            ),
          ),
        ],
      ),
    );
  }
}