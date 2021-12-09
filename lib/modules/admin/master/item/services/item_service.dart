import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ItemService {
  static String modules = 'item';

  static Future<dynamic> createData() async {
    readProfitByCategory(ModelItem.categoryId);

    ModelItem.data = {
      "device": 'mobile',
      "id": ModelItem.id,
      "name": ModelItem.name,
      "categories_id": ModelItem.categoryId,
      "unit_id": ModelItem.unitId,  
      "suppliers_persons_id": ModelItem.supplierPersonsId,
      "status": ModelItem.status,
      "condition": "update",
      "qty_total": ModelItem.qtyTotal,
      "qty_min": ModelItem.qtyMin,
      "users_persons_id": ModelAuth.personsId,
      "image_cover": ModelItem.imgBase64,
      "detail": [
        {
          "unit": "Tablet",
          "barcode": ModelItem.tabletBarcode,
          "qrcode": ModelItem.tabletQrcode,
          "qty": ModelItem.tabletQty,
          "price_sell": ModelItem.tabletPriceSell,
          "price_purchase": ModelItem.tabletPricePurchase,
          "profit_percent": ModelItem.tabletProfitPercent / 100,
        }
      ] 
    };

    Map data = {
      "medicine": json.encode(ModelItem.data)
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

      var resp = json.decode(request.body);
      print(resp.toString());
      return resp;
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }

  static Future<List> readData(int page, int limit, sortByName, filterCategory, filterUnit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilterCategory = (filterCategory.toString()).replaceAll('[', '').replaceAll(']', '');
    final setFilterUnit = (filterUnit.toString()).replaceAll('[', '').replaceAll(']', '');
    print(Api.route[modules]['list'] + "search=&page=$page&row=$limit&sort_name=$sortByName&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}&unit=${setFilterUnit.replaceAll(new RegExp(r"\s+"), "")}");
    final request = await http.get(
      Api.route[modules]['list'] + "search=&page=$page&row=$limit&sort_name=$sortByName&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}&unit=${setFilterUnit.replaceAll(new RegExp(r"\s+"), "")}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelItem.totalData = resp['total'];
      ModelItem.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit, sortByName, filterCategory, filterUnit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilterCategory = (filterCategory.toString()).replaceAll('[', '').replaceAll(']', '');
    final setFilterUnit = (filterUnit.toString()).replaceAll('[', '').replaceAll(']', '');
    print('${Api.route[modules]['list'] + "search=$type&row=$limit&sort_name=$sortByName&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}&unit=${setFilterUnit.replaceAll(new RegExp(r"\s+"), "")}"}');
    final request = await http.get(
      Api.route[modules]['list'] + "search=$type&row=$limit&sort_name=$sortByName&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}&unit=${setFilterUnit.replaceAll(new RegExp(r"\s+"), "")}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelItem.totalData = resp['total'];
      ModelItem.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static readProfitByCategory(val) async {
    switch (val) {
      case '1002000005':
        ModelItem.tabletProfitPercent = (0.1 * 100);
        break;
      case '1002000004':
        ModelItem.tabletProfitPercent = (0.0925 * 100);
        break;
      case '1002000003':
        ModelItem.tabletProfitPercent = (0.13 * 100);
        break;
      case '1002000002':
        ModelItem.tabletProfitPercent = (0.16 * 100);
        break;
      case '1002000001':
        ModelItem.tabletProfitPercent = (0.15 * 100);
        break;
      default:
    }
  }

  static Future<String> readDetailData(val) async {
    ModelItem.id = val['id'];
    ModelItem.name = val['name'];
    ModelItem.categoryId = val['categoryId'];
    ModelItem.unitId = val['unitId'].toString();
    ModelItem.imgBase64 = val['image'] == null || val['image'] == '' ? '' : val['image'];
    ModelItem.supplierPersonsId = val['supplierPersonsId'];
    ModelItem.qtyTotal = val['qtyTotal'];
    ModelItem.qtyMin = val['qtyMin'];
    ModelItem.tabletId = val['tabletId'].toString();
    ModelItem.tabletUnit = val['tabletUnit'];
    ModelItem.tabletBarcode = val['tabletBarcode'];
    ModelItem.tabletQrcode = val['tabletQrcode'];
    ModelItem.tabletPriceSell = double.parse(val['tabletPriceSell']);
    ModelItem.tabletPricePurchase = double.parse(val['tabletPricePurchase']);
    ModelItem.tabletProfitPercent = double.parse(val['tabletProfitPercent']) * 100;
    return "success";
  }

  static Future<dynamic> updateData() async {
    readProfitByCategory(ModelItem.categoryId);
    
    ModelItem.data = {
      "device": 'mobile',
      "id": ModelItem.id,
      "name": ModelItem.name,
      "categories_id": ModelItem.categoryId,
      "unit_id": ModelItem.unitId,
      "suppliers_persons_id": ModelItem.supplierPersonsId,
      "status": 'active',
      "condition": "update",
      "qty_total": ModelItem.qtyTotal,
      "qty_min": ModelItem.qtyMin,
      "users_persons_id": ModelAuth.personsId,
      "image_cover": ModelItem.imgBase64,
      "detail": [
        {
          "id": ModelItem.tabletId,
          "unit": ModelItem.tabletUnit,
          "barcode": ModelItem.tabletBarcode,
          "qrcode": ModelItem.tabletQrcode,
          "qty": ModelItem.tabletQty,
          "price_sell": ModelItem.tabletPriceSell,
          "price_purchase": ModelItem.tabletPricePurchase,
          "profit_percent": ModelItem.tabletProfitPercent / 100,
        }
      ] 
    };

    Map data = {
      "medicine": json.encode(ModelItem.data)
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

      var resp = json.decode(request.body);
      print(resp.toString());
      return resp;
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }
}