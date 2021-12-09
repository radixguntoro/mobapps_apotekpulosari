import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_filter_paid_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_filter_recap_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_filter_supplier_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_filter_supplier_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportPurchaseFilterScreen extends StatelessWidget {
  final ReportPurchaseController _reportPurchaseController = Get.put(ReportPurchaseController());
  final parent;
  final data;
  final state;

  ReportPurchaseFilterScreen(
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
                _reportPurchaseController.setResetFilter();
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
            state == 'recap_list' ? ReportPurchaseFilterRecapListScreen() :
            state == 'supplier_list' ? ReportPurchaseFilterSupplierListScreen() :
            state == 'supplier_detail' ? ReportPurchaseFilterSupplierDetailScreen(parent, data) :
            state == 'paid_list' ? ReportPurchaseFilterPaidListScreen() :
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        color: ColorsBase.primary[10],
        child: GetBuilder(
          init: ReportPurchaseController(),
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
                        _reportPurchaseController.setFilterApply();
                        break;
                      case 'supplier_list':
                        _reportPurchaseController.setFilterApply();
                        break;
                      case 'supplier_detail':
                        _reportPurchaseController.setFilterApplyRecap(parent['id']);
                        break;
                      case 'paid_list':
                        _reportPurchaseController.setFilterApply();
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
