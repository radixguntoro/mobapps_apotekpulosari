import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/controllers/closing_cashier_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/models/model_closing_cashier.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/screens/closing_cashier_recap_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/screens/closing_cashier_recap_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class ClosingCashierRecapListScreen extends StatelessWidget {
  final _closingCashierController = Get.put(ClosingCashierController());
  final data;
  final index;

  ClosingCashierRecapListScreen(
    this.data,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: ModelAuth.permission != 99 && ModelAuth.permission != 1 ? [] : [
        Container(
          height: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: ColorTheme.secondary,
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
              ModelClosingCashier.incomeReal = double.parse(data['income_real']);
              Get.off(ClosingCashierRecapEditScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
            },
          ),
        ),
      ],
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: (index+1) % 2 == 0 ? Colors.white : Colors.grey[50],
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 6),
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
                      Mdi.fileDocumentMultiple,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        data['id'].toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black
                                        ),
                                      ),
                                    ),
                                    double.parse(data['total_return'].toString()) > 0 ?
                                    Container(
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
                                    ) : Container(),
                                  ],
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
                                    _closingCashierController.readDataDetail(data['id'].toString());
                                    Get.to(ClosingCashierRecapDetailScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        DateFormat("dd MMM yyyy HH:mm", "id_ID").format(DateTime.parse(data['created_at'])),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Text(
                                    "Shift: ${data['shift'].toString()}",
                                    // textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Text(
                                    "Nota: ${data['nota'].toString()}",
                                    // textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
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
                            "Total Sistem",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(data['income_app']))),
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
                            "Total Fisik",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(data['income_real']))),
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
                            "Selisih",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(data['income_diff']))),
                            style: TextStyle(
                              color: double.parse(data['income_diff']) > 0 ? ColorTheme.primary : ColorTheme.danger,
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