import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
// import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_export_xls_recap_list_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_closing_cashier_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_item_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_netto_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_recap_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_customer_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportSalesScreen extends StatelessWidget {
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  // final ReportSalesExportXlsRecapListController _reportSalesExportXlsRecapListController = Get.put(ReportSalesExportXlsRecapListController());

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        _reportSalesController.clearData();
        _reportSalesController.setTabState(0);
        _reportSalesController.readFirst();
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
              "Lap. Penjualan",
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
                _reportSalesController.clearData();
                _reportSalesController.setTabState(0);
                _reportSalesController.readFirst();
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
                        length: 5,
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
                                          "Netto",
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
                                          "Pelanggan",
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
                                          "Barang",
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
                                          "Tutup Kasir",
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                onTap: (value) {
                                  final _reportSalesController = Get.put(ReportSalesController());
                                  _reportSalesController.setTabState(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GetBuilder(
                        init: ReportSalesController(),
                        builder: (_) {
                          return Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                ModelReportSales.state == 0 ? ReportSalesRecapListScreen() : 
                                ModelReportSales.state == 1 ? ReportSalesNettoListScreen() : 
                                ModelReportSales.state == 2 ? ReportSalesCustomerListScreen() : 
                                ModelReportSales.state == 3 ? ReportSalesItemListScreen() : 
                                ModelReportSales.state == 4 ? ReportSalesClosingCashierListScreen() :
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
        // floatingActionButton: GetBuilder(
        //   init: ReportSalesController(),
        //   builder: (_) {
        //     return Container(
        //       width: 56,
        //       height: 56,
        //       child: FlatButton(
        //         child: Icon(
        //           Mdi.microsoftExcel,
        //           color: Colors.white,
        //         ),
        //         padding: EdgeInsets.all(0),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(50))
        //         ),
        //         onPressed: () async{
        //           _reportSalesExportXlsRecapListController.exportToExcel();
        //         },
        //       ),
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         boxShadow: [
        //           BoxShadow(
        //             color: Color.fromRGBO(0, 0, 0, .32),
        //             offset: Offset(0, 4),
        //             blurRadius: 8,
        //           ),
        //         ],
        //         gradient: LinearGradient(
        //           colors: [ColorTheme.primary, ColorTheme.primarySec],
        //           begin: Alignment.centerRight,
        //           end: Alignment.centerLeft,
        //         ),
        //       ),
        //     );
        //   }
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
