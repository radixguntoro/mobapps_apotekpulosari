// import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/auth/screens/account_profile_screen.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_sales_credit_per_day_screen.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_sales_lab_per_day_screen.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_sales_mix_per_day_screen.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_sales_netto_per_day_screen.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_sales_recipe_per_day_screen.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_sales_regular_per_day_screen.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_total_asset_screen.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_total_percentage_screen.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_total_purchase_screen.dart';
import 'package:apotik_pulosari/modules/admin/home/controllers/home_controller.dart';
import 'package:apotik_pulosari/modules/admin/home/models/model_home.dart';
import 'package:apotik_pulosari/modules/admin/home/screens/home_menu_inventory_screen.dart';
import 'package:apotik_pulosari/modules/admin/home/screens/home_menu_master_screen.dart';
import 'package:apotik_pulosari/modules/admin/home/screens/home_menu_report.dart';
import 'package:apotik_pulosari/modules/admin/home/screens/home_menu_transaction_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/user/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdi/mdi.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  final DashboardController _dashboardController = Get.put(DashboardController());
  final UserController _userController = Get.put(UserController());
  final GetStorage box = GetStorage();
  final String username;
  final int permission;
  final int personsId;

  HomeScreen(
    this.username, 
    this.permission, 
    this.personsId
  );
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                                  "Apotek Pulosari",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                              automaticallyImplyLeading: false,
                            ),
                          ),
                          Container(
                            child: GetBuilder(
                              init: HomeController(),
                              builder: (_) {
                                return InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 48,
                                          height: 48,
                                          margin: EdgeInsets.only(right: 16),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white24,
                                          ),
                                          child: Icon(
                                            Mdi.face,
                                            color: Colors.white,
                                            size: 42,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: EdgeInsets.only(bottom: 6),
                                                  child: Text(
                                                    "Pengguna",
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: EdgeInsets.only(bottom: 16),
                                                  child: Text(
                                                    TextTransform.title(ModelAuth.username),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w700
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    // Get.to(AccountProfileScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed));
                                    // _userController.readDetail();
                                    // _authController.signOut();
                                    // Get.offAll(Wrapper());
                                  },
                                );
                              }
                            ),
                          )
                        ],
                      ),
                    ),
                  ), 
                ]
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 234),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                color: Colors.white,
              ),
              child: RefreshIndicator(
                onRefresh: () async { 
                  _dashboardController.readTotalAsset();
                  _dashboardController.readTransactionPerDay();
                },
                child: GetBuilder(
                  init: DashboardController(),
                  builder: (_) {
                    return ListView(
                      padding: EdgeInsets.only(top: 88, bottom: 104, left: 16, right: 16),
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DashboardTotalPercentageScreen(),
                              DashboardTotalPurchaseScreen(),                        
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DashboardSalesRegularPerDayScreen(),
                              DashboardSalesRecipePerDayScreen(),                        
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DashboardSalesMixPerDayScreen(),
                              DashboardSalesLabPerDayScreen(),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DashboardSalesNettoPerDayScreen(),
                              DashboardSalesCreditPerDayScreen(),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 152),
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .16),
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: DashboardTotalAssetScreen()
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                child: GetBuilder(
                  init: HomeController(),
                  builder: (_) { 
                    return Container(
                      width: size.width,
                      color: Colors.transparent,
                      // height: 80,
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(
                              size.width,
                              80
                            ),
                            painter: BNBCustomPainter(),
                          ),
                          Center(
                            heightFactor: 0.72,
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorTheme.primary.withOpacity(0.56),
                                    offset: Offset(0, 4),
                                    blurRadius: 8,
                                  ),
                                ],
                                border: Border.all(
                                  width: ModelHome.setPos == 2 ? 0 : 3,
                                  color: ModelHome.setPos == 2 ? Colors.transparent: ColorTheme.primary,
                                ),
                                gradient: LinearGradient(
                                  colors: ModelHome.setPos == 2 ? [ColorTheme.primary, ColorTheme.primarySec] : [Colors.grey[200], Colors.grey[100]],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                              ),
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                                ),
                                child: Icon(
                                  Mdi.cashRegister,
                                  color: ModelHome.setPos == 2 ? Colors.white : ColorTheme.primary,
                                ),
                                onPressed: () {
                                  _homeController.setPos(2);
                                  Get.to(HomeMenuTransactionScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            height: 64,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: size.width*0.20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),
                                          ),
                                          padding: EdgeInsets.all(0),
                                          child: Icon(
                                            ModelHome.setPos == 0 ? Mdi.layers : Mdi.layersOutline,
                                            color: ModelHome.setPos == 0 ? Colors.white : Colors.white60,
                                          ), 
                                          onPressed: () { 
                                            _homeController.setPos(0);
                                            Get.to(HomeMenuMasterScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Master",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: ModelHome.setPos == 0 ? Colors.white : Colors.white60
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width*0.20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),
                                          ),
                                          padding: EdgeInsets.all(0),
                                          child: Icon(
                                            ModelHome.setPos == 1 ? Mdi.cube : Mdi.cubeOutline,
                                            color: ModelHome.setPos == 1 ? Colors.white : Colors.white60,
                                          ), 
                                          onPressed: () { 
                                            _homeController.setPos(1);
                                            Get.to(HomeMenuInventoryScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Inventori",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: ModelHome.setPos == 1 ? Colors.white : Colors.white60
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width*0.20,
                                ),
                                Container(
                                  width: size.width*0.20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),
                                          ),
                                          padding: EdgeInsets.all(0),
                                          child: Icon(
                                            ModelHome.setPos == 3 ? Mdi.chartLineStacked : Mdi.chartLine,
                                            color: ModelHome.setPos == 3 ? Colors.white : Colors.white60,
                                          ), 
                                          onPressed: () { 
                                            Get.to(HomeMenuReportScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                                            _homeController.setPos(3);
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Laporan",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: ModelHome.setPos == 3 ? Colors.white : Colors.white60
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width*0.20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(50)),
                                          ),
                                          padding: EdgeInsets.all(0),
                                          child: Icon(
                                            ModelHome.setPos == 4 ? Mdi.accountCircle : Mdi.accountCircleOutline,
                                            color: ModelHome.setPos == 4 ? Colors.white : Colors.white60,
                                          ), 
                                          onPressed: () { 
                                            _homeController.setPos(4);
                                            Get.to(AccountProfileScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed));
                                            _userController.readDetail();
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Akun",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: ModelHome.setPos == 4 ? Colors.white : Colors.white60
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..shader = ui.Gradient.linear(
      Offset(1,0),
      Offset(-1,0),
      [
        ColorTheme.primary, ColorTheme.primarySec
      ],
    );
    // Paint paint = Paint()..color = ColorTheme.primary..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60, 20), radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint); 
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}