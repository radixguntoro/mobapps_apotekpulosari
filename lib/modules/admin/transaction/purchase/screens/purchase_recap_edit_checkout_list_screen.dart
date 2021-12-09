import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/models/model_purchase.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_edit_checkout_item_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_edit_payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class PurchaseRecapEditCheckoutListScreen extends StatelessWidget {
  final PurchaseController _purchaseController = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(PurchaseRecapEditPaymentScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        return true;
      },
      child: Scaffold(
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
                                      Get.off(PurchaseRecapEditPaymentScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                            "Koreksi",
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 12
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Ringkasan Belanja",
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
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Tanggal Faktur",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white60,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            tanggal(ModelPurchase.supplierInvoiceDate, shortMonth: true),
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
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
                      padding: EdgeInsets.only(top:12, bottom: 12, left: 16, right: 16),
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
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              ModelPurchase.supplierName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorTheme.primary,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              "No. Faktur: ${ModelPurchase.supplierInvoiceNumber}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 12
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      color: Colors.grey[100],
                      child: Text(
                        "Total: ${ModelPurchase.getCart.length} barang",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          itemCount: ModelPurchase.getCart.length > 0 ? ModelPurchase.getCart.length : 0,
                          itemBuilder: (context, int index) {
                            return ModelPurchase.getCart.length > 0 ? PurchaseRecapEditCheckoutItemScreen(ModelPurchase.getCart[index], index) : Container();
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "HPP",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(":"),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((ModelPurchase.total)),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Potongan",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(":"),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((ModelPurchase.discount)),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Subtotal",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(":"),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((ModelPurchase.subtotal)),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "PPN",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(":"),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.5 - (8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((ModelPurchase.ppnPrice)),
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Total",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(":"),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: GetBuilder(
                                    init: PurchaseController(),
                                    builder: (resp) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width * 0.5 - (8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((ModelPurchase.grandTotal)),
                                              style: TextStyle(
                                                color: ColorTheme.primary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
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
            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: GetBuilder(
            init: PurchaseController(),
            builder: (_) {
              if (ModelPurchase.isLoading == true) {
                return LoadingSaveForm();
              } else {
                return _bottomNavBar(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _bottomNavBar(context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
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
                  "Simpan",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                Mdi.checkAll,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onPressed: () async {
          Get.close(null);
          // ignore: await_only_futures
          await _purchaseController.updateData();
          _purchaseController.readFirst();
        },
      ),
    );
  }
}
