import 'package:apotik_pulosari/modules/admin/master/category/services/category_service.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/services/report_item_card_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportItemCardController extends GetxController {
  String medicineId = '';
  String dateStart = '';
  String dateEnd = '';
  String sortStock;
  String sortName = 'asc';
  int page = 1;
  int limit = 50;
  int state = 0;
  bool isLoading;
  List<dynamic> filterCategory = []; 

  void isLoadingTrue() async{
    ModelReportItemCard.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelReportItemCard.isLoading = false;
  }

  void clearData() async {
    ModelReportItemCard.medicineName = 'Cari nama barang...';
    ModelReportItemCard.medicineId = '';
    ModelReportItemCard.dateStart = new DateTime.now();
    ModelReportItemCard.dateEnd = new DateTime.now();
    ModelReportItemCard.getData = [];
  }

  void setResetFilter() async {
    ModelReportItemCard.dateStart = new DateTime.now();
    ModelReportItemCard.dateEnd = new DateTime.now();
    ModelReportItemCard.medicineName = 'Cari nama barang...';
    ModelReportItemCard.medicineId = '';
    filterCategory = [];
    update();
  }

  void setResetSort() async {
    sortName = 'asc';
    sortStock = null;
    update();
  }

  @override
  void onInit() async{
    ModelReportItemCard.filterCategory = await CategoryService.readDataAll();
  }

  void setItem(data) async {
    ModelReportItemCard.medicineName = data['name'];
    ModelReportItemCard.medicineId = data['id'];
    update();
  }

  void setDate(date, dateType) async {
    if (dateType == 'dateRange') {
      ModelReportItemCard.dateStart = date[0];
      ModelReportItemCard.dateEnd = date[1];
    } else {
      ModelReportItemCard.dateStart = (date == null ? DateTime.now() : date);
      ModelReportItemCard.dateEnd = (date == null ? DateTime.now() : date);
    }
    update();
  }

  void setTabState(val) async {
    state = val;
    ModelReportItemCard.state = val;
    switch (state) {
      case 0:
        setResetFilter();
        ModelReportItemCard.dataItems = [];
        break;
      case 1:
        setResetFilter();
        readItemStockList();
        break;
      case 2:
        setResetFilter();
        readItemStockOutInList();
        break;
      case 3:
        setResetFilter();
        readItemStockOutInList();
        break;
      default:
    }
    clearData();
    update();
  }

  void setScroll(_scrollController) {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    print(currentScroll);
    if (maxScroll == currentScroll) {
      print(maxScroll);
    }
  }

  void setHorizontalScroll(_scrollController) {
    ModelReportItemCard.maxScroll = _scrollController.position.maxScrollExtent;
    ModelReportItemCard.currentScroll = _scrollController.position.pixels;
    // print(ModelReportItemCard.currentScroll);
    update();
  }

  void readHistoryStockList() async {
    isLoadingTrue();
    update();
    medicineId = ModelReportItemCard.medicineId;
    dateStart = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateStart).toString();
    dateEnd = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateEnd).toString();
    
    ModelReportItemCard.maxData = false;
    var resp = await ReportItemCardService.readHistoryStockList(medicineId, dateStart, dateEnd);
    ModelReportItemCard.getData = resp;
    isLoadingFalse();
    update();
  }

  void readHistoryStockDetail(transactionId, titleId) async {
    isLoadingTrue();
    update();
    var resp = await ReportItemCardService.readHistoryStockDetail(transactionId, titleId);
    ModelReportItemCard.getDataTransaction = resp;
    print(ModelReportItemCard.getDataTransaction);
    isLoadingFalse();
    update();
  }

  void readItemStockList() async {
    setResetSort();
    isLoading = true;
    update();

    page = 1;
    limit = 50;
    dateStart = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateStart).toString();
    dateEnd = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateEnd).toString();
    
    ModelReportItemCard.maxData = false;
    var resp = await ReportItemCardService.readItemStockList(page, dateStart, dateEnd, sortName, sortStock, filterCategory);
    ModelReportItemCard.dataItems = resp['data'];
    isLoading = false;
    update();
  }

  void readItemStockOutInList() async {
    setResetSort();
    isLoading = true;
    update();

    if (state == 2) {
      page = 1;
      limit = 50;
      dateStart = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateStart).toString();
      dateEnd = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateEnd).toString();
      
      var resp = await ReportItemCardService.readItemStockOutList(page, dateStart, dateEnd, filterCategory);
      ModelReportItemCard.dataItemsOut = resp['data'];
      ModelReportItemCard.totalItemsOut = double.parse(resp['total'].toString());
      ModelReportItemCard.qtyItemsOut = int.parse(resp['total_items'].toString());
    } else {
      page = 1;
      limit = 50;
      dateStart = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateStart).toString();
      dateEnd = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateEnd).toString();
      
      var resp = await ReportItemCardService.readItemStockInList(page, dateStart, dateEnd, filterCategory);
      ModelReportItemCard.dataItemsIn = resp['data'];
      ModelReportItemCard.totalItemsIn = double.parse(resp['total'].toString());
      ModelReportItemCard.qtyItemsIn = int.parse(resp['total_items'].toString());
    }
    isLoading = false;
    update();
  }

  void setSortData(col) async {
    switch (col) {
      case 'name':
        sortName = sortName == null ? 'asc' : sortName == 'asc' ? 'desc' : 'asc';
        sortStock = null;
        if (sortName == 'asc') {
          ModelReportItemCard.dataItems.sort((a, b) => a['name'].compareTo(b['name']));
        } else {
          ModelReportItemCard.dataItems.sort((a, b) => b['name'].compareTo(a['name']));
        }
        break;
      case 'stock':
        sortStock = sortStock == null ? 'asc' : sortStock == 'asc' ? 'desc' : 'asc';
        sortName = null;
        if (sortStock == 'asc') {
          ModelReportItemCard.dataItems.sort((a, b) => a['stock'].compareTo(b['stock']));
        } else {
          ModelReportItemCard.dataItems.sort((a, b) => b['stock'].compareTo(a['stock']));
        }
        break;
      default:
    }
    update();
  }

  void setFilterCategory(categoryId) async{
    if (filterCategory.length > 0) {
      var result = filterCategory.where((item) => item == categoryId);
      if (result.isEmpty) {
        filterCategory.add(categoryId);
      } else {
        filterCategory.removeWhere((item) => item == categoryId);
      }
    } else {
      filterCategory.add(categoryId);
    }
    print(filterCategory);
    update();
  }
}