import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/models/model_stock_opname.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class StockOpnameService {
  String id;

  StockOpnameService({
    this.id,
  });

  static Future<String> createData() async {
    ModelStockOpname.data = {
      'medicines_items_id': ModelStockOpname.medicineId,
      'price_purchase_app': ModelStockOpname.pricePurchaseApp,
      'price_purchase_phx': ModelStockOpname.pricePurchasePhx,
      'price_purchase_difference': ModelStockOpname.pricePurchaseDifference,
      'price_sell_app': ModelStockOpname.priceSellApp,
      'price_sell_phx': ModelStockOpname.priceSellPhx,
      'price_sell_difference': ModelStockOpname.priceSellDifference,
      'stock_in_system': ModelStockOpname.stockInSystem,
      'stock_in_physic': ModelStockOpname.stockInPhysic,
      'stock_in_difference': ModelStockOpname.stockInDifference,
    };

    Map data = {
      "stockOpname": json.encode(ModelStockOpname.data)
    };
    // print(data.toString());
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[ModelStockOpname.modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
      
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
      print(e.toString());
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
        ModelStockOpname.medicineName = resp['medicine']['item']['name'];
        ModelStockOpname.medicineId = resp['medicine']['medicines_items_id'];
        ModelStockOpname.pricePurchaseApp = double.parse(resp['medicine']['price_purchase'].toString());
        ModelStockOpname.pricePurchaseAppSubtotal = double.parse(resp['medicine']['price_purchase'].toString()) * int.parse(resp['medicine']['qty_total'].toString());
        ModelStockOpname.priceSellApp = double.parse(resp['medicine']['price_sell'].toString());
        ModelStockOpname.priceSellAppSubtotal = double.parse(resp['medicine']['price_sell'].toString()) * int.parse(resp['medicine']['qty_total'].toString());
        ModelStockOpname.stockInSystem = int.parse(resp['medicine']['qty_total'].toString());
        return "success";
      } else {
        return "notfound";
      }
    } else {
      return "failed";
    }
  }

  static Future<List> readData(int page, int limit, filter) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilter = (filter.toString()).replaceAll('[', '').replaceAll(']', '');
    print("${Api.route[ModelStockOpname.modules]['readListMedicine'] + "search=&page=$page&row=$limit&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}"}");
    final request = await http.get(
      Api.route[ModelStockOpname.modules]['readListMedicine'] + "search=&page=$page&row=$limit&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelStockOpname.totalData = resp['total'];
      ModelStockOpname.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit, filter) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilter = (filter.toString()).replaceAll('[', '').replaceAll(']', '');
    print('${Api.route[ModelStockOpname.modules]['readListMedicine'] + "search=$type&row=$limit&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}"}');
    final request = await http.get(
      Api.route[ModelStockOpname.modules]['readListMedicine'] + "search=$type&row=$limit&filter=${setFilter.replaceAll(new RegExp(r"\s+"), "")}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelStockOpname.totalData = resp['total'];
      ModelStockOpname.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }
}