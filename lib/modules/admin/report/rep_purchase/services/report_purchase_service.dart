import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ReportPurchaseService {
  String id;

  ReportPurchaseService({
    this.id,
  });

  static Future<dynamic> readData(page, limit, state, dateStart, dateEnd, group, filterSalesStatus, supplier) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilterSalesStatus = (filterSalesStatus.toString()).replaceAll('[', '').replaceAll(']', '');
    print(Api.route[ModelReportPurchase.modules]['readList'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&status=${setFilterSalesStatus.replaceAll(new RegExp(r"\s+"), "")}&supplier=$supplier");
    final request = await http.get(
      Api.route[ModelReportPurchase.modules]['readList'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&status=${setFilterSalesStatus.replaceAll(new RegExp(r"\s+"), "")}&supplier=$supplier", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelReportPurchase.totalData = resp['total'];
      ModelReportPurchase.lastPage = resp['last_page'];
      ModelReportPurchase.currentPage = resp['current_page'];
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<dynamic> readDetail(page, limit, state, dateStart, dateEnd, group, filterSalesStatus, supplier, id) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilterSalesStatus = (filterSalesStatus.toString()).replaceAll('[', '').replaceAll(']', '');
    print(Api.route[ModelReportPurchase.modules]['readDetail'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&status=${setFilterSalesStatus.replaceAll(new RegExp(r"\s+"), "")}&supplier=$supplier&id=$id");
    final request = await http.get(
      Api.route[ModelReportPurchase.modules]['readDetail'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&status=${setFilterSalesStatus.replaceAll(new RegExp(r"\s+"), "")}&supplier=$supplier&id=$id", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }
}