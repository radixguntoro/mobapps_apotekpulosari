import 'dart:io';

import 'package:apotik_pulosari/components/snackbar/snackbar.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/models/model_sales_netto.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/services/sales_netto_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

class SalesNettoController extends GetxController {
  String id;
  int page = 1;
  int limit = 10;
  String result = '';
  Map response = {};
  String dateStart = '';
  String dateEnd = '';

  String invoiceDate = '';
  String paymentDate = '';
  String customerPersonsId = '';
  String customerPersonsName = '';
  List<dynamic> filter = ['paid'];

  int state = 0;
  bool isPPN = false;
  bool filterPaid = false;
  bool filterCredit = true;
  bool filterCOD = true;
  bool filterConsignment = true;

  SalesNettoController({
    this.id,
  });

  void isLoadingTrue() async{
    ModelSalesNetto.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelSalesNetto.isLoading = false;
  }

  void clearData() {
    ModelSalesNetto.barcode = '';
    ModelSalesNetto.customerPersonsId = 'empty';
    ModelSalesNetto.customerPersonsName = 'Pilih Pelanggan';
    ModelSalesNetto.total = 0;  
    ModelSalesNetto.grandTotal = 0; 
    ModelSalesNetto.discount = 0;  
    ModelSalesNetto.payment = 0;  
    ModelSalesNetto.balance = 0;
    ModelSalesNetto.feeDisplay = 0;
  }

  void clearPayment() { 
    ModelSalesNetto.discount = 0;  
    ModelSalesNetto.payment = 0;  
    ModelSalesNetto.balance = 0;   
    ModelSalesNetto.ppn = 0;
    ModelSalesNetto.isPPN = false;
    ModelSalesNetto.ppnPrice = 0;
    ModelSalesNetto.subtotal = ModelSalesNetto.total;   
    ModelSalesNetto.grandTotal = ModelSalesNetto.subtotal;
  }

  void clearCart() {
    ModelSalesNetto.getCart = [];
  }

  void clearReturn() {
    ModelSalesNetto.qtyReturn = 0;
    ModelSalesNetto.totalReturn = 0;
  }

  void clearAdjustments() {
    ModelSalesNetto.qtyAdjustments = 0;
    ModelSalesNetto.qtyAdjustmentsDifference = 0;
    ModelSalesNetto.totalAdjustments = 0;
  }
  
  @override

  void onInit() {
    ModelSalesNetto.result = 'ready';
  }

  void scanDataByBarcodeQRCode(barcode) async {
    result = await SalesNettoService.readDataByBarcodeQRCode(barcode);
    ModelSalesNetto.barcode = '';
    ModelSalesNetto.getCart = ModelSalesNetto.getCart;
    if(result == 'notfound') {
      Get.snackbar(
        "Oops!",
        "Barang tidak ditemukan",
        titleText: Container(
          child: Text(
            "Oops!",
            style: TextStyle(
              color: Colors.red[800],
              fontWeight: FontWeight.w600,
              fontSize: 12
            )
          ),
        ),
        messageText: Text(
          "Barang tidak ditemukan",
          style: TextStyle(
            color: Colors.red[900],
            fontSize: 12,
          )
        ),
        backgroundColor: Colors.red[50].withOpacity(0.95),
        shouldIconPulse: true,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(16),
        icon: Icon(
          Mdi.closeCircle,
          size: 24,
          color: Colors.red,
        ), 
        barBlur: 0,
        duration: Duration(seconds: 3),
        borderRadius: 5,
      );
    }
    calcTotal();
    update();
  }

  void calcReturn(item, val, data) async {
    if(val.length < 1 || int.parse(val.replaceAll('.','')) > int.parse(item['qty'].toString()
    )) {
      ModelSalesNetto.qtyReturn = 0;
      ModelSalesNetto.totalReturn = 0;
      update();
    } else {
      ModelSalesNetto.qtyReturn = int.parse(val.replaceAll('.',''));
      ModelSalesNetto.totalReturn = (double.parse(item['price'].toString()) - ((double.parse(item['price'].toString()) * double.parse(item['discount'].toString())))) * ModelSalesNetto.qtyReturn;
    }
    print(ModelSalesNetto.qtyReturn);
    print(ModelSalesNetto.totalReturn);
    print(item['discount'].toString());
    update();
  }

  void calcAdjustments(item, val, data) async {
    if(val.length < 1) {
      ModelSalesNetto.qtyAdjustments = 0;
      ModelSalesNetto.qtyAdjustmentsDifference = 0;
      ModelSalesNetto.totalAdjustments = 0;
      update();
    } else {
      ModelSalesNetto.qtyAdjustments = int.parse(val.replaceAll('.',''));
      ModelSalesNetto.qtyAdjustmentsDifference = int.parse(val.replaceAll('.','')) - (int.parse(item['qty'].toString()));
      ModelSalesNetto.totalAdjustments = (double.parse(item['price'].toString()) - ((double.parse(item['price'].toString()) * double.parse(item['discount'].toString())))) * ModelSalesNetto.qtyAdjustments;
      update();
    }
    print(ModelSalesNetto.qtyAdjustments);
    print(ModelSalesNetto.qtyAdjustmentsDifference);
    print(ModelSalesNetto.totalAdjustments);
    update();
  }
  
  void createCart(data) async {
    print(data.toString());
    ModelSalesNetto.getCart.add({
      'medicines_items_id': data['id'],
      'name': data['name'],
      'price': data['tabletPricePurchase'],
      'price_sell': data['tabletPricePurchase'],
      'qty_total': data['qtyTotal'].toString(),
      'qty': 1,
      'subtotal': data['tabletPricePurchase'],
      'discount': data['discount'] == null ? '0.00' : (double.parse(data['discount']) * 100).toString(),
      'ppn': data['ppn'] == null ? '0.00' : data['ppn'],
      'ppnPrice': data['ppn'] == null ? '0.00' : (double.parse(data['ppn']) > 0 ? (double.parse(data['tabletPricePurchase']) * double.parse(data['ppn'])) : '0.00'),
      'isPPN': data['ppn'] == null ? false : (double.parse(data['ppn']) > 0 ? true : false),
      'unit': data['unitName'],
      'category': data['categoryName'],
    });
    calcTotal();
    update();
  }

  void deleteCart(id) async {
    ModelSalesNetto.getCart.removeWhere((item) => item['medicines_items_id'] == id);
    calcTotal();
    update();
  }

  void decrementQtyCart(data) async {
    data['qty'] -= 1;
    if(data['qty'] < 1) {
      ModelSalesNetto.getCart.removeWhere((item) => item['medicines_items_id'] == data['medicines_items_id']);
    }
    calcTotal();
    update();
  }

  void incrementQtyCart(data) async {
    data['qty'] += 1;
    calcTotal();
    print('Total: ${ModelSalesNetto.total}');
    update();
  }

  void setQtyCart(data, val) async {
    print(val.length);
    if(val.length == 0) {
      data['qty'] = 0;
    } else {
      data['qty'] = int.parse(val.replaceAll('.',''));
    }
    calcTotal();
    print('Total: ${ModelSalesNetto.total}');
    update();
  }

  void setNewPrice(data, val) async {
    if(val.length < 1) {
      data['price'] = '0';
    } else {
      data['price'] = val.replaceAll('.','');
    }
    calcTotal();
    update();
  }

  void setDiscountPerItem(data, val) async {
    if(val.length < 1) {
      data['discount'] = '0.00';
    } else {
      data['discount'] = (val.replaceAll('.','')).replaceAll(',','.');
    }
    calcTotal();
    update();
  }

  void setFeeDisplay(val) async {
    if(val.length < 1) {
      ModelSalesNetto.feeDisplay = 0.00;
    } else {
      ModelSalesNetto.feeDisplay = double.parse((val.replaceAll('.','')).replaceAll(',','.'));
    }
    calcTotal();
    update();
  }

  void setCustomer(val, state) async{
    if (state == 'recap') {
      customerPersonsId = val['id'];
      customerPersonsName = val['name'];
    } else {
      ModelSalesNetto.customerPersonsId = val['id'];
      ModelSalesNetto.customerPersonsName = val['name'];
    }
    print(val);
    update();
  }
  void setClearCustomer() async{
    ModelSalesNetto.customerPersonsId = 'empty';
    ModelSalesNetto.customerPersonsName = 'Pilih Pelanggan';
    update();
  }

  void setPaymentStatus(val) async{
    ModelSalesNetto.paymentStatus = val;
    update();
  }

  void setPPN(val) async{
    ModelSalesNetto.isPPN = val;
    print(ModelSalesNetto.isPPN);
    if (val == false) {
      ModelSalesNetto.ppn = 0;
      ModelSalesNetto.ppnPrice = 0;
    } else {
      ModelSalesNetto.ppn = 0.1;
      ModelSalesNetto.ppnPrice = ModelSalesNetto.grandTotal * 0.1;
    }
    calcTotal();
    update();
  }

  void setPPNItem(val, item) async{
    item['isPPN'] = val;
    if (val == false) {
      item['ppn'] = 0;
      item['ppnPrice'] = 0;
    } else {
      item['ppn'] = 0.1;
      item['ppnPrice'] = item['price_sell'] * 0.1;
    }
    calcTotal();
    update();
  }

  void setFilterInvoiceDate(date) async {
    if(date != null) {
      invoiceDate = DateFormat('yyyy-MM-dd').format(date).toString();
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

  void setFilterApplyRecap() async {
    readFirst();
  }

  void setResetFilter() async {
    invoiceDate = '';
    paymentDate = '';
    customerPersonsId = '';
    customerPersonsName = '';
    filterConsignment = true;
    filterCredit = true;
    filterCOD = true;
    filter = ['paid'];
    readFirst();
    update();
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

  void setDate(date, dateType) {
    if (dateType == 'dateRange') {
      ModelSalesNetto.dateStart = date[0];
      ModelSalesNetto.dateEnd = date[1];
      dateStart = date[0].toString();
      dateEnd = date[1].toString();
    } else {
      ModelSalesNetto.dateStart = (date == null ? DateTime.now() : date);
      ModelSalesNetto.dateEnd = (date == null ? DateTime.now() : date);
    }
    print(ModelSalesNetto.dateStart.toString());
    print(ModelSalesNetto.dateEnd.toString());
    update();
  }

  void setRepaymentDate(date) async {
    if(date == null) {
      ModelSalesNetto.customerRepaymentDate = DateTime.now();
    } else {
      ModelSalesNetto.customerRepaymentDate = date;
    }
    update();
  }

  void calcTotal() async {
    double total = 0;
    for(final data in ModelSalesNetto.getCart) {
      total += (((double.parse(data['price']) - (double.parse(data['price']) * (double.parse(data['discount']) / 100))) + double.parse(data['ppnPrice'].toString())) * data['qty']);
      data['subtotal'] = (((double.parse(data['price']) - (double.parse(data['price']) * (double.parse(data['discount'].toString()) / 100))) + double.parse(data['ppnPrice'].toString())) * data['qty']).toStringAsFixed(2);
      data['price_sell'] = (double.parse(data['price']) - (double.parse(data['price']) * (double.parse(data['discount'].toString()) / 100)));
    }

    ModelSalesNetto.total = total;
    ModelSalesNetto.subtotal = (total - ModelSalesNetto.discount);
    ModelSalesNetto.grandTotal = (total - ModelSalesNetto.discount);
    ModelSalesNetto.balance = ModelSalesNetto.payment > (total - ModelSalesNetto.discount) ? (ModelSalesNetto.payment - ((total - ModelSalesNetto.discount) + ModelSalesNetto.ppnPrice)) : 0;
    update();
  }

  void calcDiscount(val) async {
    if(val.length < 1 || double.parse((val.replaceAll('.','')).replaceAll(',','.')) > ModelSalesNetto.total) {
      ModelSalesNetto.discount = 0;
    } else {
      ModelSalesNetto.discount = double.parse((val.replaceAll('.','')).replaceAll(',','.'));
    }
    calcTotal();
    update();
  }

  void calcPayment(val) async {
    if(val.length < 1) {
      ModelSalesNetto.payment = 0;
    } else {
      ModelSalesNetto.payment = double.parse(val.replaceAll('.',''));
    }
    calcTotal();
    update();
  }

  void createData() async {
    ModelSalesNetto.getInvoice = {};
    isLoadingTrue();
    update();
    try {
      response = await SalesNettoService.createData();
      id = response['id'];

      if (response['status'] == 1) {
        result = 'success';
        var data = await SalesNettoService.readDataById(id);
        ModelSalesNetto.getInvoice = data;
        clearCart();
        clearPayment();
        readFirst();
        isLoadingFalse();
        update();
      } else {
        result = 'failed';
        isLoadingFalse();
        Snackbar.fail(response);
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void createReturn(data, item) async {
    // print(data.toString());
    // print(item.toString());
    isLoadingTrue();
    update();
    try {
      var resp = await SalesNettoService.createReturn(data, item);
      if (resp == 'success') {
        ModelSalesNetto.result = ModelSalesNetto.resp;
        clearReturn();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.created();
      } else {
        ModelSalesNetto.result = ModelSalesNetto.resp;
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
      var resp = await SalesNettoService.createAdjustments(data, item);
      if (resp == 'success') {
        ModelSalesNetto.result = ModelSalesNetto.resp;
        clearAdjustments();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.created();
      } else {
        ModelSalesNetto.result = ModelSalesNetto.resp;
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

  void createRepayment(data) async {
    print(data.toString());
    isLoadingTrue();
    update();
    try {
      var resp = await SalesNettoService.createRepayment(data);
      if (resp == 'success') {
        ModelSalesNetto.result = ModelSalesNetto.resp;
        clearData();
        readFirst();
        isLoadingFalse();
        update();
        Snackbar.updated();
      } else {
        ModelSalesNetto.result = ModelSalesNetto.resp;
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
    ModelSalesNetto.maxData = false;
    var resp = await SalesNettoService.readData(page, limit, invoiceDate, paymentDate, filter, customerPersonsId);
    ModelSalesNetto.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelSalesNetto.currentPage + 1;
    var resp = await SalesNettoService.readData(page, limit, invoiceDate, paymentDate, filter, customerPersonsId);
    if (resp.isEmpty) {
      ModelSalesNetto.maxData = true;
    } else {
      ModelSalesNetto.maxData = false;
      ModelSalesNetto.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await SalesNettoService.readDataBySearch(type, page, limit, invoiceDate, paymentDate, filter);
    ModelSalesNetto.getData = resp;
    update();
  }

  void readDataById(id) async {
    var resp = await SalesNettoService.readDataById(id);
    ModelSalesNetto.getInvoice = resp;
    print(ModelSalesNetto.getInvoice);
    update();
  }

  void exportToPDF() async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Set the page size
    document.pageSettings.size = const Size(291, 291 * 1.75);
    document.pageSettings.margins.all= 12;
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    print(pageSize.width);
    //Draw rectangle
    page.graphics.drawRectangle(bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
    //Generate PDF grid.
    final PdfGrid gridHeader = getGridHeader();
    final PdfGrid gridBody = getGridBody();
    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(page, pageSize);
    //Draw grid
    drawGrid(page, gridHeader, gridBody, result, pageSize, document);
    //Save and launch the document
    final List<int> bytes = document.save();
    //Dispose the document.
    document.dispose();
    //Get the storage folder location using path_provider package.
    final Directory directory = await path_provider.getApplicationDocumentsDirectory();
    final String path = directory.path;
    final File file = File('$path/NOTA-${DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.now())}.pdf');
    await file.writeAsBytes(bytes);
    //Launch the file (used open_file package)
    await open_file.OpenFile.open('$path/NOTA-${DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.now())}.pdf');
  }

  PdfLayoutResult drawHeader(PdfPage page, Size pageSize) {
    PdfTextElement(
      text: 'APOTEK PULOSARI', 
      font: PdfStandardFont(
        PdfFontFamily.helvetica, 
        16,
        style: PdfFontStyle.bold
      ),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center
      ),
    ).draw(
      page: page,
      bounds: Rect.fromLTWH(0, 16, pageSize.width, pageSize.height),
    );

    PdfTextElement(
      text: 'Jl. Pulosari III/48, Kel. Gunung Sari, Kec. Dukuh Pakis, Surabaya.', 
      font: PdfStandardFont(
        PdfFontFamily.helvetica, 
        12,
      ),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center
      ),
    ).draw(
      page: page,
      bounds: Rect.fromLTWH(0, 40, pageSize.width, pageSize.height),
    );

    return PdfTextElement(
      text: 'Telp/WA: 081330104464', 
      font: PdfStandardFont(
        PdfFontFamily.helvetica, 
        12,
      ),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center
      ),
    ).draw(
      page: page,
      bounds: Rect.fromLTWH(0, 72, pageSize.width, pageSize.height),
    );
  }

  //Draws the grid
  void drawGrid(PdfPage page, PdfGrid gridHeader, PdfGrid gridBody, PdfLayoutResult result, Size pageSize, document) {
    //Draw the grid Header
    gridHeader.draw(page: page, bounds: const Rect.fromLTWH(0, 96, 0, 0));
    //Draw rectangle
    page.graphics.drawRectangle(
      brush: PdfSolidBrush(PdfColor(0, 0, 0, 1)),
      bounds: Rect.fromLTWH(0, 130, pageSize.width, 4)
    );
    //Draw rectangle
    page.graphics.drawRectangle(
      brush: PdfSolidBrush(PdfColor(0, 0, 0, 1)),
      bounds: Rect.fromLTWH(0, 136, pageSize.width, 1)
    );
    //Draw the grid Body
    gridBody.draw(page: page, bounds: const Rect.fromLTWH(0, 144, 0, 0));
  }

  //Draw the invoice footer data.
  void drawFooter(PdfPage page, Size pageSize, document) {
    final PdfPen linePen = PdfPen(PdfColor(0, 0, 0, 1));
    //Draw line
    page.graphics.drawRectangle(
      brush: PdfSolidBrush(PdfColor(0, 0, 0, 1)),
      bounds: Rect.fromLTWH(0, pageSize.height - 46, pageSize.width, 4)
    );
    page.graphics.drawLine(linePen, Offset(0, pageSize.height - 40),
        Offset(pageSize.width, pageSize.height - 40));

    page.graphics.drawString(
      "SEMOGA LEKAS SEMBUH", PdfStandardFont(PdfFontFamily.helvetica, 11),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
      bounds: Rect.fromLTWH(0, pageSize.height - 32, pageSize.width, 0)
    );
    page.graphics.drawString(
      "TERIMA KASIH", PdfStandardFont(PdfFontFamily.helvetica, 11),
      format: PdfStringFormat(alignment: PdfTextAlignment.center),
      bounds: Rect.fromLTWH(0, pageSize.height - 16, pageSize.width, 0)
    );
  }

  //Create PDF grid and return
  PdfGrid getGridHeader() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 3);
    //Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    //Set style
    headerRow.cells[0].value = 'No. Transaksi';
    headerRow.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    headerRow.cells[1].value = 'Admin';
    headerRow.cells[1].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    headerRow.cells[2].value = '${ModelSalesNetto.getInvoice['date']}';
    headerRow.cells[2].stringFormat.alignment = PdfTextAlignment.right;
    headerRow.cells[2].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    final PdfGridRow headerRow1 = grid.headers.add(1)[1];
    //Set style
    headerRow1.cells[0].value = '${ModelSalesNetto.getInvoice['id']}';
    headerRow1.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    headerRow1.cells[1].value = '${TextTransform.title(ModelSalesNetto.getInvoice['cashierName'])}';
    headerRow1.cells[1].stringFormat.alignment = PdfTextAlignment.center;
    headerRow1.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    headerRow1.cells[2].value = '${ModelSalesNetto.getInvoice['time']}';
    headerRow1.cells[2].stringFormat.alignment = PdfTextAlignment.right;
    headerRow1.cells[2].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );

    //Set the grid style
    grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 2, right: 0, top: 0, bottom: 0),
      borderOverlapStyle: PdfBorderOverlapStyle.inside,
      font: PdfStandardFont(
        PdfFontFamily.helvetica, 
        10,
      ),
    );

    return grid;
  }

  //Create PDF grid and return
  PdfGrid getGridBody() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 5);
    //Add rows
    for (var item in ModelSalesNetto.getInvoice['details']) {
      addProducts(
        '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(item['qty'].toString()))}', 
        item['medicineName'], 
        '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['price'].toString()))}', 
        '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['discount'].toString()) * 100)}', 
        '${double.parse(item['ppn'].toString()) > 0 ? "10%" : "0%"}', 
        '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['subtotal'].toString()))}', 
        grid);
    }
    grid.columns[0].width = 32;
    grid.columns[1].width = 80;
    grid.columns[2].width = 40;
    grid.columns[3].width = 40;

    //Set gird columns width
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        switch (j) {
          case 0:
            cell.stringFormat.alignment = PdfTextAlignment.right;
            cell.style.borders = PdfBorders(
              left: PdfPens.white,
              top: PdfPens.white,
              bottom: PdfPens.white,
              right: PdfPens.white
            );
            break;
          case 1:
            cell.stringFormat.alignment = PdfTextAlignment.left;
            cell.style.borders = PdfBorders(
              left: PdfPens.white,
              top: PdfPens.white,
              bottom: PdfPens.white,
              right: PdfPens.white
            );
            break;
          case 2:
            cell.stringFormat.alignment = PdfTextAlignment.right;
            cell.style.cellPadding = PdfPaddings(left: 4, right: 4, top: 0, bottom: 2);
            cell.style.borders = PdfBorders(
              left: PdfPens.white,
              top: PdfPens.white,
              bottom: PdfPens.white,
              right: PdfPens.white
            );
            break;
          case 3:
            cell.stringFormat.alignment = PdfTextAlignment.right;
            cell.style.cellPadding = PdfPaddings(left: 4, right: 4, top: 0, bottom: 2);
            cell.style.borders = PdfBorders(
              left: PdfPens.white,
              top: PdfPens.white,
              bottom: PdfPens.white,
              right: PdfPens.white
            );
            break;
          case 4:
            cell.stringFormat.alignment = PdfTextAlignment.right;
            cell.style.cellPadding = PdfPaddings(left: 4, right: 0, top: 0, bottom: 2);
            cell.style.borders = PdfBorders(
              left: PdfPens.white,
              top: PdfPens.white,
              bottom: PdfPens.white,
              right: PdfPens.white
            );
            break;
          default:
        }
      }
    }
    //Set the grid style
    grid.style = PdfGridStyle(
      font: PdfStandardFont(
        PdfFontFamily.helvetica, 
        11,
      ),
    );

    final PdfGridRow footer1 = grid.rows.add();
    footer1.cells[0].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelSalesNetto.getInvoice['qtyTotal'].toString()))}';
    footer1.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footer1.cells[0].stringFormat.alignment = PdfTextAlignment.right;
    footer1.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 6, bottom: 0);
    footer1.cells[1].value = 'TOTAL HARGA:';
    footer1.cells[1].stringFormat.alignment = PdfTextAlignment.right;
    footer1.cells[1].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 6, bottom: 0);
    footer1.cells[1].columnSpan = 2;
    footer1.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footer1.cells[3].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(ModelSalesNetto.getInvoice['total'].toString()))}';
    footer1.cells[3].columnSpan = 2;
    footer1.cells[3].stringFormat.alignment = PdfTextAlignment.right;
    footer1.cells[3].style.cellPadding = PdfPaddings(left: 0, right: 0, top: 6, bottom: 0);
    footer1.cells[3].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );

    final PdfGridRow footer2 = grid.rows.add();
    footer2.cells[0].value = '';
    footer2.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.black,
      right: PdfPens.white
    );
    footer2.cells[0].stringFormat.alignment = PdfTextAlignment.right;
    footer2.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 2, bottom: 4);
    footer2.cells[1].value = 'DISKON:';
    footer2.cells[1].stringFormat.alignment = PdfTextAlignment.right;
    footer2.cells[1].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 2, bottom: 4);
    footer2.cells[1].columnSpan = 2;
    footer2.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.black,
      right: PdfPens.white
    );
    footer2.cells[3].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(ModelSalesNetto.getInvoice['discount'].toString()))}';
    footer2.cells[3].columnSpan = 2;
    footer2.cells[3].stringFormat.alignment = PdfTextAlignment.right;
    footer2.cells[3].style.cellPadding = PdfPaddings(left: 0, right: 0, top: 2, bottom: 4);
    footer2.cells[3].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.black,
      right: PdfPens.white
    );

    final PdfGridRow footer3 = grid.rows.add();
    footer3.cells[0].value = '';
    footer3.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footer3.cells[0].stringFormat.alignment = PdfTextAlignment.right;
    footer3.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 6, bottom: 4);
    footer3.cells[1].value = 'GRAND TOTAL:';
    footer3.cells[1].columnSpan = 2;
    footer3.cells[1].stringFormat.alignment = PdfTextAlignment.right;
    footer3.cells[1].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 6, bottom: 4);
    footer3.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footer3.cells[3].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(ModelSalesNetto.getInvoice['grandTotal'].toString()))}';
    footer3.cells[3].columnSpan = 2;
    footer3.cells[3].stringFormat.alignment = PdfTextAlignment.right;
    footer3.cells[3].style.cellPadding = PdfPaddings(left: 0, right: 0, top: 6, bottom: 4);
    footer3.cells[3].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );

    final PdfGridRow footerLine1 = grid.rows.add();
    footerLine1.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footerLine1.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    footerLine1.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 0, bottom: 0);
    footerLine1.cells[0].columnSpan = 5;

    final PdfGridRow footerLine2 = grid.rows.add();
    footerLine2.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footerLine2.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    footerLine2.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 0, bottom: 0);
    footerLine2.cells[0].columnSpan = 5;

    final PdfGridRow footerLine3 = grid.rows.add();
    footerLine3.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footerLine3.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    footerLine3.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 0, bottom: 0);
    footerLine3.cells[0].columnSpan = 5;

    final PdfGridRow footerLine4 = grid.rows.add();
    footerLine4.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footerLine4.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    footerLine4.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 0, bottom: 3);
    footerLine4.cells[0].columnSpan = 5;

    final PdfGridRow footerPage1 = grid.rows.add();
    footerPage1.cells[0].value = 'SEMOGA LEKAS SEMBUH';
    footerPage1.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footerPage1.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    footerPage1.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 6, bottom: 0);
    footerPage1.cells[0].columnSpan = 5;

    final PdfGridRow footerPage2 = grid.rows.add();
    footerPage2.cells[0].value = 'TERIMA KASIH';
    footerPage2.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footerPage2.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    footerPage2.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 2, bottom: 6);
    footerPage2.cells[0].columnSpan = 5;
    
    return grid;
  }

  //Create and row for the grid.
  void addProducts(String qty, String name, String price, String discount, String ppn, String subtotal, PdfGrid grid) {
    final PdfGridRow row1 = grid.rows.add();
    row1.cells[0].value = qty;
    row1.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 4, bottom: 0);
    row1.cells[1].value = name;
    row1.cells[1].columnSpan = 4;
    row1.cells[1].style.cellPadding = PdfPaddings(left: 4, right: 4, top: 4, bottom: 0);
    final PdfGridRow row2 = grid.rows.add();
    row2.cells[0].value = '';
    row2.cells[1].value = price;
    row2.cells[1].style.cellPadding = PdfPaddings(left: 4, right: 4, top: 0, bottom: 0);
    row2.cells[2].value = discount;
    row2.cells[3].value = ppn;
    row2.cells[4].value = subtotal;
  }
}