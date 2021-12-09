
import 'package:apotik_pulosari/components/snackbar/snackbar.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/models/model_stock_opname.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/services/stock_opname_service.dart';
import 'package:get/get.dart';

class StockOpnameController extends GetxController {
  String id;
  String result = '';

  int page = 1;
  int limit = 10;
  List<dynamic> filter = [];

  bool filterOtc = true;
  bool filterVens = true;
  bool filterPsiko = true;
  bool filterStik = true;
  bool filterPrek = true;

  StockOpnameController({
    this.id,
  });

  void isLoadingTrue() async{
    ModelStockOpname.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelStockOpname.isLoading = false;
  }

  void clearData() async {
    ModelStockOpname.medicineName = '';
    ModelStockOpname.medicineId = '';
    ModelStockOpname.medicineUnit = '';
    ModelStockOpname.pricePurchaseApp = 0;
    ModelStockOpname.pricePurchasePhx = 0;
    ModelStockOpname.pricePurchaseDifference = 0;
    ModelStockOpname.pricePurchaseAppSubtotal = 0;
    ModelStockOpname.pricePurchasePhxSubtotal = 0;
    ModelStockOpname.priceSellApp = 0;
    ModelStockOpname.priceSellPhx = 0;
    ModelStockOpname.priceSellDifference = 0;
    ModelStockOpname.priceSellAppSubtotal = 0;
    ModelStockOpname.priceSellPhxSubtotal = 0;
    ModelStockOpname.stockInSystem = 0;
    ModelStockOpname.stockInPhysic = 0;
    ModelStockOpname.stockInDifference = 0;
  }
  
  @override

  void onInit() {
    ModelStockOpname.result = 'ready';
  }

  void scanDataByBarcodeQRCode(barcode) async {
    clearData();
    result = await StockOpnameService.readDataByBarcodeQRCode(barcode);
    ModelStockOpname.barcode = '';
    ModelStockOpname.getItem = ModelStockOpname.getItem;
    if(result == 'notfound') {
      Snackbar.notfound();
    }
    update();
  }

  void calcTotal() async {
    ModelStockOpname.pricePurchasePhxSubtotal = ModelStockOpname.pricePurchaseApp * ModelStockOpname.stockInPhysic;
    ModelStockOpname.priceSellPhxSubtotal = ModelStockOpname.priceSellApp * ModelStockOpname.stockInPhysic;
    ModelStockOpname.stockInDifference = ModelStockOpname.stockInPhysic - ModelStockOpname.stockInSystem;
    ModelStockOpname.pricePurchaseDifference = ModelStockOpname.pricePurchasePhxSubtotal - ModelStockOpname.pricePurchaseAppSubtotal;
    ModelStockOpname.priceSellDifference = ModelStockOpname.priceSellPhxSubtotal - ModelStockOpname.priceSellAppSubtotal;
    update();
  }

  void setNewQtyPhx(val) async {
    if(val.length == 0) {
      ModelStockOpname.stockInPhysic = 0;
    } else {
      ModelStockOpname.stockInPhysic = int.parse(val.replaceAll('.',''));
    }
    calcTotal();
    update();
  }

  void setItem(data) async {
    clearData();
    ModelStockOpname.medicineName = data['name'];
    ModelStockOpname.medicineId = data['id'];
    ModelStockOpname.medicineCategory = data['categoryName'];
    ModelStockOpname.medicineUnit = data['unitName'];
    ModelStockOpname.pricePurchaseApp = double.parse(data['tabletPricePurchase'].toString());
    ModelStockOpname.pricePurchasePhx = double.parse(data['tabletPricePurchase'].toString());
    ModelStockOpname.pricePurchaseAppSubtotal = double.parse(data['tabletPricePurchase'].toString()) * int.parse(data['qtyTotal'].toString());
    ModelStockOpname.priceSellApp = double.parse(data['tabletPriceSell'].toString());
    ModelStockOpname.priceSellPhx = double.parse(data['tabletPriceSell'].toString());
    ModelStockOpname.priceSellAppSubtotal = double.parse(data['tabletPriceSell'].toString()) * int.parse(data['qtyTotal'].toString());
    ModelStockOpname.stockInSystem = int.parse(data['qtyTotal'].toString());
  }

  void createData() async {
    isLoadingTrue();
    update();
    try {
      var resp = await StockOpnameService.createData();
      if (resp == 'success') {
        ModelStockOpname.result = ModelStockOpname.resp;
        clearData();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.created();
      } else {
        ModelStockOpname.result = ModelStockOpname.resp;
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.failed();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 10;
    ModelStockOpname.maxData = false;
    var resp = await StockOpnameService.readData(page, limit, filter);
    ModelStockOpname.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelStockOpname.currentPage + 1;
    var resp = await StockOpnameService.readData(page, limit, filter);
    if (resp.isEmpty) {
      ModelStockOpname.maxData = true;
    } else {
      ModelStockOpname.maxData = false;
      ModelStockOpname.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await StockOpnameService.readDataBySearch(type, page, limit, filter);
    ModelStockOpname.getData = resp;
    update();
  }
}