import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_closing_cashier_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_closing_cashier_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_customer_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_customer_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_item_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_recap_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportSalesFilterScreen extends StatelessWidget {
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  final parent;
  final data;
  final state;

  ReportSalesFilterScreen(
    this.parent,
    this.data,
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
                _reportSalesController.setResetFilter();
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
            state == 'recap_list' ? ReportSalesFilterRecapListScreen(data) :
            state == 'item_list' ? ReportSalesFilterItemListScreen(data) :
            state == 'closing_cashier_list' ? ReportSalesFilterClosingCashierListScreen(data) :
            state == 'closing_cashier_detail' ? ReportSalesFilterClosingCashierDetailScreen(data) :
            state == 'customer_list' ? ReportSalesFilterCustomerListScreen() :
            state == 'customer_detail' ? ReportSalesFilterCustomerDetailScreen(data) :
            Container(),
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
                    switch (state) {
                      case 'recap_list':
                        _reportSalesController.setFilterApply();
                        break;
                      case 'item_list':
                        _reportSalesController.setFilterApply();
                        break;
                      case 'closing_cashier_list':
                        _reportSalesController.setFilterApply();
                        break;
                      case 'closing_cashier_detail':
                        _reportSalesController.setFilterApplyRecap(parent['id'].toString());
                        break;
                      case 'customer_list':
                        _reportSalesController.setFilterApply();
                        break;
                      case 'customer_detail':
                        _reportSalesController.setFilterApplyRecap(parent['id'].toString());
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
