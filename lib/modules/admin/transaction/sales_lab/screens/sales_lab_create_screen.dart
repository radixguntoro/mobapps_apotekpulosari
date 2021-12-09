import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/controllers/sales_lab_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/models/model_sales_lab.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/screens/sales_lab_cart_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/screens/sales_lab_table_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SalesLabCreateScreen extends StatelessWidget {
  final SalesLabController _salesLabController = Get.put(SalesLabController());
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _salesLabController.readFirst();
        _salesLabController.clearData();
        Get.close(null);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Form Pasien",
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
                _salesLabController.readFirst();
                _salesLabController.clearData();
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
                        padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                        child: Form(
                          child: GetBuilder(
                            init: SalesLabController(),
                            builder: (resp) {
                              return ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 8),
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Informasi Pasien",
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
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Nama",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: TextFormField(
                                            textCapitalization: TextCapitalization.words,
                                            decoration: InputDecoration(
                                              hintText: "Isikan nama pasien...",
                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                              contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                              disabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[200]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              suffixIcon: Icon(Mdi.accountHeart)
                                            ),
                                            onChanged: (value) => {
                                              ModelSalesLab.patientName = value
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Umur",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              WhitelistingTextInputFormatter.digitsOnly,
                                            ],
                                            decoration: InputDecoration(
                                              hintText: "Isikan umur pasien...",
                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                              contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                              disabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[200]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.grey[300]),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            onChanged: (value) => {
                                              ModelSalesLab.patientAge = value
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 16),
                                    child: Text(
                                      "Form Check Up",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 16, bottom: 0),
                                    color: Colors.white,
                                    child: DividerDashed(
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: FlatButton(
                                      padding: EdgeInsets.all(0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              "Lihat Nilai Normal",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.blue[600]
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 4),
                                            width: 18,
                                            height: 18,
                                            child: Icon(
                                              Mdi.informationOutline,
                                              size: 18,
                                              color: Colors.blue[600],
                                            ),
                                          )
                                        ],
                                      ),
                                      onPressed: () => {
                                        Get.to(SalesLabTableInfoScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),)
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(right: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 6),
                                                  child: Text(
                                                    "Glukosa Puasa",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12
                                                    ),
                                                  )
                                                ),
                                                Container(
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      hintText: "Isikan nilai...",
                                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                                      contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                      disabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[200]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    onChanged: (value) => {
                                                      ModelSalesLab.patientGlucoseFasting = value
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 6),
                                                  child: Text(
                                                    "Glukosa 2 Jam PP",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12
                                                    ),
                                                  )
                                                ),
                                                Container(
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      hintText: "Isikan nilai...",
                                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                                      contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                      disabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[200]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    onChanged: (value) => {
                                                      ModelSalesLab.patientGlucose2hoursPP = value
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(right: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 6),
                                                  child: Text(
                                                    "Glukosa Acak",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12
                                                    ),
                                                  )
                                                ),
                                                Container(
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      hintText: "Isikan nilai...",
                                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                                      contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                      disabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[200]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    onChanged: (value) => {
                                                      ModelSalesLab.patientGlucoseRandom = value
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 6),
                                                  child: Text(
                                                    "Asam Urat",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12
                                                    ),
                                                  )
                                                ),
                                                Container(
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      hintText: "Isikan nilai...",
                                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                                      contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                      disabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[200]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    onChanged: (value) => {
                                                      ModelSalesLab.patientUricAcid = value
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 24),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(right: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 6),
                                                  child: Text(
                                                    "Kolesterol",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12
                                                    ),
                                                  )
                                                ),
                                                Container(
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      hintText: "Isikan nilai...",
                                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                                      contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                      disabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[200]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    onChanged: (value) => {
                                                      ModelSalesLab.patientCholesterol = value
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 6),
                                                  child: Text(
                                                    "Tekanan Darah (Tensi)",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12
                                                    ),
                                                  )
                                                ),
                                                Container(
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      hintText: "Isikan nilai...",
                                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                                      contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                      disabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[200]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.grey[300]),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    onChanged: (value) => {
                                                      ModelSalesLab.patientBloodPressure = value
                                                    },
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
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: GetBuilder(
            init: SalesLabController(),
            builder: (resp) {
              return ModelSalesLab.patientName == '' || ModelSalesLab.patientName == null ? _buttonDisable(context) : _buttonEnable(context);
            }
          ),
        ),
      ),
    );
  }
  
  Widget _buttonEnable(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
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
                "Keranjang",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Icon(
              Mdi.arrowRight,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () async {
          // ignore: await_only_futures
          Get.off(SalesLabCartListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        },
      ),
    );
  }

  Widget _buttonDisable(context) {
    return Container(
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
                "Keranjang",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Icon(
              Mdi.arrowRight,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () async {
          
        },
      ),
    );
  }
}

