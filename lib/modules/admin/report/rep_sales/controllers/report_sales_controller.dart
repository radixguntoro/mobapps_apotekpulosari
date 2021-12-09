import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_print_credit_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_print_lab_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_print_mix_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_print_recipe_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_print_netto_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_print_regular_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/services/report_sales_service.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_credit/services/sales_credit_service.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/services/sales_lab_service.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/services/sales_mix_service.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/services/sales_netto_service.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/services/sales_recipe_service.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_regular/services/sales_regular_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportSalesController extends GetxController {
  ReportSalesPrintRegularController _reportSalesPrintRegularController = Get.put(ReportSalesPrintRegularController());
  ReportSalesPrintRecipeController _reportSalesPrintRecipeController = Get.put(ReportSalesPrintRecipeController());
  ReportSalesPrintMixController _reportSalesPrintMixController = Get.put(ReportSalesPrintMixController());
  ReportSalesPrintLabController _reportSalesPrintLabController = Get.put(ReportSalesPrintLabController());
  ReportSalesPrintNettoController _reportSalesPrintNettoController = Get.put(ReportSalesPrintNettoController());
  ReportSalesPrintCreditController _reportSalesPrintCreditController = Get.put(ReportSalesPrintCreditController());
  String medicineId = '';
  String customerPersonsId = '';
  String customerPersonsName = 'Cari pelanggan...';
  int page = 1;
  int limit = 50;
  int state = 0;
  String dateStart = '';
  String dateEnd = '';
  List<dynamic> group = [];
  List<dynamic> filterSalesType = [];
  List<dynamic> filterSalesStatus = [];
  String filterSalesTypeSingle = '307';
  int filterNettoState = 0;

  void isLoadingTrue() async{
    ModelReportSales.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelReportSales.isLoading = false;
  }

  void clearData() async {
    filterSalesType = [];
    group = [];
    dateStart = new DateTime.now().toString();
    dateEnd = new DateTime.now().toString();
    filterSalesType = [];
    filterSalesStatus = ['paid'];
    filterSalesTypeSingle = '307';
    customerPersonsId = '';
    customerPersonsName = 'Cari pelanggan...';
    ModelReportSales.dateStart = DateTime.now();
    ModelReportSales.dateEnd = DateTime.now();
    ModelReportSales.getDataDetail = {};
    ModelReportSales.getData = [];
    ModelReportSales.customerPersonsId = '';
    ModelReportSales.customerPersonsName = '';
  }

  void setClearFilterRecap() async {
    filterSalesStatus = ['paid'];
    ModelReportSales.dateStart = DateTime.now();
    ModelReportSales.dateEnd = DateTime.now();
  }

  void onInit() {
    readFirst();
  }
  
  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 50;
    state = ModelReportSales.state;
    dateStart = ModelReportSales.dateStart == null ? DateFormat('yyyy-MM-dd').format(DateTime.now()).toString() : DateFormat('yyyy-MM-dd').format(ModelReportSales.dateStart).toString();
    dateEnd = ModelReportSales.dateEnd == null ? DateFormat('yyyy-MM-dd').format(DateTime.now()).toString() : DateFormat('yyyy-MM-dd').format(ModelReportSales.dateEnd).toString();
    filterSalesStatus = state == 1 ? filterSalesStatus : state == 3 || state == 4 ? [] : ['paid'];
    ModelReportSales.maxData = false;
    var resp = await ReportSalesService.readData(page, limit, state, dateStart, dateEnd, group, filterSalesStatus, (state == 1 ? '306' : state == 2 ? filterSalesTypeSingle : filterSalesType), customerPersonsId, filterNettoState);
    ModelReportSales.getData = resp['data'];
    ModelReportSales.getDataHeader = resp;
    print(ModelReportSales.getDataHeader);
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelReportSales.currentPage + 1;
    print(page);
    if (page <= ModelReportSales.lastPage ) {
      var resp = await ReportSalesService.readData(page, limit, state, dateStart, dateEnd, group, filterSalesStatus, (state == 1 ? filterSalesTypeSingle : filterSalesType), customerPersonsId, filterNettoState);
      if (resp['data'].isEmpty) {
        ModelReportSales.maxData = true;
      } else {
        ModelReportSales.maxData = false;
        ModelReportSales.getData += resp['data'];
      }
      update();
    }
  }

  void readDetailRecap(id, codeId) async {
    ModelReportSales.getDataDetail = {};
    isLoadingTrue();
    update();

    switch (codeId) {
      case '301':
        var resp = await SalesRegularService.readDataById(id);
        ModelReportSales.getDataDetail = resp;
        break;
      case '302':
        var resp = await SalesMixService.readDataById(id);
        ModelReportSales.getDataDetail = resp;
        break;
      case '303':
        var resp = await SalesRecipeService.readDataById(id);
        ModelReportSales.getDataDetail = resp;
        break;
      case '304':
        var resp = await SalesLabService.readDataById(id);
        ModelReportSales.getDataDetail = resp;
        break;
      case '306':
        var resp = await SalesNettoService.readDataById(id);
        ModelReportSales.getDataDetail = resp;
        break;
      case '307':
        var resp = await SalesCreditService.readDataById(id);
        ModelReportSales.getDataDetail = resp;
        break;
      default:
    }

    print(ModelReportSales.getDataDetail.toString());
    isLoadingFalse();
    update();
  }

  void readDetail(id) async{
    ModelReportSales.getDataRecap = {};
    isLoadingTrue();
    update();
    page = 1;
    limit = 50;
    state = ModelReportSales.state;
    dateStart = ModelReportSales.dateStart == null ? '' : DateFormat('yyyy-MM-dd').format(ModelReportSales.dateStart).toString();
    dateEnd = ModelReportSales.dateEnd == null ? '' : DateFormat('yyyy-MM-dd').format(ModelReportSales.dateEnd).toString();
    if (state == 3) {
      filterSalesType = [306];
    }
    var resp = await ReportSalesService.readDetail(page, limit, state, dateStart, dateEnd, group, filterSalesStatus, (state == 2 ? filterSalesTypeSingle : filterSalesType), customerPersonsId, id);
    ModelReportSales.getDataRecap = resp;
    isLoadingFalse();
    update();
  }

  void setTabState(val) async {
    state = val;
    ModelReportSales.state = val;
    clearData();
    readFirst();
    update();
  }

  void setTabFilterNettoState(val) async {
    filterNettoState = val;
    clearData();
    readFirst();
    update();
  }

  void setDate(date, dateType) {
    print("Ready $dateType $state");
    if (dateType == 'dateRange') {
      ModelReportSales.dateStart = DateTime.parse(date[0].toString());
      ModelReportSales.dateEnd = DateTime.parse(date[1].toString());
      update();
      dateStart = date[0].toString();
      dateEnd = date[1].toString();
    } else {
      ModelReportSales.dateStart = (date == null ? DateTime.now() : date);
      ModelReportSales.dateEnd = (date == null ? DateTime.now() : date);
    }
    print(ModelReportSales.dateStart.toString());
    print(ModelReportSales.dateEnd.toString());
    update();
  }

  void setResetFilter() {
    clearData();
    if (state == 1) {
      readFirst();
    }
    update();
  }

  void setFilterSalesType(id) {
    if (filterSalesType.length > 0) {
      var result = filterSalesType.where((item) => item == id);
      if (result.isEmpty) {
        filterSalesType.add(id);
      } else {
        filterSalesType.removeWhere((item) => item == id);
      }
    } else {
      filterSalesType.add(id);
    }
    readFirst();
    update();
  }

  void setFilterSalesTypeSingle(id) {
    filterSalesStatus = ['paid'];
    filterSalesType = [];
    filterSalesTypeSingle = id;
    update();
  }

  void setFilterSalesStatus(id) {
    if (filterSalesStatus.length > 0) {
      var result = filterSalesStatus.where((item) => item == id);
      if (result.isEmpty) {
        filterSalesStatus.add(id);
      } else {
        filterSalesStatus.removeWhere((item) => item == id);
      }
    } else {
      filterSalesStatus.add(id);
    }
    print(filterSalesStatus.toString());
    update();
  }

  void setCustomer(val) async{
    customerPersonsId = val['id'];
    customerPersonsName = val['name'];
    ModelReportSales.customerPersonsId = val['id'];
    ModelReportSales.customerPersonsName = val['name'];
    print("Supp: $customerPersonsName");
    update();
  }

  void setFilterApply() {
    readFirst();
    update();
  }

  void setFilterApplyRecap(id) {
    readDetail(id);
    update();
  }

  void setScroll(_scrollController) {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll == currentScroll) {
      print(maxScroll);
      print(currentScroll);
      readMore();
    }
  }

  void exportToPDF(codesId) async {
    print(codesId);
    switch (codesId) {
      case '301':
        _reportSalesPrintRegularController.exportToPDF();
        break;
      case '302':
        _reportSalesPrintMixController.exportToPDF();
        break;
      case '303':
        _reportSalesPrintRecipeController.exportToPDF();
        break;
      case '304':
        _reportSalesPrintLabController.exportToPDF();
        break;
      case '306':
        _reportSalesPrintNettoController.exportToPDF();
        break;
      case '307':
        _reportSalesPrintCreditController.exportToPDF();
        break;
      default:
    }
  }
}