import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_export_xls_paid_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_export_xls_recap_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_export_xls_supplier_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_paid_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_recap_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_supplier_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportPurchaseScreen extends StatelessWidget {
  final ReportPurchaseController _reportPurchaseController = Get.put(ReportPurchaseController());
  final ReportPurchaseExportXlsRecapController _reportPurchaseExportXlsRecapController = Get.put(ReportPurchaseExportXlsRecapController());
  final ReportPurchaseExportXlsSupplierController _reportPurchaseExportXlsSupplierController = Get.put(ReportPurchaseExportXlsSupplierController());
  final ReportPurchaseExportXlsPaidController _reportPurchaseExportXlsPaidController = Get.put(ReportPurchaseExportXlsPaidController());

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        _reportPurchaseController.clearData();
        _reportPurchaseController.setTabState(0);
        _reportPurchaseController.readFirst();
        Get.close(null);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Lap. Pembelian",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          leading: Container(
            width: 56,
            height: 56,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Icon(
                Mdi.chevronLeft,
                size: 24,
                color: Colors.white,
              ),
              onPressed: () async {
                _reportPurchaseController.clearData();
                _reportPurchaseController.setTabState(0);
                _reportPurchaseController.readFirst();
                Get.close(null);
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            Container(
              child: Container(
                margin: EdgeInsets.only(right: 16, left: 8),
                width: 32,
                height: 32,
                child: null,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorTheme.primary, ColorTheme.primarySec],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -24,
                    left: -MediaQuery.of(context).size.width * .5 + 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/background/circle_fc_lg.png")
                          ),
                        ]
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -MediaQuery.of(context).size.width * .5 + 64,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/background/circle_fc_md.png")
                          ),
                        ]
                      ),
                    ),
                  ),
                  Positioned(
                    top: -24,
                    right: -MediaQuery.of(context).size.width * .5 + 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/background/dounat_fc_lg.png")
                          ),
                        ]
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: -MediaQuery.of(context).size.width * .25,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/background/dounat_fc_sm.png")
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 88),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .08),
                    offset: Offset(0, 4),
                    blurRadius: 40,
                  ),
                ],
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24), 
                    topRight: Radius.circular(24)
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: DefaultTabController(
                        initialIndex: 0,
                        length: 3,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                                color: ColorsBase.primary[10],
                              ),
                              height: 72,
                              padding: EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                              child: TabBar(
                                isScrollable: true,
                                unselectedLabelColor: ColorTheme.third,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorTheme.third
                                ),
                                labelPadding: EdgeInsets.only(left: 8, right: 8),
                                tabs: [
                                  Tab(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: ColorTheme.third, width: 1)
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Rekap",
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: ColorTheme.third, width: 1)
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Tagihan",
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: ColorTheme.third, width: 1)
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Pelunasan",
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Tab(
                                  //   child: Container(
                                  //     padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(8),
                                  //       border: Border.all(color: ColorTheme.third, width: 1)
                                  //     ),
                                  //     child: Align(
                                  //       alignment: Alignment.center,
                                  //       child: Text(
                                  //         "Tahunan",
                                  //         style: TextStyle(
                                  //           fontSize: 12
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                                onTap: (value) {
                                  final _reportPurchaseController = Get.put(ReportPurchaseController());
                                  _reportPurchaseController.setTabState(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GetBuilder(
                        init: ReportPurchaseController(),
                        builder: (_) {
                          return Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                ModelReportPurchase.state == 0 ? ReportPurchaseRecapListScreen() :
                                ModelReportPurchase.state == 1 ?  ReportPurchaseSupplierListScreen() :
                                ModelReportPurchase.state == 2 ?  ReportPurchasePaidListScreen() :
                                Container()
                              ],
                            )
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
        floatingActionButton: GetBuilder(
          init: ReportPurchaseController(),
          builder: (_) {
            if((ModelReportPurchase.getData.length > 0 && _.state == 0) || (ModelReportPurchase.getDataSupplier.length > 1 || _.state == 1) || (ModelReportPurchase.getDataPaid.length > 1 || _.state == 2)) {
              return Container(
                width: 56,
                height: 56,
                child: FlatButton(
                  child: Icon(
                    Mdi.microsoftExcel,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  onPressed: () async{
                    switch (ModelReportPurchase.state) {
                      case 0:
                        _reportPurchaseExportXlsRecapController.exportToExcel();
                        break;
                      case 1:
                        _reportPurchaseExportXlsSupplierController.exportToExcel();
                        break;
                      case 2:
                        _reportPurchaseExportXlsPaidController.exportToExcel();
                        break;
                      default:
                    }
                  },
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .32),
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [ColorTheme.primary, ColorTheme.primarySec],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
              );
            } else {
              return Container();
            }
          }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
