import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_recap_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class SalesRecipeRecapListScreen extends StatelessWidget {
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  final data;
  final index;

  SalesRecipeRecapListScreen(
    this.data,
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
                    Mdi.receipt,
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
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  data['tr_sales_transactions_id'].toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                  ),
                                ),
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
                                  Mdi.chevronRight,
                                  size: 24,
                                  color: Colors.black54,
                                ),
                                onPressed: () {
                                  // Get.to(SalesRecipeRecapDetailScreen(data), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                                  Get.to(ReportSalesRecapDetailScreen(data), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                                  _reportSalesController.readDetailRecap(data['id'], data['codes_id']);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 24),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 4),
                                  child: Icon(
                                    Mdi.calendar,
                                    size: 18,
                                    color: Colors.black38,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(data['tr_sales']['transaction']['created_at'])),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 4),
                                  child: Icon(
                                    Mdi.account,
                                    size: 18,
                                    color: Colors.black38,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    TextTransform.title(data['tr_sales']['transaction']['cashier']['name']),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ],
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
                          "Total Belanja",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(data['tr_sales']['transaction']['grand_total']))),
                          style: TextStyle(
                            color: ColorTheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
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
                          "Tunai",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(data['payment']))),
                          style: TextStyle(
                            color: ColorTheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
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
                          "Kembali",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(data['balance']))),
                          style: TextStyle(
                            color: ColorTheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
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
      )
    );
  }
}