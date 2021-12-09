import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyleController extends GetxController {
  
  Future<Widget> setTextStyle(text) async{
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 40
      ),
    );
  }
}