
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_history_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_history_detail_stock_opname_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportItemCardHistoryDataScreen extends StatelessWidget {
  final _reportItemCardController = Get.put(ReportItemCardController());
  final data;
  final index;

  ReportItemCardHistoryDataScreen(
    this.data,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: data['title_id'] == 'stock_opname' ? ColorsBase.secondary[100] : (index+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.only(top:8, bottom: 8, left: 16, right: 8),
                                  height: 56,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: ColorsBase.primary[100]
                                      ),
                                      bottom: BorderSide(
                                        color: ColorsBase.primary[100]
                                      ),
                                    )
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.parse(data['date'])).toString(),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          data['title_name'],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontStyle: FontStyle.italic
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   flex: 2,
                              //   child: Container(
                              //     width: 18,
                              //     height: 18,
                              //     child: FlatButton(
                              //       padding: EdgeInsets.all(0),
                              //       child: Icon(
                              //         Mdi.informationOutline,
                              //         color: ColorTheme.secondary,
                              //         size: 18,
                              //       ),
                              //       onPressed: () async {
                              //         print(data);
                              //         // ignore: await_only_futures
                              //         await _reportItemCardController.readHistoryStockDetail(data['transactions_id'], data['title_id']);
                              //         if(data['title_id'] != 'stock_opname') {
                              //           Get.to(ReportItemCardHistoryDetailScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                              //         } else {
                              //           Get.to(ReportItemCardHistoryDetailStockOpnameScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                              //         }
                              //       },
                              //     )
                              //   ),
                              // ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(top:8, bottom: 8, left: 16, right: 16),
                                  height: 56,
                                  alignment: Alignment.centerRight,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: ColorsBase.primary[100]
                                      ),
                                      bottom: BorderSide(
                                        color: ColorsBase.primary[100]
                                      ),
                                    )
                                  ),
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(data['stock_in']),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(top:8, bottom: 8, left: 16, right: 16),
                                  height: 56,
                                  alignment: Alignment.centerRight,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: ColorsBase.primary[100]
                                      ),
                                      bottom: BorderSide(
                                        color: ColorsBase.primary[100]
                                      ),
                                    )
                                  ),
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(data['stock_out']),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorTheme.primary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.only(top:8, bottom: 8, left: 16, right: 16),
                                  height: 56,
                                  alignment: Alignment.centerRight,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: ColorsBase.primary[100]
                                      ),
                                    )
                                  ),
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(data['last_stock']),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: data['last_stock'] < 0 ? Colors.red : data['last_stock'] == 0 ? Colors.black54 : Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          ],
        )
      ),
      onTap: () async{
        // ignore: await_only_futures
        await _reportItemCardController.readHistoryStockDetail(data['transactions_id'], data['title_id']);
        if(data['title_id'] != 'stock_opname') {
          Get.to(ReportItemCardHistoryDetailScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        } else {
          Get.to(ReportItemCardHistoryDetailStockOpnameScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        }
      },
    );
  }
}