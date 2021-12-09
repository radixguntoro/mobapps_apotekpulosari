import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/dashboard/models/model_dashboard.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DashboardService {
  static String modules = ModelDashboard.modules;
  
  static Future<Map> readTotalAsset() async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readTotalAsset']);
    try {
      final request = await http.get(
        Api.route[modules]['readTotalAsset'], 
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      if (request.statusCode == 200) {
        var resp = json.decode(request.body);
        return resp;
      } else {
        throw Exception('error fetching data');
      }
    } on SocketException {
      return null;
    }
  }

  static Future<Map> readTransactionPerDay() async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readTransactionPerDay']);
    try {
      final request = await http.get(
        Api.route[modules]['readTransactionPerDay'], 
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      if (request.statusCode == 200) {
        var resp = json.decode(request.body);
        return resp;
      } else {
        throw Exception('error fetching data');
      }
    } on SocketException {
      return null;
    }
  }
}