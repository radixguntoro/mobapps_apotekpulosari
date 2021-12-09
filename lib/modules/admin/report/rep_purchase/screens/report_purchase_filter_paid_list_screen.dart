import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_autocomplete_supplier_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class ReportPurchaseFilterPaidListScreen extends StatelessWidget {
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
                    margin: EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Tanggal Pelunasan",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GetBuilder(
                                  init: ReportPurchaseController(),
                                  builder: (_) {
                                    ModelReportPurchase.dateStart = ModelReportPurchase.dateStart == null ? DateTime.now() : ModelReportPurchase.dateStart;
                                    ModelReportPurchase.dateEnd = ModelReportPurchase.dateEnd == null ? DateTime.now() : ModelReportPurchase.dateEnd;
                                    return Container(
                                      child: TextFormField(
                                        controller: TextEditingController(text: "${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(ModelReportPurchase.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(ModelReportPurchase.dateEnd.toString()))}"),
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
                                    );
                                  }
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
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Supplier",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GetBuilder(
                                  init: ReportPurchaseController(),
                                  builder: (_) {
                                    return Container(
                                      child: TextFormField(
                                        controller: TextEditingController(text: ModelReportPurchase.supplierPersonsName),
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
                                          showSearch(context: context, delegate: ReportPurchaseAutoCompleteSupplierScreen());
                                        },
                                      ),
                                    );
                                  }
                                ),
                              ),
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
