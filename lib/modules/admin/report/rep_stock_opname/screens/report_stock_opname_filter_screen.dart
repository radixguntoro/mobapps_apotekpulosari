import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/controllers/report_stock_opname_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/screens/report_stock_opname_filter_item_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportStockOpnameFilterScreen extends StatelessWidget {
  final ReportStockOpnameController _reportStockOpnameController = Get.put(ReportStockOpnameController());
  final state;

  ReportStockOpnameFilterScreen(
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
                _reportStockOpnameController.setResetFilter();
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
            ReportStockOpnameFilterItemListScreen('item_list')
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
                    _reportStockOpnameController.setFilterApply();
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
