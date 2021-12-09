import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/services/report_purchase_service.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/services/purchase_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportPurchaseController extends GetxController {
  String medicineId = '';
  String supplierPersonsId = '';
  String supplierPersonsName = 'Cari supplier...';
  int page = 1;
  int limit = 50;
  int state = 1;
  String dateStart = new DateTime.now().toString();
  String dateEnd = new DateTime.now().toString();
  List<dynamic> group = [];
  List<dynamic> filterPurchaseType = [];
  List<dynamic> filterPurchaseStatus = [];
  String filterPurchaseTypeSingle = '307';
  bool isLoading = false;

  void isLoadingTrue() async{
    ModelReportPurchase.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelReportPurchase.isLoading = false;
  }

  void clearData() async {
    filterPurchaseType = [];
    group = [];
    dateStart = new DateTime.now().toString();
    dateEnd = new DateTime.now().toString();
    filterPurchaseType = [];
    filterPurchaseStatus = ['paid'];
    filterPurchaseTypeSingle = '307';
    supplierPersonsId = '';
    supplierPersonsName = 'Cari pelanggan...';
    ModelReportPurchase.dateStart = DateTime.now();
    ModelReportPurchase.dateEnd = DateTime.now();
    ModelReportPurchase.getDataDetail = {};
    ModelReportPurchase.getData = [];
    ModelReportPurchase.supplierPersonsId = '';
    ModelReportPurchase.supplierPersonsName = '';
  }

  void setClearFilterRecap() async {
    filterPurchaseStatus = ['paid'];
    ModelReportPurchase.dateStart = DateTime.now();
    ModelReportPurchase.dateEnd = DateTime.now();
    readFirst();
  }

  void onInit() {
    readFirst();
  }
  
  void readFirst() async{
    isLoading = true;
    update();
    page = 1;
    limit = 50;
    state = ModelReportPurchase.state;
    dateStart = DateFormat('yyyy-MM-dd').format(ModelReportPurchase.dateStart).toString();
    dateEnd = DateFormat('yyyy-MM-dd').format(ModelReportPurchase.dateEnd).toString();
    switch (state) {
      case 0:
        ModelReportPurchase.maxData = false;
        var resp = await ReportPurchaseService.readData(page, limit, state, dateStart, dateEnd, group, filterPurchaseStatus, supplierPersonsId);
        ModelReportPurchase.getData = resp['data'];
        ModelReportPurchase.getDataHeader = resp;
        break;
      case 1:
        ModelReportPurchase.maxDataSupplier = false;
        var resp = await ReportPurchaseService.readData(page, limit, state, dateStart, dateEnd, group, filterPurchaseStatus, supplierPersonsId);
        ModelReportPurchase.getDataSupplier = resp['data'];
        ModelReportPurchase.getDataHeaderSupplier = resp;
        break;
      case 2:
        ModelReportPurchase.maxDataPaid = false;
        var resp = await ReportPurchaseService.readData(page, limit, state, dateStart, dateEnd, group, filterPurchaseStatus, supplierPersonsId);
        ModelReportPurchase.getDataPaid = resp['data'];
        ModelReportPurchase.getDataHeaderPaid = resp;
        break;
      default:
    }
    isLoading = false;
    update();
  }

  void readMore() async{
    switch (state) {
      case 0:
        page = ModelReportPurchase.currentPage + 1;
        print(page);
        if (page <= ModelReportPurchase.lastPage ) {
          var resp = await ReportPurchaseService.readData(page, limit, state, dateStart, dateEnd, group, filterPurchaseStatus, supplierPersonsId);
          if (resp['data'].isEmpty) {
            ModelReportPurchase.maxData = true;
          } else {
            ModelReportPurchase.maxData = false;
            ModelReportPurchase.getData += resp['data'];
          }
          update();
        }
        break;
      case 1:
        page = ModelReportPurchase.currentPageSupplier + 1;
        print(page);
        if (page <= ModelReportPurchase.lastPageSupplier ) {
          var resp = await ReportPurchaseService.readData(page, limit, state, dateStart, dateEnd, group, filterPurchaseStatus, supplierPersonsId);
          if (resp['data'].isEmpty) {
            ModelReportPurchase.maxDataSupplier = true;
          } else {
            ModelReportPurchase.maxDataSupplier = false;
            ModelReportPurchase.getDataSupplier += resp['data'];
          }
          update();
        }
        break;
      case 2:
        page = ModelReportPurchase.currentPagePaid + 1;
        print(page);
        if (page <= ModelReportPurchase.lastPagePaid ) {
          var resp = await ReportPurchaseService.readData(page, limit, state, dateStart, dateEnd, group, filterPurchaseStatus, supplierPersonsId);
          if (resp['data'].isEmpty) {
            ModelReportPurchase.maxDataPaid = true;
          } else {
            ModelReportPurchase.maxDataPaid = false;
            ModelReportPurchase.getDataPaid += resp['data'];
          }
          update();
        }
        break;
      default:
    }
  }

  void readDetail(id) async{
    ModelReportPurchase.getDataRecap = {};
    isLoading = true;
    update();
    page = 1;
    limit = 50;
    state = ModelReportPurchase.state;
    dateStart = DateFormat('yyyy-MM-dd').format(ModelReportPurchase.dateStart).toString();
    dateEnd = DateFormat('yyyy-MM-dd').format(ModelReportPurchase.dateEnd).toString();
    var resp = await ReportPurchaseService.readDetail(page, limit, state, dateStart, dateEnd, group, filterPurchaseStatus, supplierPersonsId, id);
    ModelReportPurchase.getDataRecap = resp;
    isLoading = false;
    update();
  }

  void readDetailRecap(id) async {
    ModelReportPurchase.getDataDetail = {};
    isLoading = true;
    update();

    var resp = await PurchaseService.readDataById(id);
    ModelReportPurchase.getDataDetail = resp;

    print(ModelReportPurchase.getDataDetail.toString());
    isLoading = false;
    update();
  }

  void setTabState(val) async {
    state = val;
    ModelReportPurchase.state = val;
    clearData();
    readFirst();
    update();
  }

  void setDate(date, dateType) {
    print("Ready $date");
    if (dateType == 'dateRange') {
      ModelReportPurchase.dateStart = DateTime.parse(date[0].toString());
      ModelReportPurchase.dateEnd = DateTime.parse(date[1].toString());
      update();
    } else {
      ModelReportPurchase.dateStart = (date == null ? DateTime.now() : date);
      ModelReportPurchase.dateEnd = (date == null ? DateTime.now() : date);
      update();
    }
  }

  void setResetFilter() {
    clearData();
    update();
  }

  void setFilterPurchaseType(id) {
    if (filterPurchaseType.length > 0) {
      var result = filterPurchaseType.where((item) => item == id);
      if (result.isEmpty) {
        filterPurchaseType.add(id);
      } else {
        filterPurchaseType.removeWhere((item) => item == id);
      }
    } else {
      filterPurchaseType.add(id);
    }
    readFirst();
    update();
  }

  void setFilterPurchaseTypeSingle(id) {
    filterPurchaseStatus = [];
    filterPurchaseType = [];
    filterPurchaseTypeSingle = id;
    update();
  }

  void setFilterPurchaseStatus(id) {
    if (filterPurchaseStatus.length > 0) {
      var result = filterPurchaseStatus.where((item) => item == id);
      if (result.isEmpty) {
        filterPurchaseStatus.add(id);
      } else {
        filterPurchaseStatus.removeWhere((item) => item == id);
      }
    } else {
      filterPurchaseStatus.add(id);
    }
    if (state == 0) {
      readFirst();
    }
    update();
  }

  void setSupplier(val) async{
    supplierPersonsId = val['id'];
    supplierPersonsName = val['name'];
    ModelReportPurchase.supplierPersonsId = val['id'];
    ModelReportPurchase.supplierPersonsName = val['name'];
    print(val);
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
}