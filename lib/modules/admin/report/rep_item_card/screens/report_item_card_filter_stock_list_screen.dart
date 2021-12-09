import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ReportItemCardFilterStockListScreen extends StatelessWidget {
  final ReportItemCardController _reportItemCardController = Get.put(ReportItemCardController());
  final DateTime setDate = DateTime.now();
  final state;

  ReportItemCardFilterStockListScreen(
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
                            "Tanggal",
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
                                    controller: TextEditingController(text: "${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportItemCard.dateStart.toString()))}"),
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
                                    final DateTime picked = await showDatePicker(
                                      context: context,
                                      initialDate: ModelReportItemCard.dateStart,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2025),
                                      cancelText: "Tutup",
                                      confirmText: "Pilih",
                                      builder: (context, child) {
                                        return Theme(
                                          data: ThemeData(
                                            fontFamily: 'Montserrat',
                                            colorScheme: ColorScheme.light(
                                              primary: ColorTheme.primary,
                                            ),
                                            buttonTheme: ButtonThemeData(
                                              textTheme: ButtonTextTheme.primary
                                            ),
                                          ),
                                          child: child,
                                        );
                                      },
                                    );
                                    if (picked != null) {
                                      _reportItemCardController.setDate(picked, 'dateSingle');
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
                    margin: EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Kategori",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                              children: ModelReportItemCard.filterCategory.map((item) => 
                                WidgetSpan(
                                  child: InkWell(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 8, right: 8),
                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: resp.filterCategory.contains(item['id']) == false ? ColorTheme.primary : Colors.black26, 
                                          width: 1
                                        ),
                                        color: resp.filterCategory.contains(item['id']) == false ? ColorsBase.primary[50] : Colors.white,
                                      ),
                                      child: Text(
                                        item['name'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: resp.filterCategory.contains(item['id']) == false ? ColorTheme.primary : Colors.black38,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      _reportItemCardController.setFilterCategory(item['id']);
                                    },
                                  ),
                                )
                              ).toList()
                            ),
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
