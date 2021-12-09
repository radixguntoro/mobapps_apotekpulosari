import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/transaction/return/models/model_return.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ReturnService {
  String id;

  ReturnService({
    this.id,
  });

  static Future<String> createData() async {
    ModelReturn.data = {
      'price': ModelReturn.medicinePrice,
      'discount': ModelReturn.discountReturn,
      'qty': ModelReturn.qtyReturn,
      'medicines_items_id': ModelReturn.medicineId,
    };

    Map data = {
      "return": json.encode(ModelReturn.data)
    };
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(data.toString());
    print(Api.route[ModelReturn.modules]['create']);

    try {
      final request = await http.post(
        Api.route[ModelReturn.modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      if (request.statusCode == 200) {
        if(resp['status'] == 1) {
          return "success";
        } else {
          return "failed";
        }
      } else {
        return "failed";
      }
    } catch (e) {
      return "failed";
    }
  }

  static Future<String> readDataByBarcodeQRCode(barcode) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[ModelItem.modules]['readByBarcode'] + "id=$barcode");
    final request = await http.get(
      Api.route[ModelItem.modules]['readByBarcode'] + "id=$barcode", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print("Hasil: ${json.decode(request.body)}");
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      if(resp['medicine'] != null) {
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
    final request = await http.get(
      Api.route[ModelReturn.modules]['print'] + "$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print("Inputan ${Api.route[ModelReturn.modules]['print'] + "$id"}");
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp['tr_return'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readData(int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[ModelReturn.modules]['readList'] + "search=&page=$page&row=$limit",);
    final request = await http.get(
      Api.route[ModelReturn.modules]['readList'] + "search=&page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelReturn.totalData = resp['total'];
      ModelReturn.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[ModelReturn.modules]['readList'] + "search=$type&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelReturn.totalData = resp['total'];
      ModelReturn.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }
}