import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/home/models/model_home.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeService {
  static String modules = 'home';

  static Future<Map> readMedicine(int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readMedicine'] + "search=&page=$page&row=$limit");
    final request = await http.get(
      Api.route[modules]['readMedicine'] + "search=&page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readMedicineBySearch(String type, int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    
    print('${Api.route[modules]['readMedicine'] + "search=$type&row=$limit"}');
    final request = await http.get(
      Api.route[modules]['readMedicine'] + "search=$type&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelHome.totalData = resp['total'];
      ModelHome.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }
}