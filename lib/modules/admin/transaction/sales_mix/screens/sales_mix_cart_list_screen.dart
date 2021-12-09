import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/controllers/sales_mix_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/models/model_sales_mix.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_cart_item_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_create_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_ingredients_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SalesMixCartListScreen extends StatelessWidget {
  // final SalesMixController _salesMixController = Get.put(SalesMixController());
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(SalesMixCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Keranjang",
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
                Get.off(SalesMixCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                    color: ColorsBase.secondary.withOpacity(0.24),
                    offset: Offset(0, -4),
                    blurRadius: 8,
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
                  color: ColorTheme.secondary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        margin: EdgeInsets.only(left: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.white24
                                        ),
                                        child: FlatButton(
                                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(right: 6),
                                                child: Icon(
                                                  Mdi.plus,
                                                  size: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Racik",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {
                                            Get.to(SalesMixIngredientsListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                                          },
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24), 
                          topRight: Radius.circular(24)
                        ),
                        color: Colors.white,
                      ),
                      child: GetBuilder(
                        init: SalesMixController(),
                        builder: (_) {
                          return Text(
                            "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelSalesMix.medicineMix.length))} barang",
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
                          init: SalesMixController(),
                          builder: (resp) {
                            if(ModelSalesMix.medicineMix.length > 0) {
                              return ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(0),
                                itemCount: ModelSalesMix.medicineMix.length > 0 ? ModelSalesMix.medicineMix.length : 0,
                                itemBuilder: (context, int i) {
                                  return ModelSalesMix.medicineMix.length > 0 ? SalesMixCartItemScreen(ModelSalesMix.medicineMix[i], i) : Container();
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
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 136,
          color: ColorsBase.primary[10],
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 24, bottom: 8, left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Text(
                          "Total Belanja",
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
                            fontSize: 12,
                            fontWeight: FontWeight.w600
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
                            init: SalesMixController(),
                            builder: (resp) {
                              return Container(
                                child: Text(
                                  NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((ModelSalesMix.total)),
                                  style: TextStyle(
                                    color: ColorTheme.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
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
              GetBuilder(
                init: SalesMixController(),
                builder: (resp) {
                  return ModelSalesMix.medicineMix.length > 0 ? _buttonEnable(context) : _buttonDisable(context);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _emptyCart(context) {
    return Infostate.emptyCart(context);
  }

  Widget _buttonEnable(context) {
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
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "Pembayaran",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Icon(
                Mdi.arrowRight,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () async {
            Get.off(SalesMixPaymentScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
          },
        ),
      ),
    );
  }

  Widget _buttonDisable(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: FlatButton(
          padding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          highlightColor: null,
          splashColor: null,
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
          onPressed: () async {
            
          },
        ),
      ),
    );
  }
}
