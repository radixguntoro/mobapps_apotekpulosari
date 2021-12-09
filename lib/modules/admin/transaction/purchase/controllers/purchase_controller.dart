import 'package:apotik_pulosari/components/snackbar/snackbar.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/models/model_purchase.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/services/purchase_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PurchaseController extends GetxController {
  String id;
  int page = 1;
  int limit = 10;

  String invoiceDate = '';
  String paymentDate = '';
  List<dynamic> filter = ['paid'];

  bool isPPN = false;
  bool filterPaid = false;
  bool filterCredit = true;
  bool filterCOD = true;
  bool filterConsignment = true;
  String result = '';
  String supplierId = '';
  String supplierName = '';
  String supplierPhone = '';
  int state = 0;

  Map response = {};

  PurchaseController({
    this.id,
  });

  void isLoadingTrue() async{
    ModelPurchase.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelPurchase.isLoading = false;
  }

  void isLoadingDataTrue() async{
    ModelPurchase.isLoadingData = true;
  }

  void isLoadingDataFalse() async{
    ModelPurchase.isLoadingData = false;
  }

  void clearData() {
    clearCart();
    clearForm();
    clearPayment();
    clearPPN();
  }

  void clearForm() {
    ModelPurchase.barcode = '';
    ModelPurchase.transactionsId = '';
    ModelPurchase.paymentStatus = 'cod';
    ModelPurchase.supplierId = '';
    ModelPurchase.supplierName = '';
    ModelPurchase.supplierPhone = '';
    ModelPurchase.supplierInvoiceNumber = '';
    ModelPurchase.supplierInvoiceDate = DateTime.now();
    ModelPurchase.supplierRepaymentDate = DateTime.now();
    ModelPurchase.isExistInvoice = false;
  }

  void clearPayment() { 
    ModelPurchase.discount = 0;  
    ModelPurchase.subtotal = 0;
    ModelPurchase.grandTotal = 0;
    ModelPurchase.payment = 0;
    ModelPurchase.balance = 0; 
  }

  void clearCart() {
    ModelPurchase.getCart = [];
    ModelPurchase.getCartOld = [];
  }

  void clearPPN() {
    ModelPurchase.ppnPrice = 0;
    ModelPurchase.ppn = 0;
    ModelPurchase.isPPN = false;
  }

  void clearReturn() {
    ModelPurchase.qtyReturn = 0;
    ModelPurchase.totalReturn = 0;
  }

  void clearAdjustments() {
    ModelPurchase.qtyAdjustments = 0;
    ModelPurchase.qtyAdjustmentsDifference = 0;
    ModelPurchase.totalAdjustments = 0;
  }
  
  @override

  void onInit() {
    ModelPurchase.result = 'ready';
  }

  void scanDataByBarcodeQRCode(barcode) async {
    await PurchaseService.readDataByBarcodeQRCode(barcode);
    ModelPurchase.barcode = '';
    ModelPurchase.getCart = ModelPurchase.getCart;
    calcTotal();
    update();
  }

  void decrementQtyCart(data) async {
    data['qty'] -= 1;
    if(data['qty'] < 1) {
      ModelPurchase.getCart.removeWhere((item) => item['medicines_items_id'] == data['medicines_items_id']);
    }
    calcTotal();
    update();
  }

  void incrementQtyCart(data) async {
    data['qty'] += 1;
    calcTotal();
    print('Total: ${ModelPurchase.total}');
    update();
  }

  void setNewQtyCart(data, val) async {
    if(val.length == 0) {
      data['qty'] = 0;
    } else {
      data['qty'] = int.parse(val.replaceAll('.',''));
    }
    clearPPN();
    calcTotal();
    update();
  }

  void setNewPriceSell(data, val) async {
    if(val.length < 1) {
      data['tablet_price_sell'] = data['tablet_price_sell'].toString();
    } else {
      data['tablet_price_sell'] = val.replaceAll('.','');
    }
    update();
  }

  void setNewPricePurchase(data, val) async {
    if(val.length < 1) {
      data['price'] = '0';
    } else {
      data['price'] = (val.replaceAll('.','')).replaceAll(',','.');
    }
    clearPPN();
    calcTotal();
    update();
  }

  void setDiscountPerItem(data, val) async {
    if(val.length < 1) {
      data['discount'] = '0.00';
    } else {
      data['discount'] = (val.replaceAll('.','')).replaceAll(',','.');
    }
    clearPPN();
    calcTotal();
    update();
  }

  void setInvoiceDate(date) async {
    if(date == null) {
      ModelPurchase.supplierInvoiceDate = DateTime.now();
    } else {
      ModelPurchase.supplierInvoiceDate = date;
    }
    update();
  }

  void setFilterInvoiceDate(date) async {
    if(date != null) {
      invoiceDate = DateFormat('yyyy-MM-dd').format(date).toString();
      readFirst();
      update();
    }
  }

  void setFilterPaymentDate(date) async {
    if(date != null) {
      paymentDate = DateFormat('yyyy-MM-dd').format(date).toString();
      readFirst();
      update();
    }
  }

  void setResetFilter() async {
    invoiceDate = '';
    paymentDate = '';
    supplierId = '';
    supplierName = '';
    supplierPhone = '';
    filterConsignment = true;
    filterCredit = true;
    filterCOD = true;
    filter = ['paid'];
    readFirst();
    update();
  }

  void setSupplier(val, state) async {
    if (state == 'recap') {
      supplierId = val['id'];
      supplierName = val['name'];
      supplierPhone = val['phone'];
    } else {
      ModelPurchase.supplierId = val['id'];
      ModelPurchase.supplierName = val['name'];
      ModelPurchase.supplierPhone = val['phone'];
    }
    print(val);
    update();
  }

  void setFilterApplyRecap() async {
    readFirst();
  }

  void setFilter(val, status) async{
    switch (status) {
      case 'paid':
        filterPaid = !val ? true : false;
        if (filterPaid == false) {
          filter.add(status.trim());
        } else {
          filter.remove(status.trim());
        }
        update();
        break;
      case 'credit':
        filterCredit = !val ? true : false;
        if (filterCredit == false) {
          filter.add(status.trim());
        } else {
          filter.remove(status.trim());
        }
        update();
        break;
      case 'cod':
        filterCOD = !val ? true : false;
        if (filterCOD == false) {
          filter.add(status.trim());
        } else {
          filter.remove(status.trim());
        }
        update();
        break;
      case 'consignment':
        filterConsignment = !val ? true : false;
        if (filterConsignment == false) {
          filter.add(status.trim());
        } else {
          filter.remove(status.trim());
        }
        update();
        break;
      default:
    }
    print(filter);
    readFirst();
  }

  void setPaidOnly(val) async{
    state = val;
    if(val == 0) {
      filterPaid = false;
      filterCredit = true;
      filterCOD = true;
      filterConsignment = true;
      filter = ['paid'];
    } else {
      filter = ['cod','credit','consignment'];
    }
    update();
    print(filter);
    readFirst();
  }

  void setPPN(val) async{
    ModelPurchase.isPPN = val;
    print(ModelPurchase.isPPN);
    if (val == false) {
      ModelPurchase.ppn = 0;
      ModelPurchase.ppnPrice = 0;
    } else {
      ModelPurchase.ppn = 0.1;
      ModelPurchase.ppnPrice = ModelPurchase.grandTotal * 0.1;
    }
    calcTotal();
    update();
  }

  void setPaymentStatus(val) async{
    ModelPurchase.paymentStatus = val;
    update();
  }

  void setData(val) async{
    ModelPurchase.transactionsId = val['transactions_id'].toString();
    ModelPurchase.supplierInvoiceDate = DateTime.parse(val['date']);
    update();
  }

  void setRepaymentDate(date) async {
    if(date == null) {
      ModelPurchase.supplierRepaymentDate = DateTime.now();
    } else {
      ModelPurchase.supplierRepaymentDate = date;
    }
    update();
  }

  void calcTotal() async {
    double total = 0;

    for(final data in ModelPurchase.getCart) {
      total += (double.parse(data['price']) - (double.parse(data['price']) * (double.parse(data['discount']) / 100))) * data['qty'];
      data['qty_diff'] = (data['qty'] - data['qty_old']);
      data['subtotal'] = ((double.parse(data['price']) - (double.parse(data['price']) * (double.parse(data['discount']) / 100))) * data['qty']).toStringAsFixed(2);
      data['tablet_price_sell'] = (double.parse(data['price']) + (double.parse(data['price']) * double.parse(data['profit']))) + ((double.parse(data['price']) + (double.parse(data['price']) * double.parse(data['profit']))) * ModelPurchase.ppn);
    }
    print(ModelPurchase.getCart.toString());
    ModelPurchase.total = double.parse((total).toStringAsFixed(2));
    ModelPurchase.subtotal = double.parse((total).toStringAsFixed(2)) - ModelPurchase.discount;
    ModelPurchase.grandTotal = ModelPurchase.subtotal + ModelPurchase.ppnPrice;
    update();
  }

  void calcDiscount(val) async {
    if(val.length < 1) {
      ModelPurchase.discount = 0;
    } else {
      ModelPurchase.discount = double.parse((val.replaceAll('.','')).replaceAll(',','.'));
    }
    calcTotal();
    update();
  }

  void calcPayment(val) async {
    if(val.length < 1) {
      ModelPurchase.payment = 0;
    } else {
      ModelPurchase.payment = double.parse(val.replaceAll('.',''));
    }
    calcTotal();
    update();
  }

  void calcReturn(item, val, data) async {
    if(val.length < 1 || int.parse(val.replaceAll('.','')) > int.parse(item['qty'].toString())) {
      ModelPurchase.qtyReturn = 0;
      ModelPurchase.totalReturn = 0;
      update();
    } else {
      ModelPurchase.qtyReturn = int.parse(val.replaceAll('.',''));
      ModelPurchase.totalReturn = (double.parse(item['price'].toString()) - ((double.parse(item['price'].toString()) * double.parse(item['discount'].toString())))) * ModelPurchase.qtyReturn;
      // data['transaction']['total'] = double.parse(data['transaction']['total'].toString()) - (double.parse(item['price'].toString()) * ModelPurchase.qtyReturn);
    }
    print(ModelPurchase.qtyReturn);
    print(ModelPurchase.totalReturn);
    print(item['discount'].toString());
    update();
  }

  void calcAdjustments(item, val, data) async {
    if(val.length < 1) {
      ModelPurchase.qtyAdjustments = 0;
      ModelPurchase.qtyAdjustmentsDifference = 0;
      ModelPurchase.totalAdjustments = 0;
      update();
    } else {
      ModelPurchase.qtyAdjustments = int.parse(val.replaceAll('.',''));
      ModelPurchase.qtyAdjustmentsDifference = int.parse(val.replaceAll('.','')) - (int.parse(item['qty'].toString()));
      ModelPurchase.totalAdjustments = (double.parse(item['price'].toString()) - ((double.parse(item['price'].toString()) * double.parse(item['discount'].toString())))) * ModelPurchase.qtyAdjustments;
      update();
    }
    print(int.parse(item['qty'].toString()));
    print(ModelPurchase.qtyAdjustments);
    print(ModelPurchase.qtyAdjustmentsDifference);
    print(ModelPurchase.totalAdjustments);
    update();
  }

  void createCart(data) async {
    print(data.toString());
    ModelPurchase.getCart.add({
      'medicines_items_id': data['id'],
      'id': data['tabletId'],
      'name': data['name'],
      'price': data['tabletPricePurchase'] != null ? data['tabletPricePurchase'] : data['tabletPricePurchaseInItem'],
      'qty': 1,
      'qty_old': 0,
      'qty_diff': 0,
      'profit': data['tabletProfitPercent'],
      'subtotal': data['tabletPricePurchase'],
      'discount': data['discount'] == null ? '0.00' : (double.parse(data['discount']) * 100).toString(),
      'unit': data['unitName'],
      'price_purchase_old': data['tabletPricePurchase'],
      'price_sell_old': data['tabletPriceSell'],
      'tablet_price_purchase': data['tabletPricePurchase'],
      'tablet_price_sell': data['tabletPriceSell'],
    });
    calcTotal();
    update();
  }

  void createData() async {
    isLoadingTrue();
    update();
    try {
      response = await PurchaseService.createData();
      id = response['id'];
      if (response['status'] == 1) {
        result = 'success';
        clearData();
        readFirst();
        isLoadingFalse();
        update();
      } else {
        result = 'failed';
        readFirst();
        isLoadingFalse();
        // Snackbar.fail(response);
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void createRepayment(data) async {
    isLoadingTrue();
    update();
    try {
      var resp = await PurchaseService.createRepayment(data);
      if (resp == 'success') {
        ModelPurchase.result = ModelPurchase.resp;
        clearData();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.updated();
      } else {
        ModelPurchase.result = ModelPurchase.resp;
        readFirst();
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

  void createReturn(data, item) async {
    isLoadingTrue();
    update();
    try {
      var resp = await PurchaseService.createReturn(data, item);
      if (resp == 'success') {
        ModelPurchase.result = ModelPurchase.resp;
        clearReturn();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.created();
      } else {
        ModelPurchase.result = ModelPurchase.resp;
        readFirst();
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

  void createAdjustments(data, item) async {
    isLoadingTrue();
    update();
    try {
      var resp = await PurchaseService.createAdjustments(data, item);
      if (resp == 'success') {
        ModelPurchase.result = ModelPurchase.resp;
        clearAdjustments();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.created();
      } else {
        ModelPurchase.result = ModelPurchase.resp;
        readFirst();
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

  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 10;
    print(invoiceDate);
    ModelPurchase.maxData = false;
    var resp = await PurchaseService.readData(page, limit, invoiceDate, paymentDate, filter, supplierId);
    ModelPurchase.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelPurchase.currentPage + 1;
    var resp = await PurchaseService.readData(page, limit, invoiceDate, paymentDate, filter, supplierId);
    if (resp.isEmpty) {
      ModelPurchase.maxData = true;
    } else {
      ModelPurchase.maxData = false;
      ModelPurchase.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await PurchaseService.readDataBySearch(type, page, limit, invoiceDate, paymentDate, filter);
    ModelPurchase.getData = resp;
    update();
  }

  void readDataById(id) async {
    var resp = await PurchaseService.readDataById(id);
    ModelPurchase.getInvoice = resp;
    print(ModelPurchase.getInvoice);
    update();
  }

  void readDetailMedicineId(id) async {
    isLoadingDataTrue();
    update();
    var resp = await PurchaseService.readDetailMedicineId(id);
    ModelPurchase.getDetailMedicine = resp;
    isLoadingDataFalse();
    update();
  }

  void readExistInvoice() async {
    isLoadingTrue();
    update();
    var resp = await PurchaseService.readExistInvoice(ModelPurchase.supplierInvoiceNumber);
    ModelPurchase.isExistInvoice = resp;
    isLoadingFalse();
    update();
  }

  void readData(data) async {
    // ignore: await_only_futures
    await clearData();
    ModelPurchase.id = data['id'];
    ModelPurchase.supplierId = data['supplier']['id'].toString();
    ModelPurchase.supplierName = data['supplier']['name'];
    ModelPurchase.supplierInvoiceNumber = data['invoice_number'];
    ModelPurchase.paymentStatus = data['status'];
    ModelPurchase.total = double.parse(data['total']);
    ModelPurchase.discount = double.parse(data['discount']);
    ModelPurchase.ppn = double.parse(data['ppn']);
    ModelPurchase.ppnPrice = (double.parse(data['total']) - double.parse(data['discount'])) * double.parse(data['ppn']);
    ModelPurchase.isPPN = double.parse(data['ppn']) > 0 ? true : false;
    ModelPurchase.subtotal = double.parse(data['total']) - double.parse(data['discount']);
    ModelPurchase.grandTotal = double.parse(data['grand_total']);

    for(final data in data['details']) {
      ModelPurchase.getCartOld.add({
        'medicines_items_id': data['medicine']['items_id'],
        'medicines_detail_id': data['medicine']['medicine_details']['id'],
        'id': data['id'],
        'name': data['medicine']['item']['name'],
        'price': data['price'],
        'qty': data['qty'],
        'profit': data['medicine']['medicine_details']['profit_percent'],
        'subtotal': (double.parse(data['subtotal']) - (double.parse(data['subtotal']) * double.parse(data['discount']))).toString(),
        'discount': data['discount'] == null ? '0.00' : (double.parse(data['discount']) * 100).toString(),
        'unit': data['unit  '],
        'price_purchase_old': data['price_purchase_old'],
        'price_sell_old': data['price_sell_old'],
        'tablet_price_purchase': data['price_purchase_old'],
        'tablet_price_sell': data['price_sell_old'],
      });

      ModelPurchase.getCart.add({
        'medicines_items_id': data['medicine']['items_id'],
        'medicines_detail_id': data['medicine']['medicine_details']['id'],
        'id': data['id'],
        'name': data['medicine']['item']['name'],
        'price': data['price'],
        'qty': data['qty'],
        'qty_old': data['qty'],
        'qty_diff': 0,
        'profit': data['medicine']['medicine_details']['profit_percent'],
        'subtotal': (double.parse(data['subtotal']) - (double.parse(data['subtotal']) * double.parse(data['discount']))).toString(),
        'discount': data['discount'] == null ? '0.00' : (double.parse(data['discount']) * 100).toString(),
        'unit': data['unit  '],
        'price_purchase_old': data['price_purchase_old'],
        'price_sell_old': data['price_sell_old'],
        'tablet_price_purchase': data['price_purchase_old'],
        'tablet_price_sell': data['price_sell_old'],
      });
    }
    update();
  }

  void updateInvoiceDate() async {
    isLoadingTrue();
    update();
    try {
      var id = await PurchaseService.updateInvoiceDate();
      if (id != '') {
        ModelPurchase.result = ModelPurchase.resp;
        clearData();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.updated();
      } else {
        ModelPurchase.result = ModelPurchase.resp;
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.failed();
      }
    } catch (e) {
      print(e.toString());
      isLoadingFalse();
      update();
      return null;
    }
  }

  void updateData() async {
    isLoadingTrue();
    update();
    try {
      await PurchaseService.updateData();
      if (ModelPurchase.resp == 'success') {
        ModelPurchase.result = ModelPurchase.resp;
        clearData();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.updated();
      } else {
        ModelPurchase.result = ModelPurchase.resp;
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

  void deleteCart(id) async {
    ModelPurchase.getCart.removeWhere((item) => item['medicines_items_id'] == id);
    calcTotal();
    update();
  }

  void deleteData(data) async {
    isLoadingTrue();
    update();
    try {
      await PurchaseService.deleteData(data);
      if (ModelPurchase.resp == 'success') {
        ModelPurchase.result = ModelPurchase.resp;
        clearData();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.deleted();
      } else {
        ModelPurchase.result = ModelPurchase.resp;
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.failed();
      }
    } catch (e) {
      print(e.toString());
      isLoadingFalse();
      update();
      return null;
    }
  }
}