import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/unit/models/model_unit.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UnitService {
  static String modules = 'unit';
  String id;
  String name;

  UnitService({
    this.id,
    this.name,
  });

  static Future<String> createData() async {
    ModelUnit.data = {
      "device": 'mobile',
      "name": ModelUnit.name,
    };

    Map data = {
      "unit": json.encode(ModelUnit.data)
    };

    print("Inputan $data");

    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      
      if (request.statusCode == 200) {
        ModelUnit.resp = "success";
      } else if(request.statusCode == 500) {
        ModelUnit.resp = "failed";
      }
      return "success";
    } catch (e) {
      return "failed";
    }
  }

  static Future<List> readData(int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readList'] + "search=&page=$page&row=$limit");
    final request = await http.get(
      Api.route[modules]['readList'] + "search=&page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelUnit.totalData = resp['total'];
      ModelUnit.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[modules]['readList'] + "search=$type&page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelUnit.totalData = resp['total'];
      ModelUnit.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<String> readDetailData(val) async {
    ModelUnit.id = val['id'].toString();
    ModelUnit.name = val['name'];
    return "success";
  }

  static Future<List> readDataAll() async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[modules]['readDataAll'],
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"}
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp);
      if (resp.length > 0) {
        return resp;
      } else {
        return resp;
      }
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<String> updateData() async {
    ModelUnit.data = {
      "id": ModelUnit.id,
      "name": ModelUnit.name,
    };

    Map data = {
      "unit": json.encode(ModelUnit.data)
    };

    print("Inputan $data");

    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[modules]['update'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      print("Request" + request.body);
      if (request.statusCode == 200) {
        ModelUnit.resp = "success";
      } else if(request.statusCode == 500) {
        ModelUnit.resp = "failed";
      }
      return "success";
    } catch (e) {
      return "failed";
    }
  }
}