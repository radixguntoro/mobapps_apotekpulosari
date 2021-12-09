import 'dart:async';
import 'dart:io';
import 'package:apotik_pulosari/modules/utility/models/model_connection.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class ConnectionService {
  static Future<String> setStatus() async {
    var status;
    var resp = await Connectivity().checkConnectivity();
    switch(resp) {
      case ConnectivityResult.wifi:
        try {
          var response = await Dio().get(Api.route[ModelConnection.modules]['check']);
          if(response.statusCode == 200) {
            status = "connected";
          } else {
            status = "disconnected";
          }
        } on SocketException catch(e) {
          print(e.toString());
          status = "disconnected";
        }
        break;
      case ConnectivityResult.mobile:
        try {
          var response = await Dio().get(Api.route[ModelConnection.modules]['check']);
          if(response.statusCode == 200) {
            status = "connected";
          } else {
            status = "disconnected";
          }
        } on SocketException catch(e) {
          print(e.toString());
          status = "disconnected";
        }
        break;
      case ConnectivityResult.none:
        status = "disconnected";
        break;
      default:
    }
    return status;
  }
}