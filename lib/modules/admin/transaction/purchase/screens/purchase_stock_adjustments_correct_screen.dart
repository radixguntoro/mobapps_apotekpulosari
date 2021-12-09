import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/models/model_purchase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class PurchaseStockAdjustmentsCorrectScreen extends StatelessWidget {
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  final item;
  final data;

  PurchaseStockAdjustmentsCorrectScreen(
    this.item,
    this.data,
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
            "Koreksi Penyesuaian",
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
              _purchaseController.clearReturn();
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
            margin: EdgeInsets.only(top: 88),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .08),
                  offset: Offset(0, 4),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), 
                  topRight: Radius.circular(24)
                ),
                gradient: LinearGradient(
                  colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Column(
                children: [
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
                              Mdi.pill,
                              size: 24,
                              color: ColorsBase.secondary[25],
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
                                  "Nama Barang",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  item['medicine']['item']['name'].toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GetBuilder(
                      init: PurchaseController(),
                      builder: (_) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24), 
                              topRight: Radius.circular(24)
                            ),
                            color: Colors.white,
                          ),
                          child: ListView(
                            padding: EdgeInsets.only(top:24, bottom: 16, left: 16, right: 16),
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Ringkasan Penyesuaian",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16
                                  ),
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
                                                "Kuantitas",
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
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(item['qty'].toString())),
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
                                margin: EdgeInsets.only(top: 8, bottom: 8),
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
                                                "Jumlah",
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
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelPurchase.qtyAdjustments),
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
                              Divider(),
                              Container(
                                margin: EdgeInsets.only(top: 8, bottom: 16),
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
                                                "Penyesuaian",
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
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelPurchase.qtyAdjustmentsDifference),
                                              style: TextStyle(
                                                color: ModelPurchase.qtyAdjustmentsDifference > 0 ? ColorTheme.primary : ColorTheme.danger,
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
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[100],
        child: GetBuilder(
          init: PurchaseController(),
          builder: (resp) {
            return _buttonEnable(context);
          }
        )
      ),
    );
  }

  Widget _buttonEnable(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [ColorTheme.primary, ColorTheme.primarySec],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsBase.primary.withOpacity(0.40),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: FlatButton(
          padding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "Simpan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Icon(
                Mdi.checkAll,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () async {
            _purchaseController.createAdjustments(data, item);
            Get.close(null);
          },
        ),
      ),
    );
  }
}