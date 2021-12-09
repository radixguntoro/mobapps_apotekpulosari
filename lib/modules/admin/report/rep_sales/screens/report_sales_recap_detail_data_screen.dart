
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_recap_ingredients_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class ReportSalesRecapDetailDataScreen extends StatelessWidget {
  final data;
  final item;
  final index;

  ReportSalesRecapDetailDataScreen(
    this.data,
    this.item,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (index+1) % 2 == 0 ? Colors.grey[50] : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Text(
                                  item['medicineName'].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ),
                              data['codesId'] == '306' && double.parse(item['ppn']) > 0 ? WidgetSpan(
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                                  child: Text(
                                    "PPN +10%",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorTheme.successColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ) : data['codesId'] == '302' || (data['codesId'] == '303' && item['status'] == 'mix') ? WidgetSpan(
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  width: 20,
                                  height: 20,
                                  child: FlatButton(
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: Icon(
                                      Mdi.informationOutline,
                                      size: 18,
                                      color: ColorTheme.secondary,
                                    ),
                                    onPressed: () {
                                      Get.to(ReportSalesRecapIngredientsScreen(item), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                                    },
                                  ),
                                ),
                              ) : WidgetSpan(
                                child: Container()
                              ),
                            ]
                          ),
                        )
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
                          data['codesId'] == '306' ? NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(item['price']))) : NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(item['price']))),
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
                data['codesId'] == '306' || (data['codesId'] == '303' && item['status'] == 'nonmix') ? Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          (data['codesId'] == '303' && item['status'] == 'nonmix') ? "Diskon" : "Diskon (%)",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          (data['codesId'] == '303' && item['status'] == 'nonmix') ? NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['discount'].toString())) : NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 1).format(double.parse(item['discount'].toString()) * 100),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  ),
                ) : Container(),
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
                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(item['qty'].toString())),
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
                data['codesId'] == '302' || (data['codesId'] == '303' && item['status'] == 'mix') ? Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Tuslah",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['tuslah'].toString())),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  ),
                ) : Container(),
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
                          data['codesId'] == '306' ? NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['subtotal'].toString())) : data['codesId'] == '302' ? NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['subtotal'].toString())) : NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(item['price']) * int.parse(item['qty'].toString()))),
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
              ],
            ),
          ),
        ],
      )
    );
  }
}