import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class Snackbar {
  static created() {
    Get.snackbar(
      "Sukses",
      "Data berhasil disimpan",
      titleText: Container(
        child: Text(
          "Sukses!",
          style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.w600,
            fontSize: 12
          )
        ),
      ),
      messageText: Text(
        "Data berhasil disimpan",
        style: TextStyle(
          color: Colors.green[900],
          fontSize: 12,
        )
      ),
      backgroundColor: Colors.green[50].withOpacity(0.9),
      shouldIconPulse: true,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16),
      icon: Icon(
        Mdi.checkCircle,
        size: 24,
        color: Colors.green,
      ), 
      barBlur: 0,
      duration: Duration(seconds: 3),
      borderRadius: 5,
    );
  }

  static updated() {
    Get.snackbar(
      "Sukses",
      "Data berhasil diubah",
      titleText: Container(
        child: Text(
          "Sukses!",
          style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.w600,
            fontSize: 12
          )
        ),
      ),
      messageText: Text(
        "Data berhasil diubah",
        style: TextStyle(
          color: Colors.green[900],
          fontSize: 12,
        )
      ),
      backgroundColor: Colors.green[50].withOpacity(0.9),
      shouldIconPulse: true,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16),
      icon: Icon(
        Mdi.checkCircle,
        size: 24,
        color: Colors.green,
      ), 
      barBlur: 0,
      duration: Duration(seconds: 3),
      borderRadius: 5,
    );
  }

  static deleted() {
    Get.snackbar(
      "Sukses",
      "Data telah dihapus",
      titleText: Container(
        child: Text(
          "Sukses!",
          style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.w600,
            fontSize: 12
          )
        ),
      ),
      messageText: Text(
        "Data telah dihapus",
        style: TextStyle(
          color: Colors.green[900],
          fontSize: 12,
        )
      ),
      backgroundColor: Colors.green[50].withOpacity(0.9),
      shouldIconPulse: true,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16),
      icon: Icon(
        Mdi.checkCircle,
        size: 24,
        color: Colors.green,
      ), 
      barBlur: 0,
      duration: Duration(seconds: 3),
      borderRadius: 5,
    );
  }

  static failed() {
    Get.snackbar(
      "Oops!",
      "Terjadi kesalahan",
      titleText: Container(
        child: Text(
          "Oops!",
          style: TextStyle(
            color: Colors.red[800],
            fontWeight: FontWeight.w600,
            fontSize: 12
          )
        ),
      ),
      messageText: Text(
        "Terjadi kesalahan.",
        style: TextStyle(
          color: Colors.red[900],
          fontSize: 12,
        )
      ),
      backgroundColor: Colors.red[50].withOpacity(0.95),
      shouldIconPulse: true,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16),
      icon: Icon(
        Mdi.closeCircle,
        size: 24,
        color: Colors.red,
      ), 
      barBlur: 0,
      duration: Duration(seconds: 3),
      borderRadius: 5,
    );
  }

  static success(resp) {
    Get.snackbar(
      "Sukses",
      resp['msg'],
      titleText: Container(
        child: Text(
          "Sukses!",
          style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.w600,
            fontSize: 12
          )
        ),
      ),
      messageText: Text(
        resp['msg'],
        style: TextStyle(
          color: Colors.green[900],
          fontSize: 12,
        )
      ),
      backgroundColor: Colors.green[50].withOpacity(0.9),
      shouldIconPulse: true,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16),
      icon: Icon(
        Mdi.checkCircle,
        size: 24,
        color: Colors.green,
      ), 
      barBlur: 0,
      duration: Duration(seconds: 3),
      borderRadius: 5,
    );
  }

  static fail(resp) {
    Get.snackbar(
      "Oops!",
      resp['msg'],
      titleText: Container(
        child: Text(
          "Oops!",
          style: TextStyle(
            color: Colors.red[800],
            fontWeight: FontWeight.w600,
            fontSize: 12
          )
        ),
      ),
      messageText: Text(
        resp['msg'],
        style: TextStyle(
          color: Colors.red[900],
          fontSize: 12,
        )
      ),
      backgroundColor: Colors.red[50].withOpacity(0.95),
      shouldIconPulse: true,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16),
      icon: Icon(
        Mdi.closeCircle,
        size: 24,
        color: Colors.red,
      ), 
      barBlur: 0,
      duration: Duration(seconds: 3),
      borderRadius: 5,
    );
  }

  static notfound() {
    Get.snackbar(
      "Oops!",
      "Barang tidak ditemukan",
      titleText: Container(
        child: Text(
          "Oops!",
          style: TextStyle(
            color: Colors.red[800],
            fontWeight: FontWeight.w600,
            fontSize: 12
          )
        ),
      ),
      messageText: Text(
        "Barang tidak ditemukan",
        style: TextStyle(
          color: Colors.red[900],
          fontSize: 12,
        )
      ),
      backgroundColor: Colors.red[50].withOpacity(0.95),
      shouldIconPulse: true,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16),
      icon: Icon(
        Mdi.closeCircle,
        size: 24,
        color: Colors.red,
      ), 
      barBlur: 0,
      duration: Duration(seconds: 3),
      borderRadius: 5,
    );
  }

  static inactive() {
    Get.snackbar(
      "Oops!",
      "Pengguna di non-aktifkan",
      titleText: Container(
        margin: EdgeInsets.only(left: 6),
        child: Text(
          "Oops!",
          style: TextStyle(
            color: ColorTheme.danger,
            fontWeight: FontWeight.w600,
            fontSize: 12
          )
        ),
      ),
      messageText: Container(
        margin: EdgeInsets.only(left: 6),
        child: Text(
          "Pengguna di non-aktifkan",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          )
        ),
      ),
      backgroundColor: Colors.grey[900],
      shouldIconPulse: true,
      margin: EdgeInsets.all(16),
      icon: Container(
        margin: EdgeInsets.only(left: 12),
        child: Icon(
          Mdi.closeCircle,
          size: 24,
          color: ColorTheme.danger,
        ),
      ), 
      barBlur: 0,
      duration: Duration(seconds: 3),
      borderRadius: 5,
    );
  }

  static sessionExpired() {
    Get.snackbar(
      "Oops!",
      "Sessi anda telah berakhir",
      titleText: Container(
        child: Text(
          "Oops!",
          style: TextStyle(
            color: Colors.red[800],
            fontWeight: FontWeight.w600,
            fontSize: 12
          )
        ),
      ),
      messageText: Text(
        "Sessi anda telah berakhir",
        style: TextStyle(
          color: Colors.red[900],
          fontSize: 12,
        )
      ),
      backgroundColor: Colors.red[50].withOpacity(0.95),
      shouldIconPulse: true,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(16),
      icon: Icon(
        Mdi.closeCircle,
        size: 24,
        color: Colors.red,
      ), 
      barBlur: 0,
      duration: Duration(seconds: 3),
      borderRadius: 5,
    );
  }
}