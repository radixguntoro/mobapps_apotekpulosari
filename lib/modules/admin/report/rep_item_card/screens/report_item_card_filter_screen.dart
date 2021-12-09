import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_filter_history_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_filter_stock_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_filter_stock_out_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportItemCardFilterScreen extends StatelessWidget {
  final ReportItemCardController _reportItemCardController = Get.put(ReportItemCardController());
  final state;

  ReportItemCardFilterScreen(
    this.state,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Filter",
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
            child: FlatButton(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Icon(
                Mdi.refresh,
                size: 24,
              ),
              onPressed: () async {
                _reportItemCardController.setResetFilter();
              },
            ),
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
            state == 'history_list' ? ReportItemCardFilterHistoryListScreen('history_list') :
            state == 'stock_list' ? ReportItemCardFilterStockListScreen('stock_list') :
            state == 'stock_out_in' ? ReportItemCardFilterStockOutInScreen('stock_out_in') :
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        color: ColorsBase.primary[10],
        child: GetBuilder(
          init: ReportItemCardController(),
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
                        child: Text(
                          "Terapkan",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    switch (state) {
                      case 'history_list':
                        _reportItemCardController.readHistoryStockList();
                        break;
                      case 'stock_list':
                        _reportItemCardController.readItemStockList();
                        break;
                      case 'stock_out_in':
                        _reportItemCardController.readItemStockOutInList();
                        break;
                      default:
                    }
                    Get.close(null);
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
