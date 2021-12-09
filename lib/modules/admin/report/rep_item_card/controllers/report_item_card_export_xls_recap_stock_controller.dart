import 'dart:io';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

class ReportItemCardExportXLSRecapStockController extends GetxController {
  void exportToExcel() async {
    final Workbook workbook = Workbook();
    //Accessing via index
    final Worksheet sheet = workbook.worksheets[0];
    sheet.showGridlines = false;

    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();

    //Set data in the worksheet.
    sheet.getRangeByName('A1').columnWidth = 4.82;

    sheet.getRangeByName('A1:J1').cellStyle.backColor = '#117D35';
    sheet.getRangeByName('A1:J1').merge();
    sheet.getRangeByName('B3:D4').merge();

    final Style globalStyle = workbook.styles.add('style');
    globalStyle.fontName = 'Montserrat';

    sheet.getRangeByName('B3').setText('DATA BARANG');
    sheet.getRangeByName('B3').cellStyle.fontSize = 20;
    sheet.getRangeByName('B3').cellStyle.bold = true;

    sheet.getRangeByName('B5').setText('Tanggal: ${DateFormat('dd MMM yyyy').format(ModelReportItemCard.dateStart).toString()}');
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
    final Range range2 = sheet.getRangeByName('F9:G9');

    range1.merge();
    range2.merge();

    sheet.getRangeByName('B12:I12').cellStyle.backColor = '#C3E6CA';
    sheet.getRangeByIndex(12, 2).setText('NO');
    sheet.getRangeByIndex(12, 3).setText('SKU');
    sheet.getRangeByIndex(12, 4).setText('NAMA BARANG');
    sheet.getRangeByIndex(12, 5).setText('KATEGORI');
    sheet.getRangeByIndex(12, 6).setText('SATUAN');
    sheet.getRangeByIndex(12, 7).setText('STOK');
    sheet.getRangeByIndex(12, 8).setText('HARGA');
    sheet.getRangeByIndex(12, 9).setText('SUBTOTAL');
    sheet.getRangeByName('B12:I12').cellStyle.bold = true;

    var x = 13;
    for (var i = 0; i < ModelReportItemCard.dataItems.length; i++) {
      sheet.getRangeByIndex(x + i, 2).setText(ModelReportItemCard.dataItems[i]['number'].toString());
      sheet.getRangeByIndex(x + i, 2).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 2).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 3).setText(ModelReportItemCard.dataItems[i]['id'].toString());
      sheet.getRangeByIndex(x + i, 3).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 3).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 4).setText(ModelReportItemCard.dataItems[i]['name']);
      sheet.getRangeByIndex(x + i, 4).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 4).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 5).setText(ModelReportItemCard.dataItems[i]['category']);
      sheet.getRangeByIndex(x + i, 5).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 5).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 6).setText(TextTransform.title(ModelReportItemCard.dataItems[i]['unit']));
      sheet.getRangeByIndex(x + i, 6).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 6).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 7).setNumber(double.parse(ModelReportItemCard.dataItems[i]['stock'].toString()));
      sheet.getRangeByIndex(x + i, 7).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 7).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 7).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 7).cellStyle.numberFormat = '#,##0';
      sheet.getRangeByIndex(x + i, 8).setNumber(double.parse(ModelReportItemCard.dataItems[i]['price'].toString()));
      sheet.getRangeByIndex(x + i, 8).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 8).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 8).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 8).cellStyle.numberFormat = '#,##0';
      sheet.getRangeByIndex(x + i, 9).setNumber(double.parse(ModelReportItemCard.dataItems[i]['subtotal'].toString()));
      sheet.getRangeByIndex(x + i, 9).cellStyle.hAlign = HAlignType.right;
      sheet.getRangeByIndex(x + i, 9).cellStyle.borders.all.lineStyle = LineStyle.thin;
      sheet.getRangeByIndex(x + i, 9).cellStyle.borders.all.color = "#C3E6CA";
      sheet.getRangeByIndex(x + i, 9).cellStyle.numberFormat = '#,##0';
    }

    // AutoFit applied to a single row
    sheet.autoFitRow(1);
    sheet.autoFitRow(2);
    sheet.autoFitRow(3);

    // AutoFit applied to a single Column.
    sheet.autoFitColumn(2);
    sheet.autoFitColumn(3);
    sheet.autoFitColumn(4);
    sheet.autoFitColumn(5);
    sheet.autoFitColumn(6);

    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();

    //Get the storage folder location using path_provider package.
    final Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    final String path = directory.path;
    final File file = File('$path/APS-REKAP-BARANG-${DateFormat('dd-MM-yyyy', 'id_ID').format(ModelReportItemCard.dateStart).toString()}.xlsx');
    await file.writeAsBytes(bytes);

    //Launch the file (used open_file package)
    await open_file.OpenFile.open('$path/APS-REKAP-BARANG-${DateFormat('dd-MM-yyyy', 'id_ID').format(ModelReportItemCard.dateStart).toString()}.xlsx');

    // isLoadingFalse();
    // update();
  }
}