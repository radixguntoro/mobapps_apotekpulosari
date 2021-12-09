import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/controllers/sales_netto_controller.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class SalesNettoCartScreen extends StatelessWidget {
  final SalesNettoController _salesNettoController = Get.put(SalesNettoController());
  final item;
  final index;

  SalesNettoCartScreen(
    this.item,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController _valItemQty = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['qty'].toString())));
    TextEditingController _valItemPrice = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['price'])));
    TextEditingController _valItemPriceSell = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['price_sell'].toString())));
    TextEditingController _valItemDiscount = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['discount'])));

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 8),
                                margin: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  item['name'].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Icon(
                                  Mdi.delete,
                                  size: 24,
                                  color: Colors.black54,
                                ),
                                onPressed: () {
                                  _salesNettoController.deleteCart(item['medicines_items_id']);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 8),
                                      margin: EdgeInsets.only(bottom: 6),
                                      child: Text(
                                        item['category'],
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    GetBuilder(
                                      init: SalesNettoController(),
                                      builder: (resp) {
                                        return Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format((double.parse(item['price']))),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      }
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      "PPN",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  GetBuilder(
                                    init: SalesNettoController(),
                                    builder: (resp) {
                                      return Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: double.parse(item['ppn'].toString()) > 0 ? ColorTheme.successColor : ColorTheme.danger,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          double.parse(item['ppn'].toString()) > 0 ? Mdi.check : Mdi.close,
                                          color: Colors.white,
                                          size: 14,
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
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
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
                        init: SalesNettoController(),
                        builder: (resp) {
                          return Container(
                            child: Text(
                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['subtotal'].toString())),
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
                    children: item['status_mix'] == 'mix' ? [] : <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Sisa Stok",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(item['qty_total'])),
                          style: TextStyle(
                            color: int.parse(item['qty_total']) > 0 ? Colors.black : ColorTheme.danger,
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
                          "Kuantitas",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      GetBuilder(
                        init: SalesNettoController(),
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
                Container(
                  width: 32,
                  height: 32,
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      colors: [ColorTheme.third, ColorTheme.thirdSec],
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            color: Colors.white,
                          ),
                          child: GetBuilder(
                            init: SalesNettoController(),
                            builder: (resp) {
                              return ListView(
                                padding: EdgeInsets.all(16),
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 8, bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Kuantitas",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
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
                                              hintText: item['qty'].toString(),
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
                                            onTap: () async => _valItemQty.selection = TextSelection(baseOffset: 0, extentOffset: _valItemQty.value.text.length),
                                            onChanged: (val) async{
                                              // ignore: await_only_futures
                                              _salesNettoController.setQtyCart(item, val);
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
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Harga",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: _valItemPrice,
                                            textAlign: TextAlign.right,
                                            enabled: false,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CurrencyTextInputFormatter(
                                                locale: 'id',
                                                decimalDigits: 2,
                                                symbol: '',
                                              )
                                            ],
                                            decoration: InputDecoration(
                                              hintText: item['price'].toString(),
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
                                        ),
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
                                            "Diskon (%)",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
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
                                              hintText: item['discount'].toString(),
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
                                            onTap: () => _valItemDiscount.selection = TextSelection(baseOffset: 0, extentOffset: _valItemDiscount.value.text.length),
                                            onChanged: (val) async{
                                              _salesNettoController.setDiscountPerItem(item, val);
                                              if (val.length < 1) {
                                                _valItemDiscount = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['discount'])));
                                              }
                                            },
                                          ),
                                        ),
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
                                            "Harga",
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
                                            enabled: false,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CurrencyTextInputFormatter(
                                                locale: 'id',
                                                decimalDigits: 2,
                                                symbol: '',
                                              )
                                            ],
                                            decoration: InputDecoration(
                                              hintText: item['price_sell'].toString(),
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
                                            "PPN",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Stack(
                                                    children: [
                                                      GetBuilder(
                                                        init: SalesNettoController(),
                                                        builder: (_) {
                                                          return TextFormField(
                                                            enabled: false,
                                                            keyboardType: TextInputType.number,
                                                            controller: TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['ppnPrice'].toString()))),
                                                            textAlign: TextAlign.right,
                                                            textAlignVertical: TextAlignVertical.center,
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
                                                                decimalDigits: 2,
                                                                symbol: '',
                                                              )
                                                            ],
                                                          );
                                                        }
                                                      ),
                                                      Positioned(
                                                        // top: 2,
                                                        child: Checkbox(
                                                          value: item['isPPN'],
                                                          onChanged: (bool val) {
                                                            _salesNettoController.setPPNItem(val, item);
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