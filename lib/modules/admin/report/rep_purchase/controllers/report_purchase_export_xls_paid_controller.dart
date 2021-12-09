import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

class ReportPurchaseExportXlsPaidController extends GetxController {
  void exportToExcel() async {
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

    sheet.getRangeByName('B3').setText('DATA PELUNASAN PEMBELIAN');
    sheet.getRangeByName('B3').cellStyle.fontSize = 20;
    sheet.getRangeByName('B3').cellStyle.bold = true;

    sheet.getRangeByName('B5').setText('Periode: ${DateFormat('dd-MM-yyyy', 'id_ID').format(ModelReportPurchase.dateStart).toString()} - ${DateFormat('dd-MM-yyyy', 'id_ID').format(ModelReportPurchase.dateEnd).toString()}');
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
    final Range range2 = sheet.getRangeByName('F11:G11');

    range1.merge();
    range2.merge();

    sheet.getRangeByName('B12:K12').cellStyle.backColor = '#C3E6CA';
    sheet.getRangeByIndex(12, 2).setText('TANGGAL');
    sheet.getRangeByIndex(12, 3).setText('NO. TRANSAKSI');
    sheet.getRangeByIndex(12, 4).setText('SUPPLIER');
    sheet.getRangeByIndex(12, 5).setText('NO. FAKTUR');
    sheet.getRangeByIndex(12, 6).setText('KASIR');
    sheet.getRangeByIndex(12, 7).setText('TOTAL');
    sheet.getRangeByIndex(12, 8).setText('DISKON');
    sheet.getRangeByIndex(12, 9).setText('SUBTOTAL');
    sheet.getRangeByIndex(12, 10).setText('PPN');
    sheet.getRangeByIndex(12, 11).setText('GRAND TOTAL');
    sheet.getRangeByName('B12:K12').cellStyle.bold = true;

    var x = 13;
    for (var i = 0; i < ModelReportPurchase.getDataPaid.length; i++) {
      sheet.getRangeByIndex(x + i, 2).setText(DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.parse(ModelReportPurchase.getDataPaid[i]['created_at'])));
      sheet.getRangeByIndex(x + i, 2).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 2).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 3).setText(ModelReportPurchase.getDataPaid[i]['id'].toString());
      sheet.getRangeByIndex(x + i, 3).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 3).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 4).setText(ModelReportPurchase.getDataPaid[i]['supplier']);
      sheet.getRangeByIndex(x + i, 4).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 4).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 5).setText(ModelReportPurchase.getDataPaid[i]['invoice_number']);
      sheet.getRangeByIndex(x + i, 5).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 5).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 6).setText(TextTransform.title(ModelReportPurchase.getDataPaid[i]['cashier']));
      sheet.getRangeByIndex(x + i, 6).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 6).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 7).setNumber(double.parse(ModelReportPurchase.getDataPaid[i]['total'].toString()));
      sheet.getRangeByIndex(x + i, 7).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 7).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 7).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 7).cellStyle.numberFormat = '#,##0';
      sheet.getRangeByIndex(x + i, 8).setNumber(double.parse(ModelReportPurchase.getDataPaid[i]['discount'].toString()));
      sheet.getRangeByIndex(x + i, 8).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 8).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 8).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 8).cellStyle.numberFormat = '#,##0';
      sheet.getRangeByIndex(x + i, 9).setNumber(double.parse(ModelReportPurchase.getDataPaid[i]['subtotal'].toString()));
      sheet.getRangeByIndex(x + i, 9).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 9).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 9).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 9).cellStyle.numberFormat = '#,##0';
      sheet.getRangeByIndex(x + i, 10).setNumber(double.parse(ModelReportPurchase.getDataPaid[i]['ppn'].toString()) * 100);
      sheet.getRangeByIndex(x + i, 10).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 10).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 10).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 10).cellStyle.numberFormat = '#,##0';
      sheet.getRangeByIndex(x + i, 11).setNumber(double.parse(ModelReportPurchase.getDataPaid[i]['grand_total'].toString()));
      sheet.getRangeByIndex(x + i, 11).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 11).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 11).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 11).cellStyle.numberFormat = '#,##0';
    }

    // AutoFit applied to a single row
    sheet.autoFitRow(1);
    sheet.autoFitRow(2);
    sheet.autoFitRow(3);
    sheet.autoFitRow(7);
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
    final File file = File('$path/APS-PELUNASAN-PEMBELIAN-${DateFormat('dd-MM-yyyy', 'id_ID').format(ModelReportPurchase.dateStart).toString()}.xlsx');
    await file.writeAsBytes(bytes);

    //Launch the file (used open_file package)
    await open_file.OpenFile.open('$path/APS-PELUNASAN-PEMBELIAN-${DateFormat('dd-MM-yyyy', 'id_ID').format(ModelReportPurchase.dateStart).toString()}.xlsx');

    // isLoadingFalse();
    // update();
  }
}