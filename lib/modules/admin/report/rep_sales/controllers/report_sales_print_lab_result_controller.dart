import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

class ReportSalesPrintLabResultController extends GetxController {
  void exportToPDF(data) async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Set the page size
    document.pageSettings.size = const Size(291.0, 291 * 1.55);
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
    final PdfGrid gridHeader = getGridHeader(data);
    final PdfGrid gridBody = getGridBody(data);   
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
    final File file = File('$path/LAB-${DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.now())}.pdf');
    await file.writeAsBytes(bytes);
    //Launch the file (used open_file package)
    await open_file.OpenFile.open('$path/LAB-${DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.now())}.pdf');
  }

  PdfLayoutResult drawHeader(PdfPage page, Size pageSize) {
    PdfTextElement(
      text: 'Hasil Pemeriksaan', 
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

    return PdfTextElement(
      text: '${DateFormat("dd MMMM yyyy", "id_ID").format(DateTime.now())}', 
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
  }

  //Draws the grid
  void drawGrid(PdfPage page, PdfGrid gridHeader, PdfGrid gridBody, PdfLayoutResult result, Size pageSize) {
    //Draw the grid Header
    gridHeader.draw(page: page, bounds: const Rect.fromLTWH(0, 72, 0, 0));
    //Draw rectangle
    page.graphics.drawRectangle(
      brush: PdfSolidBrush(PdfColor(0, 0, 0, 1)),
      bounds: Rect.fromLTWH(0, 106, pageSize.width, 4)
    );
    //Draw rectangle
    page.graphics.drawRectangle(
      brush: PdfSolidBrush(PdfColor(0, 0, 0, 1)),
      bounds: Rect.fromLTWH(0, 112, pageSize.width, 1)
    );
    //Draw the grid Body
    gridBody.draw(page: page, bounds: const Rect.fromLTWH(0, 120, 0, 0));
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
  PdfGrid getGridHeader(data) {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 2);
    //Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    //Set style
    headerRow.cells[0].value = 'Pasien';
    headerRow.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    headerRow.cells[1].value = 'Umur';
    headerRow.cells[1].stringFormat.alignment = PdfTextAlignment.right;
    headerRow.cells[1].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    final PdfGridRow headerRow1 = grid.headers.add(1)[1];
    //Set style
    headerRow1.cells[0].value = '${TextTransform.title(data['patient'])}';
    headerRow1.cells[0].style.borders = PdfBorders(
      left: PdfPens.white,
      top: PdfPens.white,
      bottom: PdfPens.white,
      right: PdfPens.white
    );
    headerRow1.cells[1].value = '${data['age']}';
    headerRow1.cells[1].stringFormat.alignment = PdfTextAlignment.right;
    headerRow1.cells[1].style.borders = PdfBorders(
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
  PdfGrid getGridBody(data) {
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 2);
    //Add rows

    final PdfGridRow gridRow = grid.headers.add(1)[0];
    //Set style
    gridRow.cells[0].value = 'PEMERIKSAAN';
    gridRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    gridRow.cells[1].value = 'NILAI';
    gridRow.cells[1].stringFormat.alignment = PdfTextAlignment.center;

    PdfGridRow body = grid.rows.add();
    body.cells[0].value = 'Glukosa Puasa';
    body.cells[0].stringFormat.alignment = PdfTextAlignment.left;

    body.cells[1].value = '${data['glucosa_fasting'] == '' ? '-' : data['glucosa_fasting']}\r\nNormal: 75-110 md/dL';
    body.cells[1].stringFormat.alignment = PdfTextAlignment.left;

    body = grid.rows.add();
    body.cells[0].value = 'Glukosa 2 Jam PP';
    body.cells[0].stringFormat.alignment = PdfTextAlignment.left;

    body.cells[1].value = '${data['glucosa_2hours_pp'] == '' ? '-' : data['glucosa_2hours_pp']}\r\nNormal: < 125 md/dL';
    body.cells[1].stringFormat.alignment = PdfTextAlignment.left;

    body = grid.rows.add();
    body.cells[0].value = 'Glucosa Acak';
    body.cells[0].stringFormat.alignment = PdfTextAlignment.left;

    body.cells[1].value = '${data['glucosa_random'] == '' ? '-' : data['glucosa_random']}\r\nNormal: < 140 md/dL';
    body.cells[1].stringFormat.alignment = PdfTextAlignment.left;

    body = grid.rows.add();
    body.cells[0].value = 'Asam Urat';
    body.cells[0].stringFormat.alignment = PdfTextAlignment.left;

    body.cells[1].value = '${data['uric_acid'] == '' ? '-' : data['uric_acid']}\r\nNormal P: 2.4 - 5.7 md/dL\r\nNormal L: 3.4 - 7.0 md/dL';
    body.cells[1].stringFormat.alignment = PdfTextAlignment.left;

    body = grid.rows.add();
    body.cells[0].value = 'Cholesterol';
    body.cells[0].stringFormat.alignment = PdfTextAlignment.left;

    body.cells[1].value = '${data['cholesterol'] == '' ? '-' : data['cholesterol']}\r\nNormal: < 200 md/dL';
    body.cells[1].stringFormat.alignment = PdfTextAlignment.left;

    body = grid.rows.add();
    body.cells[0].value = 'Tensi';
    body.cells[0].stringFormat.alignment = PdfTextAlignment.left;

    body.cells[1].value = '${data['blood_pressure'] == '' ? '-' : data['blood_pressure']}';
    body.cells[1].stringFormat.alignment = PdfTextAlignment.left;

    grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 6, right: 6, top: 4, bottom: 2),
      borderOverlapStyle: PdfBorderOverlapStyle.overlap,
      font: PdfStandardFont(
        PdfFontFamily.helvetica, 
        10,
      ),
    );
    
    return grid;
  }
}