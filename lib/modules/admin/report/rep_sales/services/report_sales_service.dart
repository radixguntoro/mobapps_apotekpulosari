import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ReportSalesService {
  String id;

  ReportSalesService({
    this.id,
  });

  static Future<dynamic> readData(page, limit, state, dateStart, dateEnd, group, filterSalesStatus, filterSalesType, customer, filterNettoState) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilterSalesType = (filterSalesType.toString()).replaceAll('[', '').replaceAll(']', '');
    final setFilterSalesStatus = (filterSalesStatus.toString()).replaceAll('[', '').replaceAll(']', '');
    
    print(Api.route[ModelReportSales.modules]['readList'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&status=${setFilterSalesStatus.replaceAll(new RegExp(r"\s+"), "")}&sales=${setFilterSalesType.replaceAll(new RegExp(r"\s+"), "")}&customer=$customer&state_netto=$filterNettoState");

    final request = await http.get(
      Api.route[ModelReportSales.modules]['readList'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&status=${setFilterSalesStatus.replaceAll(new RegExp(r"\s+"), "")}&sales=${setFilterSalesType.replaceAll(new RegExp(r"\s+"), "")}&customer=$customer&state_netto=$filterNettoState", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelReportSales.totalData = resp['total'];
      ModelReportSales.lastPage = resp['last_page'];
      ModelReportSales.currentPage = resp['current_page'];
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<dynamic> readDetail(page, limit, state, dateStart, dateEnd, group, filterSalesStatus, filterSalesType, customer, id) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    final setFilterSalesType = (filterSalesType.toString()).replaceAll('[', '').replaceAll(']', '');
    final setFilterSalesStatus = (filterSalesStatus.toString()).replaceAll('[', '').replaceAll(']', '');
    print(Api.route[ModelReportSales.modules]['readDetail'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&status=${setFilterSalesStatus.replaceAll(new RegExp(r"\s+"), "")}&sales=${setFilterSalesType.replaceAll(new RegExp(r"\s+"), "")}&customer=$customer&id=$id");
    final request = await http.get(
      Api.route[ModelReportSales.modules]['readDetail'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&status=${setFilterSalesStatus.replaceAll(new RegExp(r"\s+"), "")}&sales=${setFilterSalesType.replaceAll(new RegExp(r"\s+"), "")}&customer=$customer&id=$id", 
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