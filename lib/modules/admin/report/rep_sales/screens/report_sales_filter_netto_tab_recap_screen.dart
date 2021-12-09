import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_autocomplete_customer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class ReportSalesFilterNettoTabRecapScreen extends StatelessWidget {
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ReportSalesController(),
      builder: (_) {
        ModelReportSales.dateStart = ModelReportSales.dateStart == null ? DateTime.now() : ModelReportSales.dateStart;
        ModelReportSales.dateEnd = ModelReportSales.dateEnd == null ? DateTime.now() : ModelReportSales.dateEnd;
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Periode",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12
                        ),
                      )
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                controller: TextEditingController(text: "${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(_.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(_.dateEnd.toString()))}"),
                                readOnly: true,
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                color: Colors.grey[300],
                              ),
                              color: Colors.grey[200]
                            ),
                            margin: EdgeInsets.only(left: 16),
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Icon(
                                Mdi.calendarRange,
                                color: Colors.black54,
                              ),
                              onPressed: () async {
                                final List<DateTime> picked = await DateRangePicker.showDatePicker(
                                  context: context,
                                  initialFirstDate: DateTime.parse(_.dateStart),
                                  initialLastDate: DateTime.parse(_.dateEnd),
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
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Pelanggan",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12
                        ),
                      )
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                controller: TextEditingController(text: _.customerPersonsName),
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: "Pilih Pelanggan..",
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
                                  suffixIcon: Icon(
                                    Mdi.magnify
                                  ),
                                ),
                                onTap: () {
                                  showSearch(context: context, delegate: ReportSalesAutoCompleteCustomerScreen());
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Status",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12
                        ),
                      )
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          for (var item in ModelReportSales.getSalesStatus)
                            WidgetSpan(
                              child: InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 8, right: 8),
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: _.filterSalesStatus.contains(item['id']) == false ? ColorTheme.primary : Colors.black26, 
                                      width: 1
                                    ),
                                    color: _.filterSalesStatus.contains(item['id']) == false ? ColorsBase.primary[50] : Colors.white,
                                  ),
                                  child: Text(
                                    TextTransform.title(item['name']),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: _.filterSalesStatus.contains(item['id']) == false ? ColorTheme.primary : Colors.black38,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _reportSalesController.setFilterSalesStatus(item['id']);
                                },
                              )
                            )
                            
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
