import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/controllers/stock_opname_controller.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/models/model_stock_opname.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class StockOpnameCreateScreen extends StatelessWidget {
  final StockOpnameController _stockOpnameController = Get.put(StockOpnameController());

  @override
  Widget build(BuildContext context) {
    TextEditingController _valName = TextEditingController(text: ModelStockOpname.medicineName);
    TextEditingController _valCategory = TextEditingController(text: ModelStockOpname.medicineCategory);
    TextEditingController _valUnit = TextEditingController(text: TextTransform.title(ModelStockOpname.medicineUnit));
    TextEditingController _valStockInSystem = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelStockOpname.stockInSystem));
    TextEditingController _valStockInPhysic = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelStockOpname.stockInPhysic));

    return WillPopScope(
      onWillPop: () async {
        _stockOpnameController.readFirst();
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
              "Stok Opname",
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
                _stockOpnameController.readFirst();
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
                        child: GetBuilder(
                          init: StockOpnameController(),
                          builder: (_) {
                            return ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Form Data",
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
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "Nama Barang",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12
                                                ),
                                              )
                                            ),
                                            Container(
                                              child: TextFormField(
                                                enabled: false,
                                                controller: _valName,
                                                decoration: InputDecoration(
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
                                            )
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
                                                "Kategori",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12
                                                ),
                                              )
                                            ),
                                            Container(
                                              child: TextFormField(
                                                enabled: false,
                                                controller: _valCategory,
                                                decoration: InputDecoration(
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
                                            )
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
                                                "Satuan",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12
                                                ),
                                              )
                                            ),
                                            Container(
                                              child: TextFormField(
                                                enabled: false,
                                                controller: _valUnit,
                                                decoration: InputDecoration(
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
                                            )
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
                                                "Stok Fisik",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12
                                                ),
                                              )
                                            ),
                                            Container(
                                              child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: _valStockInSystem,
                                                textAlign: TextAlign.right,
                                                enabled: false,
                                                decoration: InputDecoration(
                                                  hintText: "0",
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[200]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
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
                                                "Stok Fisik",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12
                                                ),
                                              )
                                            ),
                                            Container(
                                              child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: _valStockInPhysic,
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  hintText: "0",
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[200]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.grey[400]),
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
                                                onTap: () => _valStockInPhysic.selection = TextSelection(baseOffset: 0, extentOffset: _valStockInPhysic.value.text.length),
                                                onChanged: (value) => {
                                                  _stockOpnameController.setNewQtyPhx(value),

                                                  if (value.length < 1) {
                                                    _valStockInPhysic = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelStockOpname.stockInPhysic))
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: ColorsBase.primary[10],
          width: MediaQuery.of(context).size.width,
          child: GetBuilder(
            init: StockOpnameController(),
            builder: (resp) {
              if (ModelStockOpname.isLoading == true) {
                return LoadingSaveForm();
              } else {
                return _buttonEnable(context);
              } 
            }
          ),
        ),
      ),
    );
  }

  Widget _buttonEnable(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Container(
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
            _stockOpnameController.createData();
            Get.close(null);
          },
        ),
      ),
    );
  }
}
