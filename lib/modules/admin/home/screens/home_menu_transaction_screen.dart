import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:apotik_pulosari/modules/admin/home/controllers/home_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/screens/closing_cashier_recap_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/return/screens/return_recap_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_credit/screens/sales_credit_recap_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/screens/sales_lab_recap_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_recap_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/screens/sales_netto_recap_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/screens/sales_recipe_recap_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_regular/screens/sales_regular_recap_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class HomeMenuTransactionScreen extends StatelessWidget {
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
                                    "Penjualan",
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
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .08),
                      offset: Offset(0, -4),
                      blurRadius: 40,
                    ),
                  ],
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
                                    Mdi.cashRegister,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Reguler",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () async {
                            Get.to(SalesRegularRecapScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                    Mdi.nutrition,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Resep",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(SalesRecipeRecapScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                    Mdi.bowlMix,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Racik",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(SalesMixRecapScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                    Mdi.flask,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Lab",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(SalesLabRecapScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                    Mdi.scale,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Netto",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(SalesNettoRecapScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                    Mdi.creditCardOutline,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Kredit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(SalesCreditRecapScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                    Mdi.cartArrowUp,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Retur",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(ReturnRecapScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                    Mdi.doorClosedLock,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "Tutup Kasir",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Get.to(ClosingCashierRecapScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}