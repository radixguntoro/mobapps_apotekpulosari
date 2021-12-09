import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/models/model_report_stock_opname.dart';
import 'package:apotik_pulosari/routes/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ReportStockOpnameService {
  String id;

  ReportStockOpnameService({
    this.id,
  });

  static Future<dynamic> readData(page, limit, state, dateStart, dateEnd, item, status) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[ModelReportStockOpname.modules]['readList'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&item=$item&status=$status");
    final request = await http.get(
      Api.route[ModelReportStockOpname.modules]['readList'] + "page=$page&row=$limit&state=$state&date_start=$dateStart&date_end=$dateEnd&item=$item&status=$status", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelReportStockOpname.totalData = resp['total'];
      ModelReportStockOpname.lastPage = resp['last_page'];
      ModelReportStockOpname.currentPage = resp['current_page'];
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }
}