import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/controllers/report_stock_opname_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/models/model_report_stock_opname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class ReportStockOpnameFilterItemListScreen extends StatelessWidget {
  final ReportStockOpnameController _reportStockOpnameController = Get.put(ReportStockOpnameController());
  final data;

  ReportStockOpnameFilterItemListScreen(
    this.data
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ReportStockOpnameController(),
      builder: (_) {
        ModelReportStockOpname.dateStart = ModelReportStockOpname.dateStart == null ? DateTime.parse(data['date_start']) : ModelReportStockOpname.dateStart;
        ModelReportStockOpname.dateEnd = ModelReportStockOpname.dateEnd == null ? DateTime.parse(data['date_end']) : ModelReportStockOpname.dateEnd;
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
                                    controller: TextEditingController(text: "${DateFormat("MMMM yyyy", "id_ID").format(DateTime.parse(ModelReportStockOpname.dateStart.toString()))}"),
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
                                    Mdi.calendarMonth,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    showMonthPicker(
                                      context: context,
                                      firstDate: DateTime(DateTime.now().year - 1, 5),
                                      lastDate: DateTime(DateTime.now().year + 1, 9),
                                      initialDate: ModelReportStockOpname.dateStart,
                                      locale: const Locale("id","ID"),
                                    ).then((date) {
                                      if (date != null) {
                                        _reportStockOpnameController.setDate(date);
                                      }
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 24),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Status",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[200],
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: ModelReportStockOpname.getStatus.map(
                              (item) {
                                return Row(
                                  children: [
                                    Radio(
                                      value: item['id'],
                                      groupValue: _.status,
                                      activeColor: ColorTheme.primary,
                                      onChanged: (value) {
                                        _reportStockOpnameController.setStatus(value);
                                      },
                                    ),
                                    Text(
                                      item['name'],
                                    ),
                                  ],
                                );
                              } 
                            ).toList()
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