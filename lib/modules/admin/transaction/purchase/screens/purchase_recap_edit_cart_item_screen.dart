import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class PurchaseRecapEditCartItemScreen extends StatelessWidget {
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  final item;
  final index;

  PurchaseRecapEditCartItemScreen(
    this.item,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController _valItemQty = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['qty'].toString())));
    TextEditingController _valItemPrice = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['price'])));
    TextEditingController _valItemDiscount = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['discount'])));
    return Container(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
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
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text(
                          item['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "Harga Jual Terakhir",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(item['price_sell_old'])),
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "Harga Jual Terkini",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                      fontStyle: FontStyle.italic,
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
                                                // color: Colors.black54
                                              ),
                                            );
                                          }
                                        ),
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
          Container(
            margin: EdgeInsets.only(top: 6),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
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
                                color: Colors.blue,
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
                  flex: 2,
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
                            color: Colors.green,
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
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    child: Icon(
                      Mdi.pencil,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () async {
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
                                    margin: EdgeInsets.only(bottom: 24),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: _valItemQty,
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
                                              border: OutlineInputBorder(),
                                              hintText: item['qty'].toString(),
                                              labelText: 'Kuantitas',
                                              contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12),
                                            ),
                                            onTap: () async => _valItemQty.selection = TextSelection(baseOffset: 0, extentOffset: _valItemQty.value.text.length),
                                            onChanged: (val) async{
                                              // ignore: await_only_futures
                                              _purchaseController.setNewQtyCart(item, val);
                                              if (val.length < 1) {
                                                _valItemQty = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(item['qty']));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 24),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: _valItemPrice,
                                            textAlign: TextAlign.right,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CurrencyTextInputFormatter(
                                                locale: 'id',
                                                decimalDigits: 2,
                                                symbol: '',
                                              )
                                            ],
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: item['price'].toString(),
                                              labelText: 'Harga',
                                              contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12),
                                            ),
                                            onTap: () async => _valItemPrice.selection = TextSelection(baseOffset: 0, extentOffset: _valItemPrice.value.text.length),
                                            onChanged: (val) async{
                                              _purchaseController.setNewPricePurchase(item, val);
                                              if (val.length < 1) {
                                                _valItemPrice = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['price'])));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 24),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: _valItemDiscount,
                                            textAlign: TextAlign.right,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CurrencyTextInputFormatter(
                                                locale: 'id',
                                                decimalDigits: 2,
                                                symbol: '',
                                              )
                                            ],
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: item['discount'].toString(),
                                              labelText: 'Diskon (%)',
                                              contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12),
                                            ),
                                            onTap: () => _valItemDiscount.selection = TextSelection(baseOffset: 0, extentOffset: _valItemDiscount.value.text.length),
                                            onChanged: (val) async{
                                              _purchaseController.setDiscountPerItem(item, val);
                                              if (val.length < 1) {
                                                _valItemDiscount = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['discount'])));
                                              }
                                            },
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
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}