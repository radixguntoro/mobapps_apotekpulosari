import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_recap_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_credit/screens/sales_credit_recap_repayment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class SalesCreditRecapListScreen extends StatelessWidget {
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  final data;
  final index;

  SalesCreditRecapListScreen(
    this.data,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: data['status'] != 'paid' ? [
        Container(
          height: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: ColorTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Icon(
                    Mdi.creditCardCheckOutline,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Lunasi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w100
                  ),
                )
              ],
            ),
            onPressed: () async {
              Get.to(SalesCreditRecapRepaymentScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
            },
          ),
        ),
      ] : [],
      child: Container(
        decoration: BoxDecoration(
          color: (index+1) % 2 == 0 ? Colors.white : Colors.grey[50],
        ),
        child: Container(
          padding: EdgeInsets.all(16),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  data['tr_sales_transactions_id'].toString(),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: 8, right: 8),
                                                padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                                                child: Text(
                                                  data['status'] == 'credit' ? 'Kredit' : data['status'] == 'cod' ? 'C.O.D' : data['status'] == 'consignment' ? 'Konsinyasi' : 'Lunas',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: data['status'] == 'credit' ? ColorTheme.danger : data['status'] == 'cod' ? ColorTheme.warningColor : data['status'] == 'consignment' ? Colors.blue : ColorTheme.successColor,
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                              ),
                                            ]
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            TextTransform.title(data['customer']['name']),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ],
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
                                      Get.to(ReportSalesRecapDetailScreen(data), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                                      _reportSalesController.readDetailRecap(data['id'], data['codes_id']);
                                      // Get.to(SalesCreditRecapDetailScreen(data), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 16),
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
                                data['status'] == 'paid' ? Container(
                                  margin: EdgeInsets.only(right: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 4),
                                        child: Icon(
                                          Mdi.calendarCheck,
                                          size: 18,
                                          color: ColorTheme.primary,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(data['payment_date'])),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorTheme.primary,
                                          ),
                                        ),
                                      ),
                                    ]
                                  ),
                                ) : Container(),
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
                              "Total",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(data['tr_sales']['transaction']['total']))),
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
                              "Potongan ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(data['tr_sales']['transaction']['discount']))),
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
                              "Grand Total",
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
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}