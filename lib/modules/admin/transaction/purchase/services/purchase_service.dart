import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/models/model_purchase.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PurchaseService {
  static String modules = 'trPurchase';
  static String moduleItems = 'item';
  String id;

  PurchaseService({
    this.id,
  });

  static Future<dynamic> createData() async {
    ModelPurchase.data = {
      'suppliers_persons_id': ModelPurchase.supplierId,
      'invoice_number': ModelPurchase.supplierInvoiceNumber,
      'date': ModelPurchase.supplierInvoiceDate.toString(),
      'total': ModelPurchase.total.toStringAsFixed(2),
      'discount': ModelPurchase.discount.toStringAsFixed(2),
      'grand_total': ModelPurchase.grandTotal.toStringAsFixed(2),
      'ppn': ModelPurchase.ppn.toString(),
      'ppn_price': ModelPurchase.ppnPrice.toStringAsFixed(2),
      'status': ModelPurchase.paymentStatus,
      'details': ModelPurchase.getCart,
    };

    Map data = {
      "trPurchase": json.encode(ModelPurchase.data)
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
      print(e.toString());
      return "error";
    }
  }

  static Future<String> createRepayment(param) async {
    ModelPurchase.data = {
      'transactions_id': param['transactions_id'].toString(),
      'date': ModelPurchase.supplierRepaymentDate.toString(),
      'grand_total': param['grand_total'],
    };

    Map data = {
      "trPurchase": json.encode(ModelPurchase.data)
    };

    print(data.toString());
    print(Api.route[modules]['createRepayment']);
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[modules]['createRepayment'], 
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

  static Future<String> createReturn(param, item) async {
    ModelPurchase.data = {
      'qty': ModelPurchase.qtyReturn,
      'transactions_id': param['transactions_id'],
      'tr_purchase_details_id': item['id'],
      'items_id': item['medicines_items_id'],
    };

    Map data = {
      "trPurchase": json.encode(ModelPurchase.data)
    };

    print(data.toString());
    print(Api.route[modules]['createReturn']);
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[modules]['createReturn'], 
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

  static Future<String> createAdjustments(param, item) async {
    ModelPurchase.data = {
      'qty': ModelPurchase.qtyAdjustmentsDifference,
      'transactions_id': param['transactions_id'],
      'tr_purchase_details_id': item['id'],
      'items_id': item['medicines_items_id'],
    };

    Map data = {
      "trPurchase": json.encode(ModelPurchase.data)
    };

    print(data.toString());
    print(Api.route[modules]['createAdjustments']);
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[modules]['createAdjustments'], 
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

  static Future<List> readDataByBarcodeQRCode(barcode) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[moduleItems]['readByBarcode'] + "id=$barcode", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelPurchase.getCart.add({
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
      print('Hasil Data: ' + ModelPurchase.getCart.toString());
      return ModelPurchase.getCart;
    } else {
      throw Exception('error fetching data');
    }
  }
  
  static Future<Map> readDataById(id) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[ModelPurchase.modules]['print'] + "$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print("Inputan ${Api.route[ModelPurchase.modules]['print'] + "$id"}");
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp['tr_purchase'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDetailMedicineId(id) async {
    print(id);
    GetStorage box = GetStorage();
    String token = box.read('token');
    print("Inputan ${Api.route[modules]['readDetailMedicineId'] + "$id"}");
    // return [];
    final request = await http.get(
      Api.route[modules]['readDetailMedicineId'] + "$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<bool> readExistInvoice(id) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print("Inputan ${Api.route[modules]['readExistInvoice'] + "$id"}");
    // return [];
    final request = await http.get(
      Api.route[modules]['readExistInvoice'] + "$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readData(int page, int limit, invoiceDate, paymentDate, filter, supplierId) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilter = (filter.toString()).replaceAll('[', '').replaceAll(']', '');
    print(Api.route[modules]['list'] + "search=&page=$page&row=$limit&invoice_date=$invoiceDate&payment_date=$paymentDate&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}&supplier_id=$supplierId");
    final request = await http.get(
      Api.route[modules]['list'] + "search=&page=$page&row=$limit&invoice_date=$invoiceDate&payment_date=$paymentDate&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}&supplier_id=$supplierId", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelPurchase.totalData = resp['total'];
      ModelPurchase.totalValue = double.parse(resp['value'].toString());
      ModelPurchase.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit, invoiceDate, paymentDate, filter) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilter = (filter.toString()).replaceAll('[', '').replaceAll(']', '');

    print(Api.route[modules]['list'] + "search=$type&page=$page&row=$limit&invoice_date=$invoiceDate&payment_date=$paymentDate&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}");
    final request = await http.get(
      Api.route[modules]['list'] + "search=$type&row=$limit&invoice_date=$invoiceDate&payment_date=$paymentDate&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelPurchase.totalData = resp['total'];
      ModelPurchase.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<String> updateInvoiceDate() async {
    ModelPurchase.data = {
      'transactions_id': ModelPurchase.transactionsId,
      'date': ModelPurchase.supplierInvoiceDate.toString(),
    };

    Map data = {
      "trPurchase": json.encode(ModelPurchase.data)
    };

    print(data.toString());
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[modules]['updateDate'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
      
      if (request.statusCode == 200) {
        ModelPurchase.resp = "success";
      } else if(request.statusCode == 500) {
        ModelPurchase.resp = "failed";
      }
      return "success";
    } catch (e) {
      return "failed";
    }
  }

  static Future<String> updateData() async {
    ModelPurchase.data = {
      'id': ModelPurchase.id,
      'suppliers_persons_id': ModelPurchase.supplierId,
      'invoice_number': ModelPurchase.supplierInvoiceNumber,
      'date': ModelPurchase.supplierInvoiceDate.toString(),
      'total': ModelPurchase.total.toStringAsFixed(2),
      'discount': ModelPurchase.discount.toStringAsFixed(2),
      'grand_total': ModelPurchase.grandTotal.toStringAsFixed(2),
      'ppn': ModelPurchase.ppn.toString(),
      'ppn_price': ModelPurchase.ppnPrice.toStringAsFixed(2),
      'status': ModelPurchase.paymentStatus,
      'details': ModelPurchase.getCart,
      'details_old': ModelPurchase.getCartOld,
    };

    Map data = {
      "trPurchase": json.encode(ModelPurchase.data)
    };

    print(data.toString());
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[modules]['updateData'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
      
      if (request.statusCode == 200) {
        ModelPurchase.resp = "success";
      } else if(request.statusCode == 500) {
        ModelPurchase.resp = "failed";
      }
      return resp['id'].toString();
    } catch (e) {
      return "failed";
    }
  }

  static Future<String> deleteData(purchase) async {
    // print(data);

    ModelPurchase.data = purchase;

    Map data = {
      "trPurchase": json.encode(ModelPurchase.data)
    };

    
    GetStorage box = GetStorage();
    String token = box.read('token');
    try {
      final request = await http.post(
        Api.route[modules]['delete'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
      
      if (request.statusCode == 200) {
        ModelPurchase.resp = "success";
      } else if(request.statusCode == 500) {
        ModelPurchase.resp = "failed";
      }
      // print(resp['result'].toString());
      return resp['id'].toString();
    } catch (e) {
      return "failed";
    }
  }
}