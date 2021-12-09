import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/models/model_closing_cashier.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ClosingCashierService {
  static String modules = 'closingCashier';
  static String moduleItems = 'item';
  String id;

  ClosingCashierService({
    this.id,
  });

  static Future<dynamic> createData() async {
    ModelClosingCashier.data = {
      'shift': ModelClosingCashier.shift,
      'income_app': ModelClosingCashier.incomeApp,
      'income_real': ModelClosingCashier.incomeReal,
      'sales': ModelClosingCashier.getSales
    };

    Map data = {
      "closingCashier": json.encode(ModelClosingCashier.data)
    };
    // print(data.toString());
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      var resp = json.decode(request.body);
      print(resp.toString());
      return resp;
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }
  
  static Future<List> readDataByCashier(id) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readCashier'] + "closing_cashier_id=$id");
    // return null;
    final request = await http.get(
      Api.route[modules]['readCashier'] + "closing_cashier_id=$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp.toString());
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySales(id) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readSalesType'] + "closing_cashier_id=$id");
    final request = await http.get(
      Api.route[modules]['readSalesType'] + "closing_cashier_id=$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp.toString());
      return resp;
    } else {
      throw Exception('error fetching data');
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
      ModelClosingCashier.totalData = resp['total'];
      ModelClosingCashier.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[modules]['readList'] + "search=$type&row=$limit}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelClosingCashier.totalData = resp['total'];
      ModelClosingCashier.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataSales(int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readSalesAll'] + "page=$page&row=$limit");
    final request = await http.get(
      Api.route[modules]['readSalesAll'] + "page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelClosingCashier.totalDataSales = resp['total'];
      ModelClosingCashier.currentPageSales = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<String> readShift() async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readShift']);
    final request = await http.get(
      Api.route[modules]['readShift'], 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp.toString();
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<dynamic> updateData(param) async {
    ModelClosingCashier.data = {
      'id': param['id'].toString(),
      'income_app': param['income_app'].toString(),
      'income_real': ModelClosingCashier.incomeReal,
      'total_return': param['total_return'].toString(),
    };

    Map data = {
      "closingCashier": json.encode(ModelClosingCashier.data)
    };
    // print(data.toString());
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[modules]['update'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
      return resp;
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }
}