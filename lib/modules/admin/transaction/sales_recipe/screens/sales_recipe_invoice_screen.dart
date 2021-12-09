import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/controllers/sales_recipe_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/screens/sales_recipe_invoice_item_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class SalesRecipeInvoiceScreen extends StatelessWidget {
  final SalesRecipeController _salesRecipeController = Get.put(SalesRecipeController());
  final data;

  SalesRecipeInvoiceScreen(
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
            "Pratinjau",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white
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
              color: Colors.white
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, .16),
                            offset: Offset(0, -4),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: RichText(
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.1,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Apotek",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: 'Montserrat'
                                    )
                                  ),
                                  TextSpan(
                                    text: " Pulosari",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontFamily: 'Montserrat'
                                    )
                                  )
                                ]
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              "Jl. Pulosari III/48, Kel. Gunung Sari, Kec. Dukuh Pakis, Surabaya.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(
                              "Telp/WA: 081330104464",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 6),
                                      child: Text(
                                        "No. Transaksi",
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data['id'].toString(),
                                      style: TextStyle(
                                        fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 6),
                                      child: Text(
                                        "Admin",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data['cashierName'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 6),
                                      child: Text(
                                        data['date'],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data['time'],
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            width: MediaQuery.of(context).size.width,
                            height: 4,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                                itemCount: data['details'].length > 0 ? data['details'].length : 0,
                                itemBuilder: (context, int index) {
                                  return data['details'].length > 0 ? SalesRecipeInvoiceItemScreen(data['details'][index]) : Container();
                                },
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2, bottom: 8),
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(
                                width: 1,
                                style: BorderStyle.none
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Text(
                                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(data['qtyTotal'].toString())),
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 12
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "TOTAL HARGA :",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(data['total'].toString())),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "DISKON :",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(data['discount'].toString())),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2, bottom: 8),
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(
                                width: 1,
                                style: BorderStyle.none
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "GRAND TOTAL :",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(data['grandTotal'].toString())),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "TUNAI :",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(data['payment'].toString())),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2, bottom: 8),
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(
                                width: 1,
                                style: BorderStyle.none
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "KEMBALI :",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(data['balance'].toString())),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            width: MediaQuery.of(context).size.width,
                            height: 4,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 2, bottom: 16),
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            color: Colors.black,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              "SEMOGA LEKAS SEMBUH",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "TERIMA KASIH",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        child: FlatButton(
          child: Icon(
            Mdi.filePdfOutline,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          onPressed: () async{
            _salesRecipeController.exportToPDF();
          },
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .32),
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
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}