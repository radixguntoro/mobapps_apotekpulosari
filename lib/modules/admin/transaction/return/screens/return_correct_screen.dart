import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/transaction/return/controllers/return_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/return/models/model_return.dart';
import 'package:apotik_pulosari/modules/admin/transaction/return/screens/return_create_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ReturnCorrectScreen extends StatelessWidget {
  final _returnController = Get.put(ReturnController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(ReturnCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Koreksi",
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
                Get.off(ReturnCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Form(
                          child: GetBuilder(
                            init: ReturnController(),
                            builder: (resp) {
                              return ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Ringkasan Retur",
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
                                    child: Row(
                                      children: [
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
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 6),
                                                  child: Text(
                                                    "Barang",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 10
                                                    ),
                                                  )
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          padding: EdgeInsets.only(right: 8),
                                                          margin: EdgeInsets.only(bottom: 6),
                                                          child: Text(
                                                            ModelReturn.medicineName.toUpperCase(),
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
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
                                            mainAxisAlignment: MainAxisAlignment.center,
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
                                                  NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelReturn.medicinePrice),
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
                                          flex: 3,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 16),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(ModelReturn.discountReturn),
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
                                          flex: 3,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 16),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 6),
                                                  child: Text(
                                                    "Jumlah Retur",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelReturn.qtyReturn),
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
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
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
        bottomNavigationBar: Container(
          color: ColorsBase.primary[10],
          width: MediaQuery.of(context).size.width,
          height: 136,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 24, bottom: 8, left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Text(
                          "Total Retur",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GetBuilder(
                            init: ReturnController(),
                            builder: (resp) {
                              return Container(
                                child: Text(
                                  NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((ModelReturn.totalReturn)),
                                  style: TextStyle(
                                    color: ColorTheme.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              );
                            }
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
              GetBuilder(
                init: ReturnController(),
                builder: (resp) {
                  if (ModelReturn.isLoading == true) {
                    return LoadingSaveForm();
                  } else {
                    return ModelReturn.medicineId != '' ? _buttonEnable(context) : _buttonDisable(context);
                  }
                }
              ),
            ],
          ),
        ),
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
            _returnController.createData();
            Get.close(null);
          },
        ),
      ),
    );
  }

  Widget _buttonDisable(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: FlatButton(
          padding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          highlightColor: null,
          splashColor: null,
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
            
          },
        ),
      ),
    );
  }
}
