import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/master/supplier/models/model_supplier.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/models/model_purchase.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_cart_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_supplier_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class PurchaseCreateScreen extends StatelessWidget {
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  final DateTime selectedDate = DateTime.now();
  final TextEditingController _valsupplierInvoiceNumber = TextEditingController(text: ModelPurchase.supplierInvoiceNumber);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _purchaseController.readFirst();
        // _purchaseController.clearForm();
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
              "Form Faktur",
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
                _purchaseController.readFirst();
                // _purchaseController.clearForm();
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
                gradient: LinearGradient(
                  colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
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
                                Mdi.factoryIcon,
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
                                    "Supplier",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    ModelPurchase.supplierName,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Icon(
                                Mdi.magnify,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                ModelSupplier.getData = [];
                                showSearch(context: context, delegate: PurchaseSupplierSearchScreen());
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [ColorTheme.secondary, ColorTheme.secondarySec],
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
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Informasi Faktur",
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
                                        "No. Faktur",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12
                                        ),
                                      )
                                    ),
                                    GetBuilder(
                                      init: PurchaseController(),
                                      builder: (_) {
                                        return Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: TextFormField(
                                                  controller: _valsupplierInvoiceNumber,
                                                  decoration: InputDecoration(
                                                    suffix: ModelPurchase.isExistInvoice == true ? Icon(
                                                      Mdi.informationOutline,
                                                      color:ColorTheme.danger,
                                                    ) : null,
                                                    hintText: "Isikan nomor faktur...",
                                                    contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),
                                                    disabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey[200]),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey[300]),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    enabledBorder: ModelPurchase.isExistInvoice == true ? OutlineInputBorder(
                                                      borderSide: BorderSide(color: ColorTheme.danger),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ) : OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey[300]),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                  ),
                                                  onChanged: (val) {
                                                    ModelPurchase.supplierInvoiceNumber = val;
                                                  },
                                                ),
                                              ),
                                              Visibility(
                                                visible: ModelPurchase.isExistInvoice == true ? true : false,
                                                child: Container(
                                                  margin: EdgeInsets.only(top: 8),
                                                  child: Text(
                                                    "Nomor faktur sudah ada.",
                                                    style: TextStyle(
                                                      color:ColorTheme.danger,
                                                      fontSize: 12,
                                                      fontStyle: FontStyle.italic,
                                                    ),
                                                  )
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }
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
                                        "Tanggal Faktur",
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
                                            child: GetBuilder(
                                              init: PurchaseController(),
                                              builder: (_) {
                                                return TextFormField(
                                                  controller: TextEditingController(text: tanggal(ModelPurchase.supplierInvoiceDate, shortMonth: true)),
                                                  readOnly: true,
                                                  decoration: InputDecoration(
                                                    hintText: "Pilih Tanggal..",
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
                                                    suffixIcon: Icon(Mdi.calendar)
                                                  ),
                                                  onTap: () async {
                                                    final DateTime _date = await showDatePicker(
                                                      context: context,
                                                      initialDate: selectedDate,
                                                      firstDate: DateTime(2020),
                                                      lastDate: DateTime(2025),
                                                      cancelText: "Tutup",
                                                      confirmText: "Pilih",
                                                      builder: (context, child) {
                                                        return Theme(
                                                          data: ThemeData.light().copyWith(
                                                            colorScheme: ColorScheme.light(
                                                              primary: ColorTheme.primary,
                                                            ),
                                                            buttonTheme: ButtonThemeData(
                                                              textTheme: ButtonTextTheme.primary
                                                            ),
                                                          ),
                                                          child: child,
                                                        );
                                                      },
                                                    );
                                                    _purchaseController.setInvoiceDate(_date);
                                                  },
                                                );
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
          width: MediaQuery.of(context).size.width,
          color: ColorsBase.primary[10],
          child: GetBuilder(
            init: PurchaseController(),
            builder: (resp) {
              return ModelPurchase.supplierInvoiceNumber != '' && ModelPurchase.supplierId != '' ? _buttonEnable(context) : _buttonDisable(context);
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
            await _purchaseController.readExistInvoice();
            if(ModelPurchase.isExistInvoice == false) {
              Get.off(PurchaseCartListScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
            }
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
      ),
    );
  }
}
