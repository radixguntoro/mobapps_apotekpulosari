import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_regular/models/model_sales_regular.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SalesRegularService {
  String id;

  SalesRegularService({
    this.id,
  });

  static Future<dynamic> createData() async {
    ModelSalesRegular.data = {
      'total': ModelSalesRegular.total.toString(),
      'discount': ModelSalesRegular.discount.toString(),
      'grand_total': ModelSalesRegular.grandTotal.toString(),
      'payment': ModelSalesRegular.payment.toString(),
      'balance': ModelSalesRegular.balance.toString(),
      'details': ModelSalesRegular.getCart
    };

    Map data = {
      "trSalesRegular": json.encode(ModelSalesRegular.data)
    };
    print(data.toString());
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');
    print("${Api.route[ModelSalesRegular.modules]['create']}");
    try {
      final request = await http.post(
        Api.route[ModelSalesRegular.modules]['create'], 
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
        ModelSalesRegular.getCart.add({
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
    final request = await http.get(
      Api.route[ModelSalesRegular.modules]['print'] + "$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print("Inputan ${Api.route[ModelSalesRegular.modules]['print'] + "$id"}");
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp['tr_sales_regular'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readData(int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[ModelSalesRegular.modules]['list'] + "search=&page=$page&row=$limit",);
    final request = await http.get(
      Api.route[ModelSalesRegular.modules]['list'] + "search=&page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelSalesRegular.totalData = resp['total'];
      ModelSalesRegular.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[ModelSalesRegular.modules]['list'] + "search=$type&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelSalesRegular.totalData = resp['total'];
      ModelSalesRegular.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }
}