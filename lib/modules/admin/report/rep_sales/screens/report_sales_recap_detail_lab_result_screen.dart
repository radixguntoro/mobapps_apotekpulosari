import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_print_lab_result_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportSalesRecapDetailLabResultScreen extends StatelessWidget {
  final ReportSalesPrintLabResultController _reportSalesPrintLabResultController = Get.put(ReportSalesPrintLabResultController());
  final data;

  ReportSalesRecapDetailLabResultScreen(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Hasil Lab",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        leading: Container(
          width: 40,
          height: 40,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(
              Mdi.chevronLeft,
              size: 24,
            ),
            onPressed: () async {
              Get.close(null);
            },
          ),
        ),
        actions: <Widget>[
          Container(
            width: 56,
            height: 56,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Divider(
              height: 0,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16, right: 8),
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[400]
                              )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    "Pasien",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    TextTransform.title(data['patient']),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16, left: 8),
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[400]
                              )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "Umur",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    data['age'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      child: Table(
                        border: TableBorder.all(
                        color: Colors.grey[400], width: 1, style: BorderStyle.solid),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Text(
                                    "PEMERIKSAAN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Text(
                                    "NILAI",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.grey[200]
                            ),
                            children: [
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Text(
                                    "Glucosa Puasa",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          data['glucosa_fasting'] == '' ? '-' : data['glucosa_fasting'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Normal: 75-110 md/dL",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            children: [
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Text(
                                    "Glucosa 2 Jam PP",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          data['glucosa_2hours_pp'] == '' ? '-' : data['glucosa_2hours_pp'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Normal: < 125 md/dL",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.grey[200]
                            ),
                            children: [
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Text(
                                    "Glucosa Acak",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          data['glucosa_random'] == '' ? '-' : data['glucosa_random'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Normal: < 140 md/dL",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            children: [
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Text(
                                    "Asam Urat",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          data['uric_acid'] == '' ? '-' : data['uric_acid'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Normal P: 2.4 - 5.7 md/dL",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10
                                        ),
                                      ),
                                      Text(
                                        "Normal L: 3.4 - 7.0 md/dL",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.grey[200]
                            ),
                            children: [
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Text(
                                    "Cholesterol",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          data['cholesterol'] == '' ? '-' : data['cholesterol'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Normal: < 200 md/dL",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            children: [
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Text(
                                    "Tensi",
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                  child: Container(
                                    child: Text(
                                      data['blood_pressure'] == '' ? '-' : data['blood_pressure'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        color: ColorsBase.primary[10],
        child: GetBuilder(
          init: ReportSalesController(),
          builder: (resp) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [ColorTheme.primary, ColorTheme.primarySec],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsBase.primary.withOpacity(0.40),
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Text(
                          "Cetak",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Mdi.printer,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  onPressed: () async {
                    _reportSalesPrintLabResultController.exportToPDF(data);
                  },
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
