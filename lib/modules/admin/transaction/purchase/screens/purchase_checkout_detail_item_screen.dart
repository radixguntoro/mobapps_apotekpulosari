
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class PurchaseCheckoutDetailItemScreen extends StatelessWidget {
  final item;
  final index;

  PurchaseCheckoutDetailItemScreen(
    this.item,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
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
                    Mdi.factoryIcon,
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
                        child: Text(
                          item['tr_purchase']['supplier']['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  tanggal(DateTime.parse(item['tr_purchase']['date']), shortMonth: true),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "No. Faktur:",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: Text(
                                        item['tr_purchase']['invoice_number'],
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "PPN:",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: double.parse(item['tr_purchase']['ppn']) > 0 ? ColorTheme.successColor : ColorTheme.danger,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          double.parse(item['tr_purchase']['ppn']) > 0 ? Mdi.check : Mdi.close,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
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
                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['discount']) * 100),
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
                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['subtotal']) - (double.parse(item['subtotal']) * double.parse(item['discount']))),
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