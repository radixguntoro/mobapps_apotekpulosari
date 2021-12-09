import 'dart:io';

import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/models/model_report_stock_opname.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/services/report_stock_opname_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

class ReportStockOpnameController extends GetxController {
  String medicineId = '';
  String medicineName = '';
  int page = 1;
  int limit = 50;
  int state = 1;
  String dateStart = '';
  String dateEnd = '';
  String sortStatus;
  String sortName = 'asc';
  String status = 'all';

  void isLoadingTrue() async{
    ModelReportStockOpname.isLoading = true;
  }

  void isLoadingFalse() async{
    ModelReportStockOpname.isLoading = false;
  }

  void clearData() async {
    status = 'all';
    dateStart = new DateTime.now().toString();
    dateEnd = new DateTime.now().toString();
    ModelReportStockOpname.dateStart = DateTime.now();
    ModelReportStockOpname.dateEnd = Jiffy([DateTime.now().year, DateTime.now().month, DateTime.now().day]).endOf(Units.MONTH);
    ModelReportStockOpname.getData = [];
    ModelReportStockOpname.medicineId = '';
    ModelReportStockOpname.medicineName = '';
  }

  void onInit() {
    readFirst();
  }
  
  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 50;
    state = ModelReportStockOpname.state;
    dateStart = ModelReportStockOpname.dateStart == null ? '' : DateFormat('yyyy-MM-dd').format(ModelReportStockOpname.dateStart).toString();
    dateEnd = ModelReportStockOpname.dateEnd == null ? '' : DateFormat('yyyy-MM-dd').format(ModelReportStockOpname.dateEnd).toString();
    ModelReportStockOpname.maxData = false;
    print(dateStart);
    var resp = await ReportStockOpnameService.readData(page, limit, state, dateStart, dateEnd, medicineId, status);
    ModelReportStockOpname.getData = resp['data'];
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelReportStockOpname.currentPage + 1;
    print(page);
    if (page <= ModelReportStockOpname.lastPage ) {
      var resp = await ReportStockOpnameService.readData(page, limit, state, dateStart, dateEnd, medicineId, status);
      if (resp['data'].isEmpty) {
        ModelReportStockOpname.maxData = true;
      } else {
        ModelReportStockOpname.maxData = false;
        ModelReportStockOpname.getData += resp['data'];
      }
      update();
    }
  }

  void setDate(date) {
    // ModelReportStockOpname.dateStart = date[0];
    // ModelReportStockOpname.dateEnd = date[1];
    ModelReportStockOpname.dateStart = date;
    ModelReportStockOpname.dateEnd = Jiffy([date.year, date.month, date.day]).endOf(Units.MONTH);
    print(ModelReportStockOpname.dateStart.toString());
    print(ModelReportStockOpname.dateEnd.toString());
    update();
  }

  void setStatus(val) {
    status = val;
    update();
  }

  void setResetFilter() {
    clearData();
    readFirst();
    update();
  }

  void setFilterApply() {
    readFirst();
    update();
  }

  void setSortData(col) async {
    switch (col) {
      case 'name':
        sortName = sortName == null ? 'asc' : sortName == 'asc' ? 'desc' : 'asc';
        sortStatus = null;
        if (sortName == 'asc') {
          ModelReportStockOpname.getData.sort((a, b) => a['name'].compareTo(b['name']));
        } else {
          ModelReportStockOpname.getData.sort((a, b) => b['name'].compareTo(a['name']));
        }
        break;
      case 'status':
        sortStatus = sortStatus == null ? 'asc' : sortStatus == 'asc' ? 'desc' : 'asc';
        sortName = null;
        if (sortStatus == 'asc') {
          ModelReportStockOpname.getData.sort((a, b) => a['status'].compareTo(b['status']));
        } else {
          ModelReportStockOpname.getData.sort((a, b) => b['status'].compareTo(a['status']));
        }
        break;
      default:
    }
    update();
  }

  void exportToExcel() async {
    // isLoadingTrue();
    // update();

    // dateStart = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateStart).toString();
    // dateEnd = DateFormat('yyyy-MM-dd').format(ModelReportItemCard.dateEnd).toString();
    
    // var resp = await ReportItemCardService.readItemStockListExport(page, dateStart, dateEnd);
    // ModelReportItemCard.getDataFull = resp['data'];
    
    final Workbook workbook = Workbook();
    //Accessing via index
    final Worksheet sheet = workbook.worksheets[0];
    sheet.showGridlines = false;

    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();

    //Set data in the worksheet.
    sheet.getRangeByName('A1').columnWidth = 4.82;

    sheet.getRangeByName('A1:L1').cellStyle.backColor = '#117D35';
    sheet.getRangeByName('A1:L1').merge();
    sheet.getRangeByName('B3:D4').merge();

    final Style globalStyle = workbook.styles.add('style');
    globalStyle.fontName = 'Montserrat';

    sheet.getRangeByName('B3').setText('DATA STOK OPNAME');
    sheet.getRangeByName('B3').cellStyle.fontSize = 20;
    sheet.getRangeByName('B3').cellStyle.bold = true;

    sheet.getRangeByName('B5').setText('Bulan: ${DateFormat('MMMM yyyy').format(ModelReportStockOpname.dateStart).toString()}');
    sheet.getRangeByName('B5').cellStyle.fontSize = 12;
    sheet.getRangeByName('B5:D5').merge();

    sheet.getRangeByName('B7').setText('APOTEK PULOSARI');
    sheet.getRangeByName('B7').cellStyle.fontSize = 16;
    sheet.getRangeByName('B7').cellStyle.bold = true;
    sheet.getRangeByName('B7:D7').merge();

    sheet.getRangeByName('B8').setText('Jl. Pulosari III/48, Kel. Gunung Sari, Kec. Dukuh Pakis, Surabaya.');
    sheet.getRangeByName('B8').cellStyle.fontSize = 12;
    sheet.getRangeByName('B8:D8').merge();

    sheet.getRangeByName('B9').setText('081330104464');
    sheet.getRangeByName('B9').cellStyle.fontSize = 12;
    sheet.getRangeByName('B9:D9').merge();

    final Range range1 = sheet.getRangeByName('F8:G8');
    final Range range2 = sheet.getRangeByName('F9:G11');

    range1.merge();
    range2.merge();

    sheet.getRangeByName('B12:K12').cellStyle.backColor = '#C3E6CA';
    sheet.getRangeByIndex(12, 2).setText('NO');
    sheet.getRangeByIndex(12, 3).setText('SKU');
    sheet.getRangeByIndex(12, 4).setText('NAMA BARANG');
    sheet.getRangeByIndex(12, 5).setText('KATEGORI');
    sheet.getRangeByIndex(12, 6).setText('HARGA JUAL');
    sheet.getRangeByIndex(12, 7).setText('TANGGAL S.O');
    sheet.getRangeByIndex(12, 8).setText('KASIR');
    sheet.getRangeByIndex(12, 9).setText('STOK SISTEM');
    sheet.getRangeByIndex(12, 10).setText('STOK FISIK');
    sheet.getRangeByIndex(12, 11).setText('STOK SELISIH');
    sheet.getRangeByName('B12:K12').cellStyle.bold = true;

    var x = 13;
    for (var i = 0; i < ModelReportStockOpname.getData.length; i++) {
      sheet.getRangeByIndex(x + i, 2).setText((i+1).toString());
      sheet.getRangeByIndex(x + i, 2).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 2).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 3).setText(ModelReportStockOpname.getData[i]['id'].toString());
      sheet.getRangeByIndex(x + i, 3).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 3).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 4).setText(ModelReportStockOpname.getData[i]['name']);
      sheet.getRangeByIndex(x + i, 4).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 4).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 5).setText(ModelReportStockOpname.getData[i]['category']);
      sheet.getRangeByIndex(x + i, 5).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 5).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 6).setNumber(double.parse(ModelReportStockOpname.getData[i]['price_sell'].toString()));
      sheet.getRangeByIndex(x + i, 6).cellStyle.numberFormat = '#,##0';
      sheet.getRangeByIndex(x + i, 6).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 6).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 6).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 7).setText(ModelReportStockOpname.getData[i]['status'] == 'none' ? '-' : DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.parse(ModelReportStockOpname.getData[i]['created_at'])));
      sheet.getRangeByIndex(x + i, 7).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 7).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 8).setText(ModelReportStockOpname.getData[i]['status'] == 'none' ? '-' : TextTransform.title(ModelReportStockOpname.getData[i]['cashier_name']));
      sheet.getRangeByIndex(x + i, 8).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 8).cellStyle.borders.all.color = "#C3E6CA";
      if (ModelReportStockOpname.getData[i]['status'] == 'none') {
        sheet.getRangeByIndex(x + i, 9).setText('-');
      } else {
        sheet.getRangeByIndex(x + i, 9).setNumber(double.parse(ModelReportStockOpname.getData[i]['stock_in_system'].toString()));
        sheet.getRangeByIndex(x + i, 9).cellStyle.numberFormat = '#,##0';
      }
      sheet.getRangeByIndex(x + i, 9).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 9).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 9).cellStyle.borders.all.color = "#C3E6CA";
      if (ModelReportStockOpname.getData[i]['status'] == 'none') {
        sheet.getRangeByIndex(x + i, 10).setText('-');
      } else {
        sheet.getRangeByIndex(x + i, 10).setNumber(double.parse(ModelReportStockOpname.getData[i]['stock_in_physic'].toString()));
        sheet.getRangeByIndex(x + i, 10).cellStyle.numberFormat = '#,##0';
      }
      sheet.getRangeByIndex(x + i, 10).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 10).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 10).cellStyle.borders.all.color = "#C3E6CA";
      if (ModelReportStockOpname.getData[i]['status'] == 'none') {
        sheet.getRangeByIndex(x + i, 11).setText('-');
      } else {
        sheet.getRangeByIndex(x + i, 11).setNumber(double.parse(ModelReportStockOpname.getData[i]['stock_difference'].toString()));
        sheet.getRangeByIndex(x + i, 11).cellStyle.numberFormat = '#,##0';
      }
      sheet.getRangeByIndex(x + i, 11).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 11).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 11).cellStyle.borders.all.color = "#C3E6CA";
    }

    // AutoFit applied to a single row
    sheet.autoFitRow(1);
    sheet.autoFitRow(2);
    sheet.autoFitRow(3);
    sheet.autoFitRow(8);
    sheet.autoFitRow(9);
    sheet.autoFitRow(10);
    sheet.autoFitRow(11);

    // AutoFit applied to a single Column.
    sheet.autoFitColumn(2);
    sheet.autoFitColumn(3);
    sheet.autoFitColumn(4);
    sheet.autoFitColumn(5);
    sheet.autoFitColumn(6);
    sheet.autoFitColumn(7);
    sheet.autoFitColumn(8);
    sheet.autoFitColumn(9);
    sheet.autoFitColumn(10);
    sheet.autoFitColumn(11);

    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();

    //Get the storage folder location using path_provider package.
    final Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    final String path = directory.path;
    final File file = File('$path/APS-STOK-OPNAME-${DateFormat('MMM-yyyy').format(ModelReportStockOpname.dateStart).toString().toUpperCase()}.xlsx');
    await file.writeAsBytes(bytes);

    //Launch the file (used open_file package)
    await open_file.OpenFile.open('$path/APS-STOK-OPNAME-${DateFormat('MMM-yyyy').format(ModelReportStockOpname.dateStart).toString().toUpperCase()}.xlsx');

    // isLoadingFalse();
    // update();
  }
}