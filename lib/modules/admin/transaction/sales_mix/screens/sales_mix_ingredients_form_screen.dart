import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/libraries/currency.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/controllers/sales_mix_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/models/model_sales_mix.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_ingredients_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class SalesMixIngredientsFormScreen extends StatelessWidget {
  final SalesMixController _salesMixController = Get.put(SalesMixController());
  final TextEditingController _inpMixName = TextEditingController(text: ModelSalesMix.mixName);
  TextEditingController _inpMixTuslah = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesMix.mixTuslah));
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(SalesMixIngredientsListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Form Racik",
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
                Get.off(SalesMixIngredientsListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                child: Container(
                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 8),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Deskripsi",
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      "Nama Racik",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12
                                      ),
                                    )
                                  ),
                                  GetBuilder(
                                    init: SalesMixController(),
                                    builder: (resp) {
                                      return Container(
                                        child: TextFormField(
                                          controller: _inpMixName,
                                          textCapitalization: TextCapitalization.words,
                                          decoration: InputDecoration(
                                            hintText: 'Isikan nama racik...',
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
                                          onChanged: (val) async{
                                            ModelSalesMix.mixName = val;
                                          },
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
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      "Total",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12
                                      ),
                                    )
                                  ),
                                  GetBuilder(
                                    init: SalesMixController(),
                                    builder: (resp) {
                                      return Container(
                                        child: TextFormField(
                                          enabled: false,
                                          controller: TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesMix.mixTotal)),
                                          textCapitalization: TextCapitalization.words,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            hintText: '0',
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
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 6),
                                    child: Text(
                                      "Tuslah",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12
                                      ),
                                    )
                                  ),
                                  GetBuilder(
                                    init: SalesMixController(),
                                    builder: (resp) {
                                      return Container(
                                        // height: 40,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: _inpMixTuslah,
                                          textAlign: TextAlign.right,
                                          inputFormatters: [
                                            WhitelistingTextInputFormatter.digitsOnly,
                                            ThousandFormat()
                                          ],
                                          decoration: InputDecoration(
                                            hintText: '0',
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
                                          onTap: () => _inpMixTuslah.selection = TextSelection(baseOffset: 0, extentOffset: _inpMixTuslah.value.text.length),
                                          onChanged: (val) async{
                                            _salesMixController.calcMixTuslah(val);
                                          },
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 136,
          color: ColorsBase.primary[10],
          width: MediaQuery.of(context).size.width,
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
                          "Total",
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
                            init: SalesMixController(),
                            builder: (resp) {
                              return Container(
                                child: Text(
                                  NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((ModelSalesMix.mixGrandTotal)),
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
                init: SalesMixController(),
                builder: (resp) {
                  return ModelSalesMix.getCart.length > 0 ? _buttonEnable(context) : _buttonDisable(context);
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
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [ColorTheme.primary, ColorTheme.primarySec],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "Selesai",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Icon(
                Mdi.check,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onPressed: () async {
          if(ModelSalesMix.mixName == '' || ModelSalesMix.mixName.isNull)
          {
            Get.snackbar(
              "Oops!",
              "Nama obat masih kosong",
              titleText: Container(
                child: Text(
                  "Oops!",
                  style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                  )
                ),
              ),
              messageText: Text(
                "Nama obat masih kosong",
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 12,
                )
              ),
              backgroundColor: Colors.red[50].withOpacity(0.95),
              shouldIconPulse: true,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(16),
              icon: Icon(
                Mdi.closeCircle,
                size: 24,
                color: Colors.red,
              ), 
              barBlur: 0,
              duration: Duration(seconds: 3),
              borderRadius: 5,
            );
          } else {
            _salesMixController.createMix();
            Get.close(null);
          }
        },
      ),
    );
  }

  Widget _buttonDisable(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        highlightColor: null,
        splashColor: null,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 48,
          // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "Selesai",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Icon(
                Mdi.check,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onPressed: () async {
          
        },
      ),
    );
  }
}
