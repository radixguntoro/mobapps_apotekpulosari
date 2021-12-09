import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/inventory/stock_adjustments/models/model_stock_adjustments.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class StockAdjustmentsService {
  String id;

  StockAdjustmentsService({
    this.id,
  });

  static Future<String> createIncomingGoods() async {
    ModelStockAdjustments.data = {
      'price': ModelStockAdjustments.medicinePrice,
      'discount': ModelStockAdjustments.discountAdjustments,
      'qty': ModelStockAdjustments.qtyAdjustments,
      'medicines_items_id': ModelStockAdjustments.medicineId,
      'note': ModelStockAdjustments.noteId,
    };

    Map data = {
      "stockAdjustments": json.encode(ModelStockAdjustments.data)
    };
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(data.toString());
    print(Api.route[ModelStockAdjustments.modules]['createIncomingGoods']);

    try {
      final request = await http.post(
        Api.route[ModelStockAdjustments.modules]['createIncomingGoods'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
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

  static Future<String> createExitGoods() async {
    ModelStockAdjustments.data = {
      'price': ModelStockAdjustments.medicinePrice,
      'discount': ModelStockAdjustments.discountAdjustments,
      'qty': ModelStockAdjustments.qtyAdjustments,
      'medicines_items_id': ModelStockAdjustments.medicineId,
      'note': ModelStockAdjustments.noteId,
    };

    Map data = {
      "stockAdjustments": json.encode(ModelStockAdjustments.data)
    };
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(data.toString());
    print(Api.route[ModelStockAdjustments.modules]['createExitGoods']);

    try {
      final request = await http.post(
        Api.route[ModelStockAdjustments.modules]['createExitGoods'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
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

  static Future<List> readData(int page, int limit, state) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[ModelStockAdjustments.modules]['readList'] + "search=&page=$page&row=$limit&state=$state",);
    final request = await http.get(
      Api.route[ModelStockAdjustments.modules]['readList'] + "search=&page=$page&row=$limit&state=$state", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelStockAdjustments.totalData = resp['total'];
      ModelStockAdjustments.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit, state) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[ModelStockAdjustments.modules]['readList'] + "search=$type&row=$limit&state=$state", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelStockAdjustments.totalData = resp['total'];
      ModelStockAdjustments.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }
}