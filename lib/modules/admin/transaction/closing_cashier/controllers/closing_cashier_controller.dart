
import 'package:apotik_pulosari/components/snackbar/snackbar.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/models/model_closing_cashier.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/services/closing_cashier_service.dart';
import 'package:get/get.dart';

class ClosingCashierController extends GetxController {
  String id;
  int page = 1;
  int limit = 10;
  String result = '';
  Map response = {};
  bool isLoading = false;

  ClosingCashierController({
    this.id,
  });

  void isLoadingTrue() async{
    ModelClosingCashier.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelClosingCashier.isLoading = false;
  }

  void clearData() {
    ModelClosingCashier.barcode = '';
    ModelClosingCashier.total = 0;  
    ModelClosingCashier.grandTotal = 0; 
    ModelClosingCashier.discount = 0;  
    ModelClosingCashier.payment = 0;  
    ModelClosingCashier.balance = 0;
    ModelClosingCashier.incomeApp = 0;
    ModelClosingCashier.getSales = [];
  }

  void clearInvoice() {
    ModelClosingCashier.barcode = '';
    ModelClosingCashier.total = 0;  
    ModelClosingCashier.grandTotal = 0; 
  }

  void clearPayment() { 
    ModelClosingCashier.discount = 0;  
    ModelClosingCashier.payment = 0;  
    ModelClosingCashier.balance = 0;   
    ModelClosingCashier.grandTotal = ModelClosingCashier.total;
  }

  void clearSales() {
    ModelClosingCashier.getSales = [];
  }
  
  @override

  void onInit() {
    ModelClosingCashier.result = 'ready';
  }

  void calcIncomeAppTotalByCashier() async {
    double total = 0;
    double totalReturn = 0;
    for(final data in ModelClosingCashier.getDetailByCashier) {
      if(data['codes_id'] != '401') {
        total += double.parse(data['total'].toString());
      } else {
        totalReturn = double.parse(data['total'].toString());
      }
      total = total - totalReturn;
    }

    ModelClosingCashier.incomeAppTotalByCashier = total;
    update();
  }

  void calcIncomeAppTotalBySales() async {
    double total = 0;
    double totalReturn = 0;
    for(final data in ModelClosingCashier.getDetailBySales) {
      if(data['codes_id'] != '401') {
        total += double.parse(data['total'].toString());
      } else {
        totalReturn = double.parse(data['total'].toString());
      }
      total = total - totalReturn;
    }

    ModelClosingCashier.incomeAppTotalBySales = total;
    update();
  }

  void calcIncomeApp() async {
    double total = 0;
    for(final data in ModelClosingCashier.getSales) {
      total += double.parse(data['grand_total']);
    }

    ModelClosingCashier.incomeApp = total;
    update();
  }

  void setIncomeReal(val) async {
    if(val.length < 1) {
      ModelClosingCashier.incomeReal = 0;
      update();
    } else {
      ModelClosingCashier.incomeReal = double.parse(val.replaceAll('.',''));
      update();
    }
    print(ModelClosingCashier.incomeReal);
  }

  void setDetailState(val) async {
    ModelClosingCashier.isDetailState = val;
    update();
  }

  void createData() async {
    isLoading = true;
    update();
    try {
      response = await ClosingCashierService.createData();
      id = response['id'];

      if (response['status'] == 1) {
        result = 'success';
        clearData();
        readFirst();
        isLoading = false;
        update();
      } else {
        result = 'failed';
        isLoading = false;
        Snackbar.fail(response);
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void readFirst() async{
    isLoading = true;
    update();
    page = 1;
    limit = 10;
    ModelClosingCashier.maxData = false;
    var resp = await ClosingCashierService.readData(page, limit);
    ModelClosingCashier.getData = resp;
    isLoading = false;
    update();
  }

  void readMore() async{
    page = ModelClosingCashier.currentPage + 1;
    var resp = await ClosingCashierService.readData(page, limit);
    if (resp.isEmpty) {
      ModelClosingCashier.maxData = true;
    } else {
      ModelClosingCashier.maxData = false;
      ModelClosingCashier.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await ClosingCashierService.readDataBySearch(type, page, limit);
    ModelClosingCashier.getData = resp;
    update();
  }

  void readDataDetail(id) async {
    isLoading = true;
    update();
    ModelClosingCashier.isDetailState = 0;
    var respCashier = await ClosingCashierService.readDataByCashier(id);
    ModelClosingCashier.getDetailByCashier = respCashier;
    var respSales = await ClosingCashierService.readDataBySales(id);
    ModelClosingCashier.getDetailBySales = respSales;
    calcIncomeAppTotalByCashier();
    calcIncomeAppTotalBySales();
    isLoading = false;
    update();
  }

  void readDataSales() async{
    isLoading = true;
    update();
    page = 1;
    limit = 2000;
    ModelClosingCashier.maxData = false;
    var resp = await ClosingCashierService.readDataSales(page, limit);
    ModelClosingCashier.getSales = resp;
    calcIncomeApp();
    print(ModelClosingCashier.getSales.length);
    if (ModelClosingCashier.getSales.length > 0) {
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }
  }
  
  void readShift() async{
    isLoadingTrue();
    update();
    var resp = await ClosingCashierService.readShift();
    ModelClosingCashier.shift = resp;
    print(ModelClosingCashier.shift);
    isLoadingFalse();
    update();
  }

  void updateData(data) async {
    print(data.toString());
    isLoading = true;
    update();
    try {
      response = await ClosingCashierService.updateData(data);
      id = response['id'];

      if (response['status'] == 1) {
        result = 'success';
        clearData();
        readFirst();
        isLoading = false;
        update();
      } else {
        result = 'failed';
        isLoading = false;
        Snackbar.fail(response);
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}