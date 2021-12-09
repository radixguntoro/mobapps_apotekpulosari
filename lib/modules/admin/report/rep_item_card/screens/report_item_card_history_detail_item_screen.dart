
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_history_ingredients_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class ReportItemCardHistoryDetailItemScreen extends StatelessWidget {
  final item;
  final data;
  final index;
  final ingredient;
  final state;

  ReportItemCardHistoryDetailItemScreen(
    this.item,
    this.data,
    this.index,
    this.ingredient,
    this.state,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: data['id'] == item['id'].toString() ? ColorsBase.primary[50] : (index+1) % 2 == 0 ? Colors.white : Colors.grey[50],
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
                        padding: EdgeInsets.only(bottom: 2),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Container(
                                  child: Text(
                                    item['medicineName'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat'
                                    ),
                                  ),
                                )
                              ),
                              WidgetSpan(
                                child: item['status'] == 'mix' ? Container(
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
                                      print(data['name']),
                                      Get.to(ReportItemCardHistoryIngredientsListScreen(data['name'], ingredient, state), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),)
                                    },
                                  )
                                ) : Container(),
                              )
                            ]
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          item['categoryName'],
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
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
                  flex: 4,
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
                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(item['price']))),
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
                  flex: 4,
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
                Visibility(
                  visible: true,
                  child: Expanded(
                    flex: 4,
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
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['subtotal'].toString())),
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
    );
  }
}