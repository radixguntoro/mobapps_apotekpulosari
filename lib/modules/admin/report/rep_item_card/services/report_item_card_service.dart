import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ReportItemCardService {
  String id;

  ReportItemCardService({
    this.id,
  });

  static Future<List> readHistoryStockList(medicineId, dateStart, dateEnd) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print("${Api.route[ModelReportItemCard.modules]['readHistoryStockList'] + "medicine_id=$medicineId&date_start=$dateStart&date_end=$dateEnd"}");
    final request = await http.get(
      Api.route[ModelReportItemCard.modules]['readHistoryStockList'] + "medicine_id=$medicineId&date_start=$dateStart&date_end=$dateEnd", 
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

  static Future<Map> readHistoryStockDetail(transactionId, titleId) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print("Inputan ${Api.route[ModelReportItemCard.modules]['readHistoryStockDetail'] + "transaction_id=$transactionId&title_id=$titleId"}");
    final request = await http.get(
      Api.route[ModelReportItemCard.modules]['readHistoryStockDetail'] + "transaction_id=$transactionId&title_id=$titleId", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<dynamic> readItemStockList(page, dateStart, dateEnd, sortName, sortStock, filterCategory) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilterCategory = (filterCategory.toString()).replaceAll('[', '').replaceAll(']', '');
    print("${Api.route[ModelReportItemCard.modules]['readItemStockList'] + "page=$page&date_start=$dateStart&date_end=$dateEnd"}&sort_name=$sortName&sort_stock=$sortStock&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}");
    final request = await http.get(
      Api.route[ModelReportItemCard.modules]['readItemStockList'] + "page=$page&date_start=$dateStart&date_end=$dateEnd&sort_name=$sortName&sort_stock=$sortStock&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelReportItemCard.totalData = resp['total'];
      // ModelReportItemCard.lastPage = resp['last_page'];
      // ModelReportItemCard.currentPage = resp['current_page'];
      print(resp.toString());
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<dynamic> readItemStockOutList(page, dateStart, dateEnd, filterCategory) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilterCategory = (filterCategory.toString()).replaceAll('[', '').replaceAll(']', '');
    print("${Api.route[ModelReportItemCard.modules]['readItemStockOutList'] + "page=$page&date_start=$dateStart&date_end=$dateEnd"}&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}");
    final request = await http.get(
      Api.route[ModelReportItemCard.modules]['readItemStockOutList'] + "page=$page&date_start=$dateStart&date_end=$dateEnd&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}", 
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

  static Future<dynamic> readItemStockInList(page, dateStart, dateEnd, filterCategory) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilterCategory = (filterCategory.toString()).replaceAll('[', '').replaceAll(']', '');
    print("${Api.route[ModelReportItemCard.modules]['readItemStockInList'] + "page=$page&date_start=$dateStart&date_end=$dateEnd"}&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}");
    final request = await http.get(
      Api.route[ModelReportItemCard.modules]['readItemStockInList'] + "page=$page&date_start=$dateStart&date_end=$dateEnd&category=${setFilterCategory.replaceAll(new RegExp(r"\s+"), "")}", 
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
}