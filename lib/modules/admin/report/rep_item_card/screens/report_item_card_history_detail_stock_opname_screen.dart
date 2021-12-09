import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportItemCardHistoryDetailStockOpnameScreen extends StatelessWidget {
  final data;

  ReportItemCardHistoryDetailStockOpnameScreen(
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
            "Detil Transaksi",
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
                                  ModelReportItemCard.getDataTransaction['id'].toString(),
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
                                              TextTransform.title(ModelReportItemCard.getDataTransaction['person']['name']),
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: GetBuilder(
                          init: ReportItemCardController(),
                          builder: (resp) { 
                            if(ModelReportItemCard.isLoading == true) {
                              return LoadingShimmerRecap();
                            } else {
                              return ListView(
                                padding: EdgeInsets.all(0),
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 8, bottom: 8),
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
                                                      child: Text(
                                                        TextTransform.title(ModelReportItemCard.getDataTransaction['medicine']['item']['name']),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      )
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Container(
                                                                    child: Text(
                                                                      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format(double.parse(ModelReportItemCard.getDataTransaction['price_purchase_app'].toString())),
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
                                        Container(
                                          padding: EdgeInsets.only(top: 16, bottom: 16),
                                          color: Colors.white,
                                          child: DividerDashed(
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 0),
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
                                                        "Stok Sistem",
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelReportItemCard.getDataTransaction['stock_in_system']),
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
                                                flex: 4,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(bottom: 6),
                                                      child: Text(
                                                        "Stok Fisik",
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelReportItemCard.getDataTransaction['stock_in_physic']),
                                                        style: TextStyle(
                                                          color: Colors.blue,
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
                                                        "Selisih",
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelReportItemCard.getDataTransaction['stock_difference']),
                                                        style: TextStyle(
                                                          color: ModelReportItemCard.getDataTransaction['stock_difference'] < 0 ? Colors.red : Colors.black54,
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
                                        Container(
                                          padding: EdgeInsets.only(top: 16, bottom: 16),
                                          color: Colors.white,
                                          child: DividerDashed(
                                            color: Colors.grey[300],
                                          ),
                                        ),
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
                                                        "Subtotal Sistem",
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(ModelReportItemCard.getDataTransaction['price_purchase_app'].toString()) * ModelReportItemCard.getDataTransaction['stock_in_system']),
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
                                                flex: 4,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(bottom: 6),
                                                      child: Text(
                                                        "Subtotal Fisik",
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(ModelReportItemCard.getDataTransaction['price_purchase_phx'].toString()) * ModelReportItemCard.getDataTransaction['stock_in_physic']),
                                                        style: TextStyle(
                                                          color: Colors.blue,
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
                                                        "Selisih",
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(ModelReportItemCard.getDataTransaction['price_purchase_difference'].toString())),
                                                        style: TextStyle(
                                                          color: double.parse(ModelReportItemCard.getDataTransaction['price_purchase_difference'].toString()) < 0 ? Colors.red : Colors.black54,
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
                                  )
                                ],
                              );
                            }
                          }
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}