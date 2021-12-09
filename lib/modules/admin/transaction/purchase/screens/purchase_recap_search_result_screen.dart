import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_repayment_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_stock_adjustments_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class PurchaseRecapSearchResultScreen extends StatelessWidget {
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  final data;
  final query;
  final total;
  final index;

  PurchaseRecapSearchResultScreen(
    this.data,
    this.query,
    this.total,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    // PERHITUNGAN 
    double total = 0;

    for (var i = 0; i < data['details'].length; i++) {
      total += double.parse(data['details'][i]['subtotal']);
    }

    double discount = double.parse(data['transaction']['discount']);
    double ppn = (total - double.parse(data['transaction']['discount'])) * double.parse(data['ppn']);

    double grandTotal = total - discount + ppn;

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: [],
      secondaryActions: data['status'] != 'paid' ? [
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
              Get.to(PurchaseStockAdjustmentsScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
              _purchaseController.setData(data);
              Get.to(PurchaseRecapRepaymentScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Container(
                                            child: RichText(
                                              text: searchMatch((data['invoice_number']).toString(), 'id'),
                                              textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                            ),
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: Container(
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
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                        double.parse(data['total_return'].toString()) > 0 ?
                                        WidgetSpan(
                                          child: Container(
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
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                          ),
                                        ) : WidgetSpan(child: Container()),
                                      ]
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
                                    Get.to(PurchaseRecapDetailScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: RichText(
                            text: searchMatch(data['supplier']['name'], 'supplier'),
                            textScaleFactor: MediaQuery.of(context).textScaleFactor,
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
                                        Mdi.calendarEdit,
                                        size: 18,
                                        color: Colors.black38,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(data['date'])),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black38,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 16),
                                child: Row(
                                  children: [
                                    data['status'] == 'paid' ? Container(
                                    margin: EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Mdi.calendarCheck,
                                      size: 18,
                                      color: ColorTheme.primary,
                                    ),
                                  ) : Container(),
                                  data['status'] == 'paid' ? Container (
                                    child: Text(
                                      DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(data['payment_date'])),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: ColorTheme.primary,
                                      ),
                                    ),
                                  ) : Container(),
                                  ],
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
                                        TextTransform.title(data['transaction']['cashier']['name']),
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
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "HPP",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format((double.parse(data['transaction']['total'].toString()) - double.parse(data['total_return'].toString()))),
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
                    flex: 2,
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
                        Container(
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: double.parse(data['ppn']) > 0 ? ColorTheme.successColor :ColorTheme.danger,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              double.parse(data['ppn']) > 0 ? Mdi.check : Mdi.close,
                              color: Colors.white,
                              size: 14,
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
                            "Total",
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
                ],
              ),
            ), 
          ],
        )
      ),
    );
  }

  final TextStyle posResSupplier = TextStyle(
    color: ColorTheme.primary, 
    fontWeight: FontWeight.w600, 
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  final TextStyle negResSupplier = TextStyle(
    color: Colors.black54, 
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  final TextStyle posResDate = TextStyle(
    color: Colors.black, 
    fontWeight: FontWeight.w600, 
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  final TextStyle negResDate = TextStyle(
    color: Colors.black54, 
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  final TextStyle posResId = TextStyle(
    color: ColorTheme.primary, 
    fontWeight: FontWeight.w600, 
    fontFamily: 'Montserrat',
    fontSize: 14,
  );

  final TextStyle negResId = TextStyle(
    color: Colors.black, 
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontSize: 14,
  );

  TextSpan searchMatch(String match, String state) {
    if (query == null || query == "")
      return TextSpan(
        text: match, 
        style: state == 'supplier' ? negResSupplier : state == 'date' ? negResDate : negResId
      );
      var refinedMatch = match.toLowerCase();
      var refinedSearch = query.toLowerCase();
    if (refinedMatch.contains(refinedSearch)) {
      if (refinedMatch.substring(0, refinedSearch.length) == refinedSearch) {
        return TextSpan(
          style: state == 'supplier' ? posResSupplier : state == 'date' ? posResDate : posResId,
          text: match.substring(0, refinedSearch.length),
          children: [
            searchMatch(
              match.substring(
                refinedSearch.length,
              ),
              state
            ),
          ],
        );
      } else if (refinedMatch.length == refinedSearch.length) {
        return TextSpan(
          text: match, 
          style: state == 'supplier' ? posResSupplier : state == 'date' ? posResDate : posResId
        );
      } else {
        return TextSpan(
          style: state == 'supplier' ? negResSupplier : state == 'date' ? negResDate : negResId,
          text: match.substring(
            0,
            refinedMatch.indexOf(refinedSearch),
          ),
          children: [
            searchMatch(
              match.substring(
                refinedMatch.indexOf(refinedSearch),
              ),
              state
            ),
          ],
        );
      }
    } else if (!refinedMatch.contains(refinedSearch)) {
      return TextSpan(text: match, style: state == 'supplier' ? negResSupplier : state == 'date' ? negResDate : negResId);
    }
    return TextSpan(
      text: match.substring(0, refinedMatch.indexOf(refinedSearch)),
      style: state == 'supplier' ? negResSupplier : state == 'date' ? negResDate : negResId,
      children: [
        searchMatch(match.substring(refinedMatch.indexOf(refinedSearch)), state)
      ],
    );
  }
}
