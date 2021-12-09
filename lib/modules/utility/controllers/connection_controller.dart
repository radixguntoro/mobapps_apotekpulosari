import 'dart:async';
import 'package:apotik_pulosari/config/url.dart';
import 'package:apotik_pulosari/modules/utility/models/model_connection.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:new_version/new_version.dart';

class ConnectionController extends GetxController {
  String status;
  String localVersion;
  String storeVersion;
  String appStoreLink;

  // void checkVersion(ctx) async{
  //   final newVersion = NewVersion(
  //     context: ctx,
  //     androidId: 'com.izdihardev.apotek_pulosari',
  //   );
    
  //   final status = await newVersion.getVersionStatus();
  //   localVersion = status.localVersion.toString();
  //   storeVersion = status.storeVersion.toString();
  //   appStoreLink = status.appStoreLink.toString();
  //   print("LOKAL: $localVersion");
  //   print("STORE: $storeVersion");
  //   update();
  // }

  void setStatus(result) async{
    var resp = await Connectivity().checkConnectivity();
    switch(resp) {
      case ConnectivityResult.wifi:
        const oneSec = const Duration(seconds: 1);
        Timer.periodic(
          oneSec,
          (Timer timer) async{
            if (ModelConnection.timeSecond == 0) {
              ModelConnection.resultNetwork = "disconnected";
              timer.cancel();
              update();
            } else {
              print("mulai: ${ModelConnection.timeSecond}");
              ModelConnection.timeSecond--;
              update();
              var result = await Dio().get(Url.baseUrl);
              if(result.statusCode == 200) {
                ModelConnection.resultNetwork = "connected";
                timer.cancel();
                update();
              }
            }
          },
        );
        break;
      case ConnectivityResult.mobile:
        const oneSec = const Duration(seconds: 1);
        Timer.periodic(
          oneSec,
          (Timer timer) async{
            if (ModelConnection.timeSecond == 0) {
              ModelConnection.resultNetwork = "disconnected";
              timer.cancel();
              update();
            } else {
              print("mulai: $ModelConnection.timeSecond");
              ModelConnection.timeSecond--;
              update();
              var result = await Dio().get(Url.baseUrl);
              if(result.statusCode == 200) {
                ModelConnection.resultNetwork = "connected";
                timer.cancel();
                update();
              }
            }
          },
        );
        break;
      case ConnectivityResult.none:
        ModelConnection.resultNetwork = "disconnected";
        update();
        break;
      default:
    }
  }
}