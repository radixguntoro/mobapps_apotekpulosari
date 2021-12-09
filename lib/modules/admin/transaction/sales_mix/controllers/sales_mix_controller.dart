import 'dart:io';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/models/model_sales_mix.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/services/sales_mix_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

class SalesMixController extends GetxController {
  String id;
  int page = 1;
  int limit = 10;
  String result = '';
  Map response = {};

  SalesMixController({
    this.id,
  });

  void isLoadingTrue() async{
    ModelSalesMix.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelSalesMix.isLoading = false;
  }

  void clearData() {
    ModelSalesMix.medicineMix = [];
    ModelSalesMix.barcode = '';
    ModelSalesMix.total = 0;  
    ModelSalesMix.grandTotal = 0; 
    ModelSalesMix.discount = 0;  
    ModelSalesMix.feePharmacist = 0;  
    ModelSalesMix.payment = 0;  
    ModelSalesMix.balance = 0;
  }

  void clearForm() {
    ModelSalesMix.patient = '';
    ModelSalesMix.weight = '';
    ModelSalesMix.age = '';
  }

  void clearPayment() { 
    ModelSalesMix.discount = 0;  
    ModelSalesMix.payment = 0;  
    ModelSalesMix.balance = 0;   
    ModelSalesMix.feePharmacist = 0;   
    ModelSalesMix.grandTotal = ModelSalesMix.total;
  }

  void clearCart() {
    ModelSalesMix.getCart = [];
    ModelSalesMix.mixName = '';
    ModelSalesMix.mixTotal = 0;
    ModelSalesMix.mixGrandTotal = 0;
    ModelSalesMix.mixTuslah = 0;
  }
  
  @override

  void onInit() {
    ModelSalesMix.result = 'ready';
  }

  void scanDataByBarcodeQRCode(barcode) async {
    result = await SalesMixService.readDataByBarcodeQRCode(barcode);
    ModelSalesMix.barcode = '';
    ModelSalesMix.getCart = ModelSalesMix.getCart;
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

  void calcTotal() async {
    double total = 0;
    for(final data in ModelSalesMix.medicineMix) {
      total += ((double.parse(data['price'].toStringAsFixed(0)) + double.parse(data['tuslah'].toStringAsFixed(0))) * data['qty']);
      data['subtotal'] = ((double.parse(data['price'].toStringAsFixed(0)) + double.parse(data['tuslah'].toStringAsFixed(0))) * data['qty']);
    }

    ModelSalesMix.total = total;
    ModelSalesMix.grandTotal = (total - ModelSalesMix.discount) + ModelSalesMix.feePharmacist;
    ModelSalesMix.balance = ModelSalesMix.payment > (total - ModelSalesMix.discount) ? (ModelSalesMix.payment - ((total - ModelSalesMix.discount) + ModelSalesMix.feePharmacist)) : 0;
    update();
  }

  void calcDiscount(val) async {
    if(val.length < 1 || double.parse(val.replaceAll('.','')) > ModelSalesMix.total) {
      ModelSalesMix.discount = 0;
    } else {
      ModelSalesMix.discount = double.parse(val.replaceAll('.',''));
    }
    calcTotal();
    update();
  }

  void calcFeePharmacist(val) async {
    if(val.length < 1) {
      ModelSalesMix.feePharmacist = 0;
    } else {
      ModelSalesMix.feePharmacist = double.parse(val.replaceAll('.',''));
    }
    calcTotal();
    update();
  }

  void calcPayment(val) async {
    if(val.length < 1) {
      ModelSalesMix.payment = 0;
    } else {
      ModelSalesMix.payment = double.parse(val.replaceAll('.',''));
    }
    calcTotal();
    update();
  }

  void setQtyCart(data, val) async {
    print(val.length);
    if(val.length == 0) {
      data['qty'] = 1;
    } else {
      data['qty'] = int.parse(val.replaceAll('.',''));
    }
    calcTotalMix();
    update();
  }

  void setQtyCartMix(data, val) async {
    print(val.length);
    if(val.length == 0) {
      data['qty'] = 1;
    } else {
      data['qty'] = int.parse(val.replaceAll('.',''));
    }
    calcTotal();
    update();
  }

  void calcTotalMix() async {
    double total = 0;
    
    for(final data in ModelSalesMix.getCart) {
      total += (double.parse(data['price'].toStringAsFixed(0)) * data['qty']);
    }

    ModelSalesMix.mixTotal = total;
    ModelSalesMix.mixGrandTotal = total + ModelSalesMix.mixTuslah;
    update();
  }

  void calcMixTuslah(val) async {
    if(val.length < 1) {
      ModelSalesMix.mixTuslah = 0;
    } else {
      ModelSalesMix.mixTuslah = double.parse(val.replaceAll('.',''));
    }
    calcTotalMix();
    update();
  }

  void createCart(data) async {
    ModelSalesMix.getCart.add({
      'medicines_items_id': data['id'],
      'name': data['name'],
      'price': double.parse(data['tabletPriceSell']) + (double.parse(data['tabletPriceSell']) * 0.1),
      'qty_total': data['qtyTotal'].toString(),
      'qty': 1,
      'subtotal': double.parse(data['tabletPriceSell']) + (double.parse(data['tabletPriceSell']) * 0.1),
      'discount': 0,
      'unit': data['unitName'],
      'category': data['categoryName'],
    });
    calcTotalMix();
    update();
  }

  void createMix() async {
    ModelSalesMix.medicineMix.add({
      'medicineMixName': ModelSalesMix.mixName,
      'details': ModelSalesMix.getCart,
      'tuslah': ModelSalesMix.mixTuslah,
      'qty': 1,
      'price': ModelSalesMix.mixTotal,
      'subtotal': ModelSalesMix.mixGrandTotal,
    });
    // ignore: await_only_futures
    await calcTotal();
    clearCart();
    update();
  }

  void createData() async {
    ModelSalesMix.getInvoice = {};
    isLoadingTrue();
    update();
    try {
      response = await SalesMixService.createData();
      id = response['id'];

      if (response['status'] == 1) {
        result = 'success';
        var data = await SalesMixService.readDataById(id);
        ModelSalesMix.getInvoice = data;
        clearCart();
        clearPayment();
        readFirst();
        isLoadingFalse();
        update();
      } else {
        result = 'failed';
        isLoadingFalse();
        // Snackbar.fail(response);
        update();
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
    ModelSalesMix.maxData = false;
    var resp = await SalesMixService.readData(page, limit);
    ModelSalesMix.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelSalesMix.currentPage + 1;
    var resp = await SalesMixService.readData(page, limit);
    if (resp.isEmpty) {
      ModelSalesMix.maxData = true;
    } else {
      ModelSalesMix.maxData = false;
      ModelSalesMix.getData += resp;
    }
    update();
  }

  void readDataBySearch(type) async{
    var resp = await SalesMixService.readDataBySearch(type, page, limit);
    ModelSalesMix.getData = resp;
    update();
  }

  void readDataById(id) async {
    var resp = await SalesMixService.readDataById(id);
    ModelSalesMix.getInvoice = resp;
    print(ModelSalesMix.getInvoice);
    update();
  }

  void deleteCart(id) async {
    ModelSalesMix.getCart.removeWhere((item) => item['medicines_items_id'] == id);
    calcTotalMix();
    update();
  }

  void deleteMix(index) async {
    ModelSalesMix.medicineMix.removeAt(index);
    calcTotal();
    update();
  }

  void exportToPDF() async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Set the page size
    document.pageSettings.size = const Size(291.0, 291 * 1.75);
    document.pageSettings.margins.all= 12;
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    print(pageSize.width);
    //Draw rectangle
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
    //Generate PDF grid.
    final PdfGrid gridHeader = getGridHeader();
    final PdfGrid gridBody = getGridBody();
    //Draw the header section by creating text element
    final PdfLayoutResult result = drawHeader(page, pageSize);
    //Draw grid
    drawGrid(page, gridHeader, gridBody, result, pageSize);
    //Add invoice footer
    // drawFooter(page, pageSize);
    //Save and launch the document
    final List<int> bytes = document.save();
    //Dispose the document.
    document.dispose();
    //Get the storage folder location using path_provider package.
    final Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
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
  void drawGrid(PdfPage page, PdfGrid gridHeader, PdfGrid gridBody, PdfLayoutResult result, Size pageSize) {
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
  void drawFooter(PdfPage page, Size pageSize) {
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
    headerRow.cells[2].value = '${ModelSalesMix.getInvoice['date']}';
    headerRow.cells[2].stringFormat.alignment = PdfTextAlignment.right;
    headerRow.cells[2].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    final PdfGridRow headerRow1 = grid.headers.add(1)[1];
    //Set style
    headerRow1.cells[0].value = '${ModelSalesMix.getInvoice['id']}';
    headerRow1.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    headerRow1.cells[1].value = '${TextTransform.title(ModelSalesMix.getInvoice['cashierName'])}';
    headerRow1.cells[1].stringFormat.alignment = PdfTextAlignment.center;
    headerRow1.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    headerRow1.cells[2].value = '${ModelSalesMix.getInvoice['time']}';
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
    grid.columns.add(count: 4);
    //Add rows
    for (var item in ModelSalesMix.getInvoice['details']) {
      addProducts(
        '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(item['qty'].toString()))}', 
        item['medicineName'].toUpperCase(), 
        '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['price'].toString()))}', 
        '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['subtotal'].toString()))}', 
        grid);
    }
    grid.columns[0].width = 32;
    grid.columns[1].width = 120;
    //Set gird columns width
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        switch (j) {
          case 0:
            cell.stringFormat.alignment = PdfTextAlignment.right;
            cell.style.cellPadding = PdfPaddings(left: 0, right: 4, top: 2, bottom: 2);
            cell.style.borders = PdfBorders(
              left: PdfPens.white,
              top: PdfPens.white,
              bottom: PdfPens.white,
              right: PdfPens.white
            );
            break;
          case 1:
            cell.stringFormat.alignment = PdfTextAlignment.left;
            cell.style.cellPadding = PdfPaddings(left: 4, right: 4, top: 2, bottom: 2);
            cell.style.borders = PdfBorders(
              left: PdfPens.white,
              top: PdfPens.white,
              bottom: PdfPens.white,
              right: PdfPens.white
            );
            break;
          case 2:
            cell.stringFormat.alignment = PdfTextAlignment.right;
            cell.style.cellPadding = PdfPaddings(left: 4, right: 4, top: 2, bottom: 2);
            cell.style.borders = PdfBorders(
              left: PdfPens.white,
              top: PdfPens.white,
              bottom: PdfPens.white,
              right: PdfPens.white
            );
            break;
          case 3:
            cell.stringFormat.alignment = PdfTextAlignment.right;
            cell.style.cellPadding = PdfPaddings(left: 4, right: 0, top: 2, bottom: 2);
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
    footer1.cells[0].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelSalesMix.getInvoice['qtyTotal'].toString()))}';
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
    footer1.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footer1.cells[2].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelSalesMix.getInvoice['total'].toString()))}';
    footer1.cells[2].columnSpan = 2;
    footer1.cells[2].stringFormat.alignment = PdfTextAlignment.right;
    footer1.cells[2].style.cellPadding = PdfPaddings(left: 0, right: 0, top: 6, bottom: 0);
    footer1.cells[2].style.borders = PdfBorders(
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
    footer2.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 2, bottom: 6);
    footer2.cells[1].value = 'DISKON:';
    footer2.cells[1].stringFormat.alignment = PdfTextAlignment.right;
    footer2.cells[1].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 2, bottom: 6);
    footer2.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.black,
      right: PdfPens.white
    );
    footer2.cells[2].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelSalesMix.getInvoice['discount'].toString()))}';
    footer2.cells[2].columnSpan = 2;
    footer2.cells[2].stringFormat.alignment = PdfTextAlignment.right;
    footer2.cells[2].style.cellPadding = PdfPaddings(left: 0, right: 0, top: 2, bottom: 6);
    footer2.cells[2].style.borders = PdfBorders(
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
    footer3.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 6, bottom: 0);
    footer3.cells[1].value = 'GRAND TOTAL:';
    footer3.cells[1].stringFormat.alignment = PdfTextAlignment.right;
    footer3.cells[1].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 6, bottom: 0);
    footer3.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footer3.cells[2].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelSalesMix.getInvoice['grandTotal'].toString()))}';
    footer3.cells[2].columnSpan = 2;
    footer3.cells[2].stringFormat.alignment = PdfTextAlignment.right;
    footer3.cells[2].style.cellPadding = PdfPaddings(left: 0, right: 0, top: 6, bottom: 0);
    footer3.cells[2].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );

    final PdfGridRow footer4 = grid.rows.add();
    footer4.cells[0].value = '';
    footer4.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.black,
      right: PdfPens.white
    );
    footer4.cells[0].stringFormat.alignment = PdfTextAlignment.right;
    footer4.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 2, bottom: 6);
    footer4.cells[1].value = 'TUNAI:';
    footer4.cells[1].stringFormat.alignment = PdfTextAlignment.right;
    footer4.cells[1].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 2, bottom: 6);
    footer4.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.black,
      right: PdfPens.white
    );
    footer4.cells[2].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelSalesMix.getInvoice['payment'].toString()))}';
    footer4.cells[2].columnSpan = 2;
    footer4.cells[2].stringFormat.alignment = PdfTextAlignment.right;
    footer4.cells[2].style.cellPadding = PdfPaddings(left: 0, right: 0, top: 2, bottom: 6);
    footer4.cells[2].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.black,
      right: PdfPens.white
    );

    final PdfGridRow footer5 = grid.rows.add();
    footer5.cells[0].value = '';
    footer5.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footer5.cells[0].stringFormat.alignment = PdfTextAlignment.right;
    footer5.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 6, bottom: 0);
    footer5.cells[1].value = 'KEMBALI:';
    footer5.cells[1].stringFormat.alignment = PdfTextAlignment.right;
    footer5.cells[1].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 6, bottom: 0);
    footer5.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footer5.cells[2].value = '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelSalesMix.getInvoice['balance'].toString()))}';
    footer5.cells[2].columnSpan = 2;
    footer5.cells[2].stringFormat.alignment = PdfTextAlignment.right;
    footer5.cells[2].style.cellPadding = PdfPaddings(left: 0, right: 0, top: 6, bottom: 6);
    footer5.cells[2].style.borders = PdfBorders(
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
    footerLine1.cells[0].columnSpan = 4;

    final PdfGridRow footerLine2 = grid.rows.add();
    footerLine2.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footerLine2.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    footerLine2.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 0, bottom: 0);
    footerLine2.cells[0].columnSpan = 4;

    final PdfGridRow footerLine3 = grid.rows.add();
    footerLine3.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footerLine3.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    footerLine3.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 0, bottom: 0);
    footerLine3.cells[0].columnSpan = 4;

    final PdfGridRow footerLine4 = grid.rows.add();
    footerLine4.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.black,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    footerLine4.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    footerLine4.cells[0].style.cellPadding = PdfPaddings(left: 0, right: 4, top: 0, bottom: 3);
    footerLine4.cells[0].columnSpan = 4;

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
    footerPage1.cells[0].columnSpan = 4;

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
    footerPage2.cells[0].columnSpan = 4;
    
    return grid;
  }

  //Create and row for the grid.
  void addProducts(String qty, String name, String price, String subtotal, PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = qty;
    row.cells[1].value = name;
    row.cells[2].value = '';
    row.cells[3].value = subtotal;
  }
}