import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/models/model_sales_lab.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SalesLabService {
  static String modules = 'trSalesLab';
  static String moduleItems = 'item';
  String id;

  SalesLabService({
    this.id,
  });

  static Future<dynamic> createData() async {
    ModelSalesLab.data = {
      'patient': ModelSalesLab.patientName,
      'age': ModelSalesLab.patientAge,
      'glucosa_fasting': ModelSalesLab.patientGlucoseFasting,
      'glucosa_2hours_pp': ModelSalesLab.patientGlucose2hoursPP,
      'glucosa_random': ModelSalesLab.patientGlucoseRandom,
      'uric_acid': ModelSalesLab.patientUricAcid,
      'cholesterol': ModelSalesLab.patientCholesterol,
      'blood_pressure': ModelSalesLab.patientBloodPressure,
      'total': ModelSalesLab.total.toString(),
      'discount': ModelSalesLab.discount.toString(),
      'grand_total': ModelSalesLab.grandTotal.toString(),
      'payment': ModelSalesLab.payment.toString(),
      'balance': ModelSalesLab.balance.toString(),
      'details': ModelSalesLab.getCart
    };

    Map data = {
      "trSalesLab": json.encode(ModelSalesLab.data)
    };
    
    print(data.toString());
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
      return "error";
    }
  }

  static Future<String> readDataByBarcodeQRCode(barcode) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[moduleItems]['readByBarcode'] + "id=$barcode", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      if(resp['medicine'] != null) {
        ModelSalesLab.getCart.add({
          'medicines_items_id': resp['medicine']['medicines_items_id'],
          'name': resp['medicine']['item']['name'],
          'price': resp['medicine']['price_sell'],
          'qty_total': resp['medicine']['qty_total'],
          'qty': 1,
          'subtotal': resp['medicine']['price_sell'],
          'discount': 0,
          'unit': resp['medicine']['unit'],
          'category': resp['medicine']['item']['category']['name'],
        });
      return "success";
      } else {
        return "notfound";
      }
    } else {
      return "failed";
    }
  }
  
  static Future<Map> readDataById(id) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print("${Api.route[modules]['print'] + "$id"}");
    final request = await http.get(
      Api.route[modules]['print'] + "$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print("Hasil ${resp.toString()}");
      return resp['tr_sales_lab'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readData(int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[modules]['list'] + "search=&page=$page&row=$limit}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelSalesLab.totalData = resp['total'];
      ModelSalesLab.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[modules]['list'] + "search=$type&row=$limit}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelSalesLab.totalData = resp['total'];
      ModelSalesLab.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }
}