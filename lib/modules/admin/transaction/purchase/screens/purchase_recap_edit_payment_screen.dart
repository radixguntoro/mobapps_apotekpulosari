// import 'package:apotik_pulosari/components/response/response.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/models/model_purchase.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_edit_checkout_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_edit_cart_list_screen.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class PurchaseRecapEditPaymentScreen extends StatelessWidget {
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  TextEditingController _valDiscount = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(ModelPurchase.discount));
  final _paymentStatus = ModelPurchase.getPaymentStatus;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(PurchaseRecapEditCartListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                      Get.off(PurchaseRecapEditCartListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                            "Form",
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 12
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Pembayaran",
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
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: GetBuilder(
                          init: PurchaseController(),
                          builder: (_) {
                            return ListView(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 24),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: TextFormField(
                                                enabled: false,
                                                keyboardType: TextInputType.number,
                                                initialValue: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(ModelPurchase.total),
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "0",
                                                  labelText: 'HPP',
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12)
                                                ),
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter.digitsOnly,
                                                  CurrencyTextInputFormatter(
                                                    locale: 'id',
                                                    decimalDigits: 2,
                                                    symbol: '',
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: _valDiscount,
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "0",
                                                  labelText: 'Potongan',
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12)
                                                ),
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter.digitsOnly,
                                                  CurrencyTextInputFormatter(
                                                    locale: 'id',
                                                    decimalDigits: 2,
                                                    symbol: '',
                                                  )
                                                ],
                                                onTap: () => _valDiscount.selection = TextSelection(baseOffset: 0, extentOffset: _valDiscount.value.text.length),
                                                onChanged: (val) {
                                                  _purchaseController.calcDiscount(val);
                                                  if (val.length < 1) {
                                                    _valDiscount = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(ModelPurchase.discount));
                                                  }
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.green[50],
                                  padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 24),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: TextFormField(
                                                enabled: false,
                                                keyboardType: TextInputType.number,
                                                controller: TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(ModelPurchase.subtotal)),
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "0",
                                                  labelText: 'Subtotal',
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12)
                                                ),
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter.digitsOnly,
                                                  CurrencyTextInputFormatter(
                                                    locale: 'id',
                                                    decimalDigits: 2,
                                                    symbol: '',
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context).size.width,
                                                child: Stack(
                                                  children: [
                                                    GetBuilder(
                                                      init: PurchaseController(),
                                                      builder: (_) {
                                                        return TextFormField(
                                                          enabled: false,
                                                          keyboardType: TextInputType.number,
                                                          controller: TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(ModelPurchase.ppnPrice)),
                                                          textAlign: TextAlign.right,
                                                          textAlignVertical: TextAlignVertical.center,
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(),
                                                            hintText: "0",
                                                            labelText: 'PPN',
                                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                                            contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12)
                                                          ),
                                                          inputFormatters: [
                                                            WhitelistingTextInputFormatter.digitsOnly,
                                                            CurrencyTextInputFormatter(
                                                              locale: 'id',
                                                              decimalDigits: 2,
                                                              symbol: '',
                                                            )
                                                          ],
                                                        );
                                                      }
                                                    ),
                                                    Positioned(
                                                      top: 2,
                                                      child: Checkbox(
                                                        value: ModelPurchase.isPPN,
                                                        onChanged: (bool val) {
                                                          _purchaseController.setPPN(val);
                                                        },
                                                        activeColor: ColorTheme.primary,
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
                                  padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: GetBuilder(
                                          init:PurchaseController(),
                                          builder: (_) {
                                            return InputDecorator(
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 3, bottom: 3, left: 16, right: 12),
                                                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                                hintText: 'Tolong pilih metode',
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                                              ),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  hint: Text("Pilih Metode Pembayaran"),
                                                  value: ModelPurchase.paymentStatus,
                                                  isExpanded: true,
                                                  underline: Container(
                                                    width: double.infinity,
                                                    height: 0,
                                                  ),
                                                  items: _paymentStatus.map((val) {
                                                    return DropdownMenuItem(
                                                      child: Text(val['name']),
                                                      value: val['id'],
                                                    );
                                                  }).toList(),
                                                  onChanged: (val) {
                                                    print(val);
                                                    _purchaseController.setPaymentStatus(val);
                                                  },
                                                ),
                                              ),
                                            );
                                          }
                                        )
                                      ),
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
                      color: Colors.grey[100],
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Text(
                                "Total",
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
                                        NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format((ModelPurchase.grandTotal)),
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
          child: GetBuilder(
            init: PurchaseController(),
            builder: (resp) {
              return ModelPurchase.grandTotal > 0 ? _buttonEnable(context) : _buttonDisable(context);
            }
          )
        ),
      ),
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
        child: Ink(
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
                  "Koreksi",
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
          Get.off(PurchaseRecapEditCheckoutListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        },
      ),
    );
  }

  Widget _buttonDisable(context) {
    return RaisedButton(
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
                "Koreksi",
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
    );
  }
}