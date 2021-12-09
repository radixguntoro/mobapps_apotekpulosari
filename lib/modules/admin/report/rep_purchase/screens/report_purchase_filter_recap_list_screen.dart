import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class ReportPurchaseFilterRecapListScreen extends StatelessWidget {
  final ReportPurchaseController _reportPurchaseController = Get.put(ReportPurchaseController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ReportPurchaseController(),
      builder: (_) {
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
                                    controller: TextEditingController(text: "${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportPurchase.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportPurchase.dateEnd.toString()))}"),
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
                                      initialFirstDate: ModelReportPurchase.dateStart,
                                      initialLastDate: ModelReportPurchase.dateEnd,
                                      // initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                                      firstDate: new DateTime(2020, 12, 26),
                                      lastDate: new DateTime.now(),
                                      locale: const Locale("id","ID"),
                                    );
                                    if (picked != null && picked.length == 2) {
                                      _reportPurchaseController.setDate(picked, 'dateRange');
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
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 24),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          width: double.infinity,
                          child: Text(
                            "Status",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                for (var item in ModelReportPurchase.getPurchaseStatus)
                                  WidgetSpan(
                                    child: InkWell(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 8, right: 8),
                                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: _.filterPurchaseStatus.contains(item['id']) == false ? ColorTheme.primary : Colors.black26, 
                                            width: 1
                                          ),
                                          color: _.filterPurchaseStatus.contains(item['id']) == false ? ColorsBase.primary[50] : Colors.white,
                                        ),
                                        child: Text(
                                          TextTransform.title(item['name']),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: _.filterPurchaseStatus.contains(item['id']) == false ? ColorTheme.primary : Colors.black38,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        _reportPurchaseController.setFilterPurchaseStatus(item['id']);
                                      },
                                    ),
                                  )
                              ]
                            ),
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
