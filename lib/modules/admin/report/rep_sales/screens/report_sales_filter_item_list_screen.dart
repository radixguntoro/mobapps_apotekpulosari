import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class ReportSalesFilterItemListScreen extends StatelessWidget {
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  final data;

  ReportSalesFilterItemListScreen(
    this.data
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ReportSalesController(),
      builder: (_) {
        ModelReportSales.dateStart = ModelReportSales.dateStart == null ? DateTime.now() : ModelReportSales.dateStart;
        ModelReportSales.dateEnd = ModelReportSales.dateEnd == null ? DateTime.now() : ModelReportSales.dateEnd;
        return Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 24),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Periode",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: TextFormField(
                                    controller: TextEditingController(text: "${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportSales.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportSales.dateEnd.toString()))}"),
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: "Pilih Tanggal..",
                                      contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[200]),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[300]),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[300]),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 48,
                                height: 48,
                                margin: EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  gradient: LinearGradient(
                                    colors: [ColorTheme.third, ColorTheme.thirdSec],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                  ),
                                ),
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    Mdi.calendarRange,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    final List<DateTime> picked = await DateRangePicker.showDatePicker(
                                      context: context,
                                      initialFirstDate: ModelReportSales.dateStart,
                                      initialLastDate: ModelReportSales.dateEnd,
                                      // initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                                      firstDate: new DateTime(2020, 12, 26),
                                      lastDate: new DateTime.now(),
                                      locale: const Locale("id","ID"),
                                    );
                                    if (picked != null && picked.length == 2) {
                                      _reportSalesController.setDate(picked, 'dateRange');
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}