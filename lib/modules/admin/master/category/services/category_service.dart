import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/category/models/model_category.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static String modules = 'category';
  String id;
  String name;

  CategoryService({
    this.id,
    this.name,
  });

  static Future<String> createData() async {
    ModelCategory.data = {
      "device": 'mobile',
      "name": ModelCategory.name,
    };

    Map data = {
      "category": json.encode(ModelCategory.data)
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
        ModelCategory.resp = "success";
      } else if(request.statusCode == 500) {
        ModelCategory.resp = "failed";
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
      ModelCategory.totalData = resp['total'];
      ModelCategory.currentPage = resp['current_page'];
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
      ModelCategory.totalData = resp['total'];
      ModelCategory.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<String> readDetailData(val) async {
    ModelCategory.id = val['id'];
    ModelCategory.name = val['name'];
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
    ModelCategory.data = {
      "id": ModelCategory.id,
      "name": ModelCategory.name,
    };

    Map data = {
      "category": json.encode(ModelCategory.data)
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
        ModelCategory.resp = "success";
      } else if(request.statusCode == 500) {
        ModelCategory.resp = "failed";
      }
      return "success";
    } catch (e) {
      return "failed";
    }
  }
}