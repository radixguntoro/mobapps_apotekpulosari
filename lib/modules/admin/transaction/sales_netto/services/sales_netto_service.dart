import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/models/model_sales_netto.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SalesNettoService {
  String id;

  SalesNettoService({
    this.id,
  });

  static Future<dynamic> createData() async {
    ModelSalesNetto.data = {
      'total': ModelSalesNetto.total.toString(),
      'discount': ModelSalesNetto.discount.toString(),
      'grand_total': ModelSalesNetto.grandTotal.toString(),
      'payment': ModelSalesNetto.payment.toString(),
      'balance': ModelSalesNetto.balance.toString(),
      'ppn': ModelSalesNetto.ppn.toString(),
      'ppn_price': ModelSalesNetto.ppnPrice.toStringAsFixed(2),
      'details': ModelSalesNetto.getCart,
      'status': ModelSalesNetto.paymentStatus,
      'customers_persons_id': ModelSalesNetto.customerPersonsId,
    };

    Map data = {
      "trSalesNetto": json.encode(ModelSalesNetto.data)
    };
    print(data.toString());
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[ModelSalesNetto.modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      
      return resp;
    } catch (e) {
      return "error";
    }
  }

  static Future<String> createReturn(param, item) async {
    ModelSalesNetto.data = {
      'qty': ModelSalesNetto.qtyReturn,
      'transactions_id': param['tr_sales']['transactions_id'],
      'tr_sales_details_id': item['id'],
      'items_id': item['medicines_items_id'],
    };

    Map data = {
      "trSalesNetto": json.encode(ModelSalesNetto.data)
    };

    print(data.toString());
    print(Api.route[ModelSalesNetto.modules]['createReturn']);
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[ModelSalesNetto.modules]['createReturn'], 
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
      print(e);
      return "failed";
    }
  }

  static Future<String> createRepayment(param) async {
    ModelSalesNetto.data = {
      'transactions_id': param['tr_sales_transactions_id'].toString(),
      'date': ModelSalesNetto.customerRepaymentDate.toString(),
      'grand_total': param['tr_sales']['transaction']['grand_total'],
      'fee_display': ModelSalesNetto.feeDisplay.toString(),
    };

    Map data = {
      "trSalesNetto": json.encode(ModelSalesNetto.data)
    };

    print(data.toString());
    print(Api.route[ModelSalesNetto.modules]['createRepayment']);
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[ModelSalesNetto.modules]['createRepayment'], 
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

  static Future<String> createAdjustments(param, item) async {
    ModelSalesNetto.data = {
      'qty': ModelSalesNetto.qtyAdjustmentsDifference,
      'transactions_id': param['tr_sales_transactions_id'].toString(),
      'tr_sales_details_id': item['id'],
      'items_id': item['medicines_items_id'],
    };

    Map data = {
      "trSalesNetto": json.encode(ModelSalesNetto.data)
    };

    print(data.toString());
    print(Api.route[ModelSalesNetto.modules]['createAdjustments']);
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[ModelSalesNetto.modules]['createAdjustments'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      
      var resp = json.decode(request.body);
      print("Hasil Error: $resp");
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
      print(e);
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
        ModelSalesNetto.getCart.add({
          'medicines_items_id': resp['medicine']['medicines_items_id'],
          'name': resp['medicine']['item']['name'],
          'price': resp['medicine']['price_purchase'],
          'price_sell': resp['medicine']['price_purchase'],
          'qty': 1,
          'subtotal': resp['medicine']['price_purchase'],
          'discount': 0,
          'ppn': resp['medicine']['ppn'] == null ? '0.00' : resp['medicine']['ppn'],
          'ppnPrice': resp['medicine']['ppn'] == null ? '0.00' : (double.parse(resp['medicine']['ppn']) > 0 ? (double.parse(resp['medicine']['tabletPricePurchase']) * double.parse(resp['medicine']['ppn'])) : '0.00'),
          'isPPN': resp['medicine']['ppn'] == null ? false : (double.parse(resp['medicine']['ppn']) > 0 ? true : false),
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
      Api.route[ModelSalesNetto.modules]['print'] + "$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print("Inputan ${Api.route[ModelSalesNetto.modules]['print'] + "$id"}");
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp['tr_sales_netto'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readData(int page, int limit, invoiceDate, paymentDate, filter, customerPersonsId) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilter = (filter.toString()).replaceAll('[', '').replaceAll(']', '');
    print(Api.route[ModelSalesNetto.modules]['list'] + "search=&page=$page&row=$limit&invoice_date=$invoiceDate&payment_date=$paymentDate&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}&customer_id=$customerPersonsId");
    final request = await http.get(
      Api.route[ModelSalesNetto.modules]['list'] + "search=&page=$page&row=$limit&invoice_date=$invoiceDate&payment_date=$paymentDate&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}&customer_id=$customerPersonsId", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelSalesNetto.totalData = resp['total'];
      ModelSalesNetto.totalValue = double.parse(resp['value'].toString());
      ModelSalesNetto.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit, invoiceDate, paymentDate, filter) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilter = (filter.toString()).replaceAll('[', '').replaceAll(']', '');
    final request = await http.get(
      Api.route[ModelSalesNetto.modules]['list'] + "search=$type&row=$limit&invoice_date=$invoiceDate&payment_date=$paymentDate&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelSalesNetto.totalData = resp['total'];
      ModelSalesNetto.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }
}