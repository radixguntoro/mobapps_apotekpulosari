import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_netto_tab_paid_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_netto_tab_recap_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportSalesFilterNettoScreen extends StatelessWidget {
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.close(null);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Filter",
              style: TextStyle(
                color: Colors.black87,
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
          backgroundColor: Colors.white,
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
        body: GetBuilder(
          init: ReportSalesController(),
          builder: (_) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Divider(
                    height: 0,
                  ),
                  Container(
                    child: DefaultTabController(
                      initialIndex: _.filterNettoState,
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                            ),
                            height: 56,
                            // padding: EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                            child: TabBar(
                              isScrollable: true,
                              unselectedLabelColor: ColorTheme.third,
                              labelColor: ColorTheme.primary,
                              // indicatorSize: TabBarIndicatorSize.label,
                              indicator: BoxDecoration(
                                // borderRadius: BorderRadius.circular(8),
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorTheme.primary, 
                                    width: 2
                                  )
                                ),
                                color: ColorsBase.primary[50]
                              ),
                              // labelPadding: EdgeInsets.only(left: 8, right: 8),
                              tabs: [
                                Tab(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(8),
                                      // border: Border.all(color: ColorTheme.third, width: 1)
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Rekap",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(8),
                                      // border: Border.all(color: ColorTheme.third, width: 1)
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Pelunasan",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              onTap: (value) {
                                _reportSalesController.setTabFilterNettoState(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          _.filterNettoState == 0 ? ReportSalesFilterNettoTabRecapScreen() :
                          _.filterNettoState == 1 ? ReportSalesFilterNettoTabPaidScreen() :
                          Container()
                        ],
                      )
                    ),
                  ),
                ],
              ),
            );
          }
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.all(16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 48,
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
                    margin: EdgeInsets.only(right: 8),
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
                _reportSalesController.readFirst();
                Get.close(null);
              },
            ),
          ),
        ),
      ),
    );
  }
}
