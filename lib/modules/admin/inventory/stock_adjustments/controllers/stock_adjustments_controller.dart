import 'package:apotik_pulosari/components/snackbar/snackbar.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_adjustments/models/model_stock_adjustments.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_adjustments/services/stock_adjustments_service.dart';
import 'package:get/get.dart';

class StockAdjustmentsController extends GetxController {
  String id;
  int page = 1;
  int limit = 10;
  String result = '';

  StockAdjustmentsController({
    this.id,
  });

  void isLoadingTrue() async{
    ModelStockAdjustments.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelStockAdjustments.isLoading = false;
  }

  void clearData() {
    ModelStockAdjustments.barcode = '';
    ModelStockAdjustments.medicineId = '';
    ModelStockAdjustments.medicineName = '';
    ModelStockAdjustments.medicinePrice = 0;
    ModelStockAdjustments.discountAdjustments = 0;
    ModelStockAdjustments.qtyAdjustments = 0;
    ModelStockAdjustments.totalAdjustments = 0;
  }
  
  @override

  void onInit() {
    ModelStockAdjustments.result = 'ready';
  }

  void setItem(data) async {
    ModelStockAdjustments.medicineId = data['id'];
    ModelStockAdjustments.medicineName = data['name'];
    ModelStockAdjustments.medicinePrice = double.parse(data['tabletPriceSell']);
    update();
  }

  void setDiscount(val) async {
    if(val.length < 1) {
      ModelStockAdjustments.discountAdjustments = 0;
      update();
    } else {
      ModelStockAdjustments.discountAdjustments = double.parse((val.replaceAll('.','')).replaceAll(',','.'));
      update();
    }
    calcReturn();
  }

  void setQty(val) async {
    if(val.length < 1) {
      ModelStockAdjustments.qtyAdjustments = 0;
      update();
    } else {
      ModelStockAdjustments.qtyAdjustments = int.parse(val.replaceAll('.',''));
      update();
    }
    calcReturn();
  }

  void setNote(val) async {
    ModelStockAdjustments.noteId = val;
    update();
  }

  void calcReturn() async {
    ModelStockAdjustments.totalAdjustments = (ModelStockAdjustments.medicinePrice - (ModelStockAdjustments.medicinePrice * (ModelStockAdjustments.discountAdjustments / 100))) * ModelStockAdjustments.qtyAdjustments;
    update();
  }

  void createIncomingGoods() async {
    isLoadingTrue();
    update();
    try {
      var resp = await StockAdjustmentsService.createIncomingGoods();
      if (resp == 'success') {
        ModelStockAdjustments.result = ModelStockAdjustments.resp;
        clearData();
        readFirst('incoming_goods');
        isLoadingFalse();
        update();
        Snackbar.created();
      } else {
        ModelStockAdjustments.result = ModelStockAdjustments.resp;
        readFirst('incoming_goods');
        isLoadingFalse();
        update();
        Snackbar.failed();
      }
    } catch (e) {
      print(e.toString());
      Snackbar.failed();
      return null;
    }
  }

  void createExitGoods() async {
    isLoadingTrue();
    update();
    try {
      var resp = await StockAdjustmentsService.createExitGoods();
      if (resp == 'success') {
        ModelStockAdjustments.result = ModelStockAdjustments.resp;
        clearData();
        readFirst('exit_goods');
        isLoadingFalse();
        update();
        Snackbar.created();
      } else {
        ModelStockAdjustments.result = ModelStockAdjustments.resp;
        readFirst('exit_goods');
        isLoadingFalse();
        update();
        Snackbar.failed();
      }
    } catch (e) {
      print(e.toString());
      Snackbar.failed();
      return null;
    }
  }

  void readFirst(state) async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 10;
    ModelStockAdjustments.maxData = false;
    var resp = await StockAdjustmentsService.readData(page, limit, state);
    ModelStockAdjustments.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore(state) async{
    page = ModelStockAdjustments.currentPage + 1;
    var resp = await StockAdjustmentsService.readData(page, limit, state);
    if (resp.isEmpty) {
      ModelStockAdjustments.maxData = true;
    } else {
      ModelStockAdjustments.maxData = false;
      ModelStockAdjustments.getData += resp;
    }
    update();
  }

  void readDataBySearch(type, state) async{
    var resp = await StockAdjustmentsService.readDataBySearch(type, page, limit, state);
    ModelStockAdjustments.getData = resp;
    update();
  }
}