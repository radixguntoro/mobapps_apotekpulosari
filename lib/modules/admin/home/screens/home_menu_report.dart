import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:apotik_pulosari/modules/admin/home/controllers/home_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/screens/report_stock_opname_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class HomeMenuReportScreen extends StatelessWidget {
  final _homeController = Get.put(HomeController());
  final _dashboardController = Get.put(DashboardController());
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _homeController.setPos(99);
        _dashboardController.readTotalAsset();
        _dashboardController.readTransactionPerDay();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorTheme.primary, ColorTheme.primarySec],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 216,
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
                    Positioned(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              child: AppBar(
                                elevation: 0,
                                title: Center(
                                  child: Text(
                                    "Laporan",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                leading: Container(),
                                backgroundColor: Colors.transparent,
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
                                        Mdi.close,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Get.close(null);
                                        _homeController.setPos(99);
                                        _dashboardController.readTotalAsset();
                                        _dashboardController.readTransactionPerDay();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), 
                  ]
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 88),
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                  color: Colors.white,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                    color: Colors.white,
                  ),
                  child: GridView.count(
                    padding: EdgeInsets.all(8),
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsBase.primary[10],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Icon(
                                    Mdi.chartLine,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Lap. Kartu",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "Barang",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(ReportItemCardScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsBase.primary[10],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Icon(
                                    Mdi.chartLine,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Lap.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "Penjualan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(ReportSalesScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsBase.primary[10],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Icon(
                                    Mdi.chartLine,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Lap.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "Pembelian",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(ReportPurchaseScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsBase.primary[10],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Icon(
                                    Mdi.chartLine,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Lap. Stok",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "Opname",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(ReportStockOpnameScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}