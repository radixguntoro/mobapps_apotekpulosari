
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_checkout_detail_screen.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class PurchaseCheckoutItemScreen extends StatelessWidget {
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  final item;
  final index;

  PurchaseCheckoutItemScreen(
    this.item,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController _valItemPriceSell = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['tablet_price_sell'].toString())));
    TextEditingController _valItemPriceSellOld = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['price_sell_old'].toString())));
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (index+1) % 2 == 0 ? Colors.white : Colors.grey[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Icon(
                    Mdi.pill,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: RichText(
                          textScaleFactor: MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: item['name'].toUpperCase(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Montserrat'
                                ),
                              ),
                              WidgetSpan(
                                child: Container(
                                  margin: EdgeInsets.only(left: 4),
                                  width: 18,
                                  height: 18,
                                  child: FlatButton(
                                    padding: EdgeInsets.all(0),
                                    child: Icon(
                                      Mdi.informationOutline,
                                      color: ColorTheme.secondary,
                                      size: 18,
                                    ),
                                    onPressed: () => {
                                      _purchaseController.readDetailMedicineId(item['medicines_items_id']),
                                      Get.to(PurchaseCheckoutDetailScreen(item), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),)
                                    },
                                  )
                                ),
                              ),
                            ]
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "Harga Jual Terakhir",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(item['price_sell_old'])),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                    ),
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
                                    "Harga Jual Terkini",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 8),
                                        child: GetBuilder(
                                          init: PurchaseController(),
                                          builder: (resp) {
                                            return Text(
                                              NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(item['tablet_price_sell'].toString())),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600
                                                // color: Colors.black54
                                              ),
                                            );
                                          }
                                        ),
                                      ),
                                      InkWell(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Mdi.circleEditOutline,
                                              size: 18,
                                              color: Colors.black54,
                                            ),
                                          ],
                                        ),
                                        onTap: () => {
                                          Get.bottomSheet(
                                            Container(
                                              // height: 336,
                                              padding: EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight: Radius.circular(24),
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: GetBuilder(
                                                init: PurchaseController(),
                                                builder: (resp) {
                                                  return ListView(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(bottom: 16),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(bottom: 6),
                                                              child: Text(
                                                                "Harga Jual Terakhir",
                                                                style: TextStyle(
                                                                  color: Colors.black54,
                                                                  fontSize: 12
                                                                ),
                                                              )
                                                            ),
                                                            Container(
                                                              child: TextFormField(
                                                                keyboardType: TextInputType.number,
                                                                controller: _valItemPriceSellOld,
                                                                textAlign: TextAlign.right,
                                                                enabled: false,
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter.digitsOnly,
                                                                  CurrencyTextInputFormatter(
                                                                    locale: 'id',
                                                                    decimalDigits: 0,
                                                                    symbol: '',
                                                                  )
                                                                ],
                                                                decoration: InputDecoration(                
                                                                  hintText: "0",
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
                                                                "Harga Jual Terkini",
                                                                style: TextStyle(
                                                                  color: Colors.black54,
                                                                  fontSize: 12
                                                                ),
                                                              )
                                                            ),
                                                            Container(
                                                              child: TextFormField(
                                                                keyboardType: TextInputType.number,
                                                                controller: _valItemPriceSell,
                                                                textAlign: TextAlign.right,
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter.digitsOnly,
                                                                  CurrencyTextInputFormatter(
                                                                    locale: 'id',
                                                                    decimalDigits: 0,
                                                                    symbol: '',
                                                                  )
                                                                ],
                                                                decoration: InputDecoration(      
                                                                  hintText: "0",
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
                                                                onTap: () async => _valItemPriceSell.selection = TextSelection(baseOffset: 0, extentOffset: _valItemPriceSell.value.text.length),
                                                                onChanged: (val) async{
                                                                  _purchaseController.setNewPriceSell(item, val);
                                                                  if (val.length < 1) {
                                                                    _valItemPriceSell = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['tablet_price_sell'])));
                                                                  }
                                                                },
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
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
                                                                  "Tutup",
                                                                  style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.w600
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          onPressed: () async {
                                                            Get.close(null);
                                                          },
                                                        ),
                                                      ),
                                                    ]
                                                  );
                                                }
                                              ),
                                            ),
                                          ),
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Kuantitas",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      GetBuilder(
                        init: PurchaseController(),
                        builder: (resp) {
                          return Container(
                            child: Text(
                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(item['qty'].toString()))),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          );
                        }
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Harga",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      GetBuilder(
                        init: PurchaseController(),
                        builder: (resp) {
                          return Container(
                            child: Text(
                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(item['price']))),
                              style: TextStyle(
                                color: ColorTheme.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          );
                        }
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Diskon (%)",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['discount'])),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Subtotal",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      GetBuilder(
                        init: PurchaseController(),
                        builder: (resp) {
                          return Container(
                            child: Text(
                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['subtotal'].toString())),
                              // NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(item['price']) * item['qty'])),
                              style: TextStyle(
                                color: ColorTheme.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          );
                        }
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}