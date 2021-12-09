import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/admin/master/item/controllers/item_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ItemFormDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _itemController = Get.put(ItemController());
    TextEditingController _valQtyTotal = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelItem.qtyTotal.toString())));
    TextEditingController _valQtyMin = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelItem.qtyMin.toString())));
    TextEditingController _valPricePurchase = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelItem.tabletPricePurchase));
    TextEditingController _valPriceSell = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelItem.tabletPriceSell.toString())));

    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Total Kuantitas",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12
                              ),
                            )
                          ),
                          Container(
                            child: TextFormField(
                              controller: _valQtyTotal,
                              enabled: false,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "0",
                                contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CurrencyTextInputFormatter(
                                  locale: 'id',
                                  decimalDigits: 0,
                                  symbol: '',
                                )
                              ],
                              onTap: () => _valQtyTotal.selection = TextSelection(baseOffset: 0, extentOffset: _valQtyTotal.value.text.length),
                              onChanged: (val) => {
                                ModelItem.qtyTotal = int.parse(val.replaceAll('.','')),
                                if (val.length < 1) {
                                  _valQtyTotal = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelItem.qtyTotal.toString())))
                                }
                              },
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Min. Kuantitas",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12
                              ),
                            )
                          ),
                          Container(
                            child: TextFormField(
                              controller: _valQtyMin,
                              enabled: false,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: "0",
                                contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CurrencyTextInputFormatter(
                                  locale: 'id',
                                  decimalDigits: 0,
                                  symbol: '',
                                )
                              ],
                              onTap: () => _valQtyMin.selection = TextSelection(baseOffset: 0, extentOffset: _valQtyMin.value.text.length),
                              onChanged: (val) => {
                                ModelItem.qtyMin = int.parse(val.replaceAll('.','')),
                                if (val.length < 1) {
                                  _valQtyMin = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelItem.qtyMin.toString())))
                                }
                              },
                            )
                          ),
                        ],
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
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Harga Beli",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    child: GetBuilder(
                      init: ItemController(),
                      builder: (_) {
                        return TextFormField(
                          keyboardType: TextInputType.number,
                          enabled: ModelAuth.permission != 99 && ModelAuth.permission != 1 ? false : true,
                          initialValue: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelItem.tabletPriceSell.toString())),
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
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),                 
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onTap: () async => _valPriceSell.selection = TextSelection(baseOffset: 0, extentOffset: _valPriceSell.value.text.length),
                          onChanged: (val) async{
                            _itemController.calcPricePurchase(val);
                          },
                        );
                      },
                    )
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
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Keuntungan (%)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    child: GetBuilder(
                      init: ItemController(),
                      builder: (_) {
                        return TextFormField(
                          keyboardType: TextInputType.number,
                          enabled: false,
                          initialValue: ModelItem.tabletProfitPercent.round().toString(),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "0",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),   
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CurrencyTextInputFormatter(
                              locale: 'id',
                              decimalDigits: 0,
                              symbol: '',
                            )
                          ],
                          onChanged: (val) {
                            ModelItem.tabletProfitPercent = val.isEmpty ? 0 : int.parse(val.replaceAll(".",""));
                          },
                        );
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
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Harga Jual",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    child: GetBuilder(
                      init: ItemController(),
                      builder: (_) {
                        return TextFormField(
                          controller: _valPricePurchase,
                          textAlign: TextAlign.right,
                          enabled: false,
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "0",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),   
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CurrencyTextInputFormatter(
                              locale: 'id',
                              decimalDigits: 0,
                              symbol: '',
                            )
                          ],
                          onChanged: (val) {
                            // ModelItem.tabletPricePurchase = double.parse(val.replaceAll('.', ''));
                          },
                        );
                      },
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}