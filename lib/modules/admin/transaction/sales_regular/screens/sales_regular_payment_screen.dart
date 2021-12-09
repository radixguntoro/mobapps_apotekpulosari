// import 'package:apotik_pulosari/components/response/response.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_regular/controllers/sales_regular_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_regular/models/model_sales_regular.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_regular/screens/sales_regular_checkout_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_regular/screens/sales_regular_create_screen.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class SalesRegularPaymentScreen extends StatelessWidget {
  final SalesRegularController _salesRegularController = Get.put(SalesRegularController());
  TextEditingController _valDiscount = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesRegular.discount));
  TextEditingController _valPayment = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesRegular.payment));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(SalesRegularCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        _salesRegularController.clearPayment();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Pembayaran",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white
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
                color: Colors.white
              ),
              onPressed: () {
                Get.off(SalesRegularCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                _salesRegularController.clearPayment();
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: GetBuilder(
                          init: SalesRegularController(),
                          builder: (_) {
                            return ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Info Belanja",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16, bottom: 16),
                                  color: Colors.white,
                                  child: DividerDashed(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Subtotal",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12
                                                ),
                                              )
                                            ),
                                            Container(
                                              child: TextFormField(
                                                enabled: false,
                                                keyboardType: TextInputType.number,
                                                controller: TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesRegular.total)),
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  hintText: "0",
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[200]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[300]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[300]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                ),
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter.digitsOnly,
                                                  CurrencyTextInputFormatter(
                                                    locale: 'id',
                                                    decimalDigits: 0,
                                                    symbol: '',
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Potongan",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12
                                                ),
                                              )
                                            ),
                                            Container(
                                              child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: _valDiscount,
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  hintText: "0",
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[200]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                ),
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter.digitsOnly,
                                                  CurrencyTextInputFormatter(
                                                    locale: 'id',
                                                    decimalDigits: 0,
                                                    symbol: '',
                                                  )
                                                ],
                                                onTap: () => _valDiscount.selection = TextSelection(baseOffset: 0, extentOffset: _valDiscount.value.text.length),
                                                onChanged: (val) {
                                                  _salesRegularController.calcDiscount(val);
                                                  if (val.length < 1 || double.parse(val.replaceAll('.','')) > ModelSalesRegular.total) {
                                                    _valDiscount = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesRegular.discount));
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Total",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12
                                                ),
                                              )
                                            ),
                                            Container(
                                              child: TextFormField(
                                                enabled: false,
                                                keyboardType: TextInputType.number,
                                                controller: TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesRegular.grandTotal)),
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  hintText: "0",
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[200]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                ),
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter.digitsOnly,
                                                  CurrencyTextInputFormatter(
                                                    locale: 'id',
                                                    decimalDigits: 0,
                                                    symbol: '',
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16, bottom: 8),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Info Bayar",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16, bottom: 16),
                                  color: Colors.white,
                                  child: DividerDashed(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Tunai",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12
                                                ),
                                              )
                                            ),
                                            Container(
                                              child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: _valPayment,
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  hintText: "0",
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[200]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                ),
                                                inputFormatters: [
                                                  WhitelistingTextInputFormatter.digitsOnly,
                                                  CurrencyTextInputFormatter(
                                                    locale: 'id',
                                                    decimalDigits: 0,
                                                    symbol: '',
                                                  )
                                                ],
                                                onTap: () => _valPayment.selection = TextSelection(baseOffset: 0, extentOffset: _valPayment.value.text.length),
                                                onChanged: (val) {
                                                  _salesRegularController.calcPayment(val);
                                                  if (val.length < 1) {
                                                    _valPayment = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesRegular.payment));
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
                              ],
                            );
                          }
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
          width: MediaQuery.of(context).size.width,
          color: ColorsBase.primary[10],
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 24, bottom: 8, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Text(
                          "Kembali",
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
                            init: SalesRegularController(),
                            builder: (resp) {
                              return Container(
                                child: Text(
                                  NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((ModelSalesRegular.balance)),
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
              Container(
                width: MediaQuery.of(context).size.width,
                child: GetBuilder(
                  init: SalesRegularController(),
                  builder: (resp) {
                    return ModelSalesRegular.payment > 0 && ModelSalesRegular.payment >= ModelSalesRegular.grandTotal ? _buttonEnable(context) : _buttonDisable(context);
                  }
                ),
              ),
            ],
          ),
        ),
      ),
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
                  "Koreksi",
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
            Get.off(SalesRegularCheckoutListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                  "Koreksi",
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
        ),
        onPressed: () async {
          
        },
      ),
    );
  }
}
