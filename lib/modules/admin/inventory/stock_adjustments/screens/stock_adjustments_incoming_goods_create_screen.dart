import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_adjustments/controllers/stock_adjustments_controller.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_adjustments/models/model_stock_adjustments.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_adjustments/screens/stock_adjustments_item_search_screen.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class StockAdjustmentsIncomingGoodsCreateScreen extends StatelessWidget {
  final _stockAdjustmentsController = Get.put(StockAdjustmentsController());
  final DateTime setDate = DateTime.now();
  final _note = ModelStockAdjustments.getNote;

  @override
  Widget build(BuildContext context) {
    TextEditingController _valQtyAdjustments = TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelStockAdjustments.qtyAdjustments));

    return WillPopScope(
      onWillPop: () async {
        Get.close(null);
        _stockAdjustmentsController.clearData();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Barang Masuk",
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
                _stockAdjustmentsController.clearData();
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
                        child: Form(
                          child: GetBuilder(
                            init: StockAdjustmentsController(),
                            builder: (resp) {
                              return ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    margin: EdgeInsets.only(bottom: 24),
                                    decoration: BoxDecoration(
                                      color: ColorsBase.secondary[100],
                                      border: Border.all(color: ColorsBase.secondary),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                    ),
                                    child: Text(
                                      "Perhatian! Fitur ini untuk semua penjualan kecuali penjualan Netto.",
                                      style: TextStyle(
                                        color: ColorsBase.secondary[900],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Form Penyesuaian",
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
                                            "Barang",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  child: Container(
                                                    child: TextFormField(
                                                      controller: TextEditingController(text: ModelStockAdjustments.medicineName.toUpperCase()),
                                                      enabled: false,
                                                      decoration: InputDecoration(
                                                        hintText: "Cari Barang..",
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
                                                  ),
                                                  onTap: () async {
                                                    ModelStockAdjustments.getItem = [];
                                                    showSearch(context: context, delegate: StockAdjustmentsItemSearchScreen());
                                                  },
                                                ),
                                              ),
                                            ],
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
                                            "Harga",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  child: Container(
                                                    child: TextFormField(
                                                      controller: TextEditingController(text: NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelStockAdjustments.medicinePrice)),
                                                      enabled: false,
                                                      textAlign: TextAlign.right,
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
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
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
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: TextFormField(
                                                    controller: _valQtyAdjustments,
                                                    autofocus: false,
                                                    textAlign: TextAlign.right,
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
                                                    onTap: () => _valQtyAdjustments.selection = TextSelection(baseOffset: 0, extentOffset: _valQtyAdjustments.value.text.length),
                                                    onChanged: (value) => {
                                                      _stockAdjustmentsController.setQty(value),
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
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
                                            "Keterangan",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: GetBuilder(
                                            init:StockAdjustmentsController(),
                                            builder: (_) {
                                              return InputDecorator(
                                                decoration: InputDecoration(
                                                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                                  hintText: 'Pilih Keterangan',
                                                  contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
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
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    hint: Text("Pilih Keterangan"),
                                                    value: ModelStockAdjustments.noteId,
                                                    isExpanded: true,
                                                    underline: Container(
                                                      width: double.infinity,
                                                      height: 0,
                                                    ),
                                                    items: _note.map((val) {
                                                      return DropdownMenuItem(
                                                        child: Text(val['title']),
                                                        value: val['id'],
                                                      );
                                                    }).toList(),
                                                    onChanged: (val) {
                                                      print(val);
                                                      _stockAdjustmentsController.setNote(val);
                                                    },
                                                  ),
                                                ),
                                              );
                                            }
                                          )
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
          child: GetBuilder(
            init: StockAdjustmentsController(),
            builder: (resp) {
              return ModelStockAdjustments.medicineId != '' ? _buttonEnable(context) : _buttonDisable(context);
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
            Get.dialog(
              Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 360,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .24),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        width: 208,
                        child: Image(
                          image: AssetImage("assets/images/icons/resp_page/confirmation.png"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Apakah anda yakin?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: Text(
                          "Jumlah penyesuaian stok sebanyak: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelStockAdjustments.qtyAdjustments)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: Colors.grey[100]
                              ),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "Batal",
                                ),
                                onPressed: () async {
                                  Get.close(null);
                                },
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                gradient: LinearGradient(
                                  colors: [ColorTheme.primary, ColorTheme.primarySec],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                              ),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "Ya, Simpan",
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () async {
                                  Get.close(null);
                                  _stockAdjustmentsController.createIncomingGoods();
                                  Get.close(null);
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            );
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
