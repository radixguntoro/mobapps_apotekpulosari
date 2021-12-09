
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/screens/sales_netto_recap_return_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/screens/sales_netto_stock_adjustments_form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class SalesNettoStockAdjustmentsItemScreen extends StatelessWidget {
  final item;
  final data;
  final index;

  SalesNettoStockAdjustmentsItemScreen(
    this.item,
    this.data,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    String showBtnReturn = "show_all";

    if(int.parse(item['qty_adjustments'].toString()) > 0 && (int.parse(item['qty'].toString()) - int.parse(item['qty_adjustments'].toString())) == 0) {
      showBtnReturn = "show_detail";
    } else if(int.parse(item['qty_adjustments'].toString()) == 0) {
      showBtnReturn = "show_create";
    } else {
      showBtnReturn = "show_all";
    }

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: [],
      secondaryActions: (ModelAuth.permission != 99 && ModelAuth.permission != 1) || data['status'] == 'paid' ? [] : showBtnReturn == 'show_all' ? [
        Container(
          height: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Icon(
                    Mdi.informationOutline,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "Detil Retur",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w100
                  ),
                )
              ],
            ),
            onPressed: () async {
              print(item.toString());
              Get.to(SalesNettoRecapReturnDetailScreen(data, item), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed));
            },
          ),
        ),
        Container(
          height: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.cyan[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Icon(
                    Mdi.circleEditOutline,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Penyesuaian Stok",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w100
                  ),
                )
              ],
            ),
            onPressed: () async {
              Get.off(SalesNettoStockAdjustmentsFormScreen(item, data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
            },
          ),
        ),
      ] : showBtnReturn == 'show_create' ? [
        Container(
          height: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.cyan[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Icon(
                    Mdi.circleEditOutline,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Penyesuaian Stok",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            onPressed: () async {
              Get.off(SalesNettoStockAdjustmentsFormScreen(item, data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
            },
          ),
        ),
      ] : showBtnReturn == 'show_detail' ? [
        Container(
          height: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Mdi.informationOutline,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "Detil Retur",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            onPressed: () async {
              print(item.toString());
              Get.to(SalesNettoRecapReturnDetailScreen(data, item), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed));
            },
          ),
        ),
      ] : [],
      child: Container(
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
                                  text: item['medicine']['item']['name'].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'
                                  ),
                                ),
                                double.parse(item['qty_return'].toString()) > 0 ?
                                WidgetSpan(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8),
                                    padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                                    child: Text(
                                      "Retur",
                                      style: TextStyle(
                                        color:ColorTheme.danger,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red[100],
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ) : WidgetSpan(child: Container()),
                              ]
                            ),
                          )
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 24),
                                  child: Text(
                                    item['medicine']['item']['category']['name'],
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 10,
                                    ),
                                  )
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "PPN:",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            color: double.parse(item['ppn']) > 0 ? ColorTheme.successColor : ColorTheme.danger,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            double.parse(item['ppn']) > 0 ? Mdi.check : Mdi.close,
                                            color: Colors.white,
                                            size: 14,
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
                            "Harga",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['price'])),
                            style: TextStyle(
                              color: ColorTheme.primary,
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
                            "Diskon (%)",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 1).format(double.parse(item['discount'].toString()) * 100),
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
                            "Kuantitas",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(int.parse(item['qty'].toString()).toString())),
                            style: TextStyle(
                              color: Colors.black,
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
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['subtotal'])),
                            style: TextStyle(
                              color: ColorTheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          ),
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
    );
  }
}