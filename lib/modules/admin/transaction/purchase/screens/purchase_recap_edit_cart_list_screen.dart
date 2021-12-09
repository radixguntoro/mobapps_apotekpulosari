// import 'package:apotik_pulosari/components/response/response.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/models/model_purchase.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_edit_cart_item_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_edit_payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class PurchaseRecapEditCartListScreen extends StatelessWidget {
  final PurchaseController _purchaseController = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.close(null);
        _purchaseController.clearData();
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
                                    ModelPurchase.titlePage,
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
                                      Get.close(null);
                                      _purchaseController.clearData();
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
                            ),
                            Container(
                              height: 72,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Daftar",
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 12
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Keranjang Belanja",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                margin: EdgeInsets.only(top: 160),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                  color: Colors.grey[100],
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, .16),
                            offset: Offset(0, -4),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: GetBuilder(
                              init: PurchaseController(),
                              builder: (_) {
                                return Text(
                                  "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelPurchase.getCart.length))} barang",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12
                                  ),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: GetBuilder(
                          init: PurchaseController(),
                          builder: (resp) {
                            if(ModelPurchase.getCart.length > 0) {
                              return ListView.separated(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                itemCount: ModelPurchase.getCart.length > 0 ? ModelPurchase.getCart.length : 0,
                                itemBuilder: (context, int i) {
                                  return ModelPurchase.getCart.length > 0 ? PurchaseRecapEditCartItemScreen(ModelPurchase.getCart[i], i) : Container();
                                },
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                              );
                            } else {
                              return _emptyCart(context);
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Text(
                                "HPP",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                ":",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GetBuilder(
                                  init: PurchaseController(),
                                  builder: (resp) {
                                    return Container(
                                      child: Text(
                                        NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format((ModelPurchase.total)),
                                        style: TextStyle(
                                          color: ColorTheme.primary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[100],
          width: MediaQuery.of(context).size.width,
          child: GetBuilder(
            init: PurchaseController(),
            builder: (resp) {
              return ModelPurchase.getCart.length > 0 ? _buttonEnable(context) : _buttonDisable(context);
            }
          ),
        ),
      ),
    );
  }

  Widget _emptyCart(context) {
    return ListView(
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
                  "Hello!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 32),
                child: Text(
                  "Keranjang masih kosong",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Image(
                  width: MediaQuery.of(context).size.width * .65,
                  image: AssetImage("assets/images/icons/sales_page/cart.png"),
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
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [ColorTheme.primary, ColorTheme.primarySec],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "Kalkulasi",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                Mdi.arrowRight,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onPressed: () async {
          Get.off(PurchaseRecapEditPaymentScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        },
      ),
    );
  }

  Widget _buttonDisable(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        highlightColor: null,
        splashColor: null,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "Pembayaran",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                Mdi.arrowRight,
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
