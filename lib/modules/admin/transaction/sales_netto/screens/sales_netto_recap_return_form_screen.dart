import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/controllers/sales_netto_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/models/model_sales_netto.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/screens/sales_netto_recap_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/screens/sales_netto_recap_return_correct_screen.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class SalesNettoRecapReturnFormScreen extends StatelessWidget {
  final SalesNettoController _salesNettoController = Get.put(SalesNettoController());
  final item;
  final data;

  SalesNettoRecapReturnFormScreen(
    this.item,
    this.data,
  );
  @override
  Widget build(BuildContext context) {
    TextEditingController _valPrice = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format(double.parse(item['price'].toString())));
    TextEditingController _valDiscount = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 1).format(double.parse(item['discount'].toString()) * 100));
    TextEditingController _valQty = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(item['qty'].toString())));
    TextEditingController _valQtyReturn = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesNetto.qtyReturn));

    return WillPopScope(
      onWillPop: () async {
        Get.off(SalesNettoRecapDetailScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
        _salesNettoController.clearReturn();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Buat Retur",
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
                Get.off(SalesNettoRecapDetailScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                _salesNettoController.clearReturn();
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
                        init: SalesNettoController(),
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
                                    "Form Retur",
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
                                          "Harga",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12
                                          ),
                                        )
                                      ),
                                      Container(
                                        child: TextFormField(
                                          textAlign: TextAlign.end,
                                          keyboardType: TextInputType.number,
                                          enabled: false,
                                          controller: _valPrice,
                                          decoration: InputDecoration(
                                            hintText: "0",
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
                                          inputFormatters: [
                                            WhitelistingTextInputFormatter.digitsOnly,
                                            CurrencyTextInputFormatter(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: '',
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
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
                                          "Diskon (%)",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12
                                          ),
                                        )
                                      ),
                                      Container(
                                        child: TextFormField(
                                          textAlign: TextAlign.end,
                                          keyboardType: TextInputType.number,
                                          enabled: false,
                                          controller: _valDiscount,
                                          decoration: InputDecoration(
                                            hintText: "0",
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
                                          inputFormatters: [
                                            WhitelistingTextInputFormatter.digitsOnly,
                                            CurrencyTextInputFormatter(
                                              locale: 'id',
                                              decimalDigits: 1,
                                              symbol: '',
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
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
                                          "Kuantitas",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12
                                          ),
                                        )
                                      ),
                                      Container(
                                        child: TextFormField(
                                          textAlign: TextAlign.end,
                                          keyboardType: TextInputType.number,
                                          enabled: false,
                                          controller: _valQty,
                                          decoration: InputDecoration(
                                            hintText: "0",
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
                                          inputFormatters: [
                                            WhitelistingTextInputFormatter.digitsOnly,
                                            CurrencyTextInputFormatter(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: '',
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          "Jumlah",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12
                                          ),
                                        )
                                      ),
                                      Container(
                                        child: TextFormField(
                                          textAlign: TextAlign.end,
                                          keyboardType: TextInputType.number,
                                          controller: _valQtyReturn,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                            hintText: "0",
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
                                          inputFormatters: [
                                            WhitelistingTextInputFormatter.digitsOnly,
                                            CurrencyTextInputFormatter(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: '',
                                            )
                                          ],
                                          onTap: () => _valQtyReturn.selection = TextSelection(baseOffset: 0, extentOffset: _valQtyReturn.value.text.length),
                                          onChanged: (value) => {
                                            _salesNettoController.calcReturn(item, value, data),

                                            if (value.length < 1 || int.parse(value.replaceAll('.','')) > int.parse(item['qty'].toString())) {
                                              _valQtyReturn = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelSalesNetto.qtyReturn))
                                            }
                                          },
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
                    GetBuilder(
                      init: SalesNettoController(),
                      builder: (_) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                color: Colors.grey[100],
                                padding: EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 16),
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
                                            init: SalesNettoController(),
                                            builder: (resp) {
                                              return Container(
                                                child: Text(
                                                  NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2).format((ModelSalesNetto.totalReturn)),
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
                            ],
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
        bottomNavigationBar: Container(
          color: ColorsBase.primary[10],
          child: GetBuilder(
            init: SalesNettoController(),
            builder: (resp) {
              return ModelSalesNetto.qtyReturn > 0 ? _buttonEnable(context) : _buttonDisable(context);
            }
          )
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
                  "Koreksi",
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
            // print(item.toString());
            // print(data.toString());
            Get.off(SalesNettoRecapReturnCorrectScreen(item, data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                  "Koreksi",
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
      ),
    );
  }
}