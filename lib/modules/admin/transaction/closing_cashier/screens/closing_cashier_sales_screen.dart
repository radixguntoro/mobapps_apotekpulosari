import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/controllers/closing_cashier_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/models/model_closing_cashier.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/screens/closing_cashier_create_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/screens/closing_cashier_sales_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ClosingCashierSalesScreen extends StatelessWidget {
  final ClosingCashierController _closingCashierController = Get.put(ClosingCashierController());
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _closingCashierController.readFirst();
        _closingCashierController.clearData();
        Get.close(null);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              "Rekap Penjualan",
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
              onPressed: () {
                _closingCashierController.readFirst();
                _closingCashierController.clearData();
                Get.close(null);
              },
            ),
          ),
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
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 88),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .16),
                    offset: Offset(0, -4),
                    blurRadius: 40,
                  ),
                ],
              ),
              child: RefreshIndicator(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: GetBuilder(
                          init: ClosingCashierController(),
                          builder: (_) {
                            return Text(
                              "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelClosingCashier.getSales.length))} data",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12
                              ),
                            );
                          }
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: GetBuilder(
                            init: ClosingCashierController(),
                            builder: (resp) {
                              if (resp.isLoading == true) {
                                return LoadingShimmerRecap();
                              } else {
                                if(ModelClosingCashier.getSales.length > 0) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(0),
                                    itemCount: ModelClosingCashier.getSales.length > 0 ? ModelClosingCashier.getSales.length : 0,
                                    itemBuilder: (context, int i) {
                                      return ModelClosingCashier.getSales.length > 0 ? ClosingCashierSalesListScreen(ModelClosingCashier.getSales[i], i) : Container();
                                    },
                                  );
                                } else {
                                  return _emptyData(context);
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onRefresh: () async {
                  _closingCashierController.readDataSales();
                  _closingCashierController.readShift();
                },
              ),
            ),
          ]
        ),
        bottomNavigationBar: Container(
          color: ColorsBase.primary[10],
          width: MediaQuery.of(context).size.width,
          child: GetBuilder(
            init: ClosingCashierController(),
            builder: (resp) {
              return ModelClosingCashier.getSales.length > 0 ? _buttonEnable(context) : _buttonDisable(context);
            }
          ),
        ),
      ),
    );
  }
  
  Widget _emptyData(context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        Container(
          margin: EdgeInsets.only(top: 48),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Oops!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Text(
                  "Penjualan masih kosong",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Image(
                  width: 160,
                  image: AssetImage("assets/images/icons/state_page/emptycart.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttonEnable(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Container(
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
                  "Tutup",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Icon(
                Mdi.check,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () async {
            Get.to(ClosingCashierCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
          },
        ),
      ),
    );
  }

  Widget _buttonDisable(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        highlightColor: null,
        splashColor: null,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "Tutup",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Icon(
                Mdi.check,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onPressed: () async {
          
        },
      ),
    );
  }
}
