import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/screens/sales_netto_recap_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/screens/sales_netto_recap_repayment_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/screens/sales_netto_stock_adjustments_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class SalesNettoRecapListScreen extends StatelessWidget {
  final data;
  final index;

  SalesNettoRecapListScreen(
    this.data,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    // PERHITUNGAN 
    double total = 0;

    for (var i = 0; i < data['tr_sales_netto_details'].length; i++) {
      total += double.parse(data['tr_sales_netto_details'][i]['subtotal']);
    }

    double discount = double.parse(data['tr_sales']['transaction']['discount']);
    double ppn = (total - double.parse(data['tr_sales']['transaction']['discount'])) * double.parse(data['ppn']);

    double grandTotal = total - discount + ppn;

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: data['status'] != 'paid' ? <Widget>[
        Container(
          height: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: ColorTheme.third,
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
                  "Revisi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w100
                  ),
                )
              ],
            ),
            onPressed: () async {
              Get.to(SalesNettoStockAdjustmentsScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
            },
          ),
        ),
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
              Get.to(SalesNettoRecapRepaymentScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                              margin: EdgeInsets.only(left: 8, right: 4),
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
                                            double.parse(data['total_return'].toString()) > 0 ?
                                            Container(
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
                                            ) : Container(),
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
                                    Get.to(SalesNettoRecapDetailScreen(data), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
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
                        data['status'] == 'paid' ?
                        Container(
                          margin: EdgeInsets.only(top: 4, right: 16),
                          child: Row(
                            children: [
                              Container (
                                child: Text(
                                  "Tgl. Lunas: ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ColorTheme.primary,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Mdi.calendarCheck,
                                  size: 18,
                                  color: ColorTheme.primary,
                                ),
                              ),
                              Container (
                                child: Text(
                                  DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(data['payment_date'])),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: ColorTheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ) : Container(),
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
                            "Potongan",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format((double.parse(data['tr_sales']['transaction']['discount']))),
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
                    flex: 5,
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
                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format(grandTotal),
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
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Fee Display",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            data['payment'] != null ? NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format((double.parse(data['payment']['fee_display']))) : NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format(0.00),
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
      ),
    );
  }
}