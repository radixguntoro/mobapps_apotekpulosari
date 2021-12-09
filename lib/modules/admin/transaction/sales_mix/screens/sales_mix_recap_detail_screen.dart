import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/controllers/sales_mix_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/models/model_sales_mix.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_recap_item_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_invoice_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class SalesMixRecapDetailScreen extends StatelessWidget {
  final SalesMixController _salesMixController = Get.put(SalesMixController());
  final data;

  SalesMixRecapDetailScreen(
    this.data
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Detil Rekap",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        leading: Container(
          width: 56,
          height: 56,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(
              Mdi.chevronLeft,
              size: 24,
              color: Colors.white,
            ),
            onPressed: () {
              Get.close(null);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Container(
            child: Container(
              margin: EdgeInsets.only(right: 16, left: 8),
              width: 32,
              height: 32,
              child: null,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorTheme.primary, ColorTheme.primarySec],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -24,
                  left: -MediaQuery.of(context).size.width * .5 + 40,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/background/circle_fc_lg.png")
                        ),
                      ]
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: -MediaQuery.of(context).size.width * .5 + 64,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/background/circle_fc_md.png")
                        ),
                      ]
                    ),
                  ),
                ),
                Positioned(
                  top: -24,
                  right: -MediaQuery.of(context).size.width * .5 + 40,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/background/dounat_fc_lg.png")
                        ),
                      ]
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: -MediaQuery.of(context).size.width * .25,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/background/dounat_fc_sm.png")
                        ),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 88),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: ColorTheme.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 48,
                          height: 48,
                          padding: EdgeInsets.all(6),
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Mdi.receipt,
                              size: 24,
                              color: ColorTheme.secondarySec,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  data['tr_sales']['transaction']['id'].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Row(
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
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(data['tr_sales']['transaction']['created_at'])),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
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
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              TextTransform.title(data['tr_sales']['transaction']['cashier']['name']),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorTheme.primary, ColorTheme.primarySec],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          "Pasien",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          TextTransform.title(data['patient']),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
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
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "Umur",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: Text(
                                          data['age'] != null ? data['age'] : '-',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 2),
                                        child: Text(
                                          "Thn",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "Berat",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: Text(
                                          data['weight'] != null ? data['weight'] : '-',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 2),
                                        child: Text(
                                          "Kg",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorTheme.primary, ColorTheme.primarySec],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Text(
                        "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(data['tr_sales_mix_medicines'].length.toString())))} barang",
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: data['tr_sales_mix_medicines'].length > 0 ? data['tr_sales_mix_medicines'].length : 0,
                        itemBuilder: (context, int i) {
                          return data['tr_sales_mix_medicines'].length > 0 ? SalesMixRecapItemScreen(data['tr_sales_mix_medicines'][i], i) : Container();
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: ColorsBase.primary[10],
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 16, bottom: 4, left: 16, right: 16),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                "Subtotal",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(data['tr_sales']['transaction']['total']))),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ],
                                        ),
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
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                "Potongan",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(data['tr_sales']['transaction']['discount']))),
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
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
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.only(top: 8, bottom: 4, left: 16, right: 16),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                "Total",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(data['tr_sales']['transaction']['grand_total']))),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ],
                                        ),
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
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                "Tunai",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.5 - (8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(data['payment']))),
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
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
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                "Kembali",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.5 - (8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(data['balance']))),
                                              style: TextStyle(
                                                color: ColorTheme.primary,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ),
                                  ],
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
            ),
          ),
        ]
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        child: FlatButton(
          child: Icon(
            Mdi.printer,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          onPressed: () async{
            // ignore: await_only_futures
            await _salesMixController.readDataById(data['tr_sales_transactions_id']);
            Get.off(SalesMixInvoiceScreen(ModelSalesMix.getInvoice), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
          },
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .40),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
          gradient: LinearGradient(
            colors: [ColorTheme.primary, ColorTheme.primarySec],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}