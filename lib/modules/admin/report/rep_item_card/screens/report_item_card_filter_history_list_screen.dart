import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_autocomplete_item_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class ReportItemCardFilterHistoryListScreen extends StatelessWidget {
  final ReportItemCardController _reportItemCardController = Get.put(ReportItemCardController());
  final DateTime setDate = DateTime.now();
  final state;

  ReportItemCardFilterHistoryListScreen(
    this.state
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Form(
          child: GetBuilder(
            init: ReportItemCardController(),
            builder: (resp) {
              return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(16),
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Periode",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: TextFormField(
                                    controller: TextEditingController(text: "${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportItemCard.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportItemCard.dateEnd.toString()))}"),
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
                                      initialFirstDate: ModelReportItemCard.dateStart,
                                      initialLastDate: ModelReportItemCard.dateEnd,
                                      // initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                                      firstDate: new DateTime(2020, 12, 26),
                                      lastDate: new DateTime.now(),
                                      locale: const Locale("id","ID"),
                                    );
                                    if (picked != null && picked.length == 2) {
                                      _reportItemCardController.setDate(picked, 'dateRange');
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Barang",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    child: TextFormField(
                                      controller: TextEditingController(text: ModelReportItemCard.medicineName),
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: "Cari Barang..",
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
                                  onTap: () async {
                                    ModelReportItemCard.getItem = [];
                                    showSearch(context: context, delegate: ReportItemCardAutoCompleteItemSearchScreen());
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
