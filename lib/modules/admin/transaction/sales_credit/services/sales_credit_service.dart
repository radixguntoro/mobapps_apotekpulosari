import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_credit/models/model_sales_credit.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SalesCreditService {
  String id;

  SalesCreditService({
    this.id,
  });

  static Future<dynamic> createData() async {
    ModelSalesCredit.data = {
      'total': ModelSalesCredit.total.toString(),
      'discount': ModelSalesCredit.discount.toString(),
      'grand_total': ModelSalesCredit.grandTotal.toString(),
      'payment': ModelSalesCredit.payment.toString(),
      'balance': ModelSalesCredit.balance.toString(),
      'details': ModelSalesCredit.getCart,
      'status': ModelSalesCredit.paymentStatus,
      'customers_persons_id': ModelSalesCredit.customerPersonsId,
    };

    Map data = {
      "trSalesCredit": json.encode(ModelSalesCredit.data)
    };
    print(data.toString());
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[ModelSalesCredit.modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      return resp;
    } catch (e) {
      return "error";
    }
  }

  static Future<String> createRepayment(param) async {
    ModelSalesCredit.data = {
      'transactions_id': param['tr_sales_transactions_id'].toString(),
      'date': ModelSalesCredit.customerRepaymentDate.toString(),
      'grand_total': param['tr_sales']['transaction']['grand_total'],
    };

    Map data = {
      "trSalesCredit": json.encode(ModelSalesCredit.data)
    };

    print(data.toString());
    print(Api.route[ModelSalesCredit.modules]['createRepayment']);
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[ModelSalesCredit.modules]['createRepayment'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      
      if (request.statusCode == 200) {
        if(resp['status'] == 1) {
          return "success";
        } else {
          print(resp['result']);
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
    
    final request = await http.get(
      Api.route[ModelItem.modules]['readByBarcode'] + "id=$barcode", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print("Hasil: ${json.decode(request.body)}");
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      if(resp['medicine'] != null) {
        ModelSalesCredit.getCart.add({
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
      Api.route[ModelSalesCredit.modules]['print'] + "$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print("Inputan ${Api.route[ModelSalesCredit.modules]['print'] + "$id"}");
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp['tr_sales_credit'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readData(int page, int limit, date, filter) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilter = (filter.toString()).replaceAll('[', '').replaceAll(']', '');
    final request = await http.get(
      Api.route[ModelSalesCredit.modules]['list'] + "search=&page=$page&row=$limit&date=$date&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelSalesCredit.totalData = resp['total'];
      ModelSalesCredit.totalValue = double.parse(resp['value'].toString());
      ModelSalesCredit.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit, date, filter) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilter = (filter.toString()).replaceAll('[', '').replaceAll(']', '');
    final request = await http.get(
      Api.route[ModelSalesCredit.modules]['list'] + "search=$type&row=$limit&date=$date&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelSalesCredit.totalData = resp['total'];
      ModelSalesCredit.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }
}