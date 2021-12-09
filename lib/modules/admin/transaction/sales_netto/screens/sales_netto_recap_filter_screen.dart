import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/controllers/sales_netto_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/models/model_sales_netto.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_netto/screens/sales_netto_autocomplete_customer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class SalesNettoRecapFilterScreen extends StatelessWidget {
  final SalesNettoController _salesNettoController = Get.put(SalesNettoController());
  final DateTime invoiceDate = DateTime.now();
  final DateTime paymentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Filter",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        leading: Container(
          width: 40,
          height: 40,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(
              Mdi.chevronLeft,
              size: 24,
            ),
            onPressed: () async {
              Get.close(null);
            },
          ),
        ),
        actions: <Widget>[
          Container(
            width: 56,
            height: 56,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Icon(
                Mdi.refresh,
                size: 24,
              ),
              onPressed: () async {
                _salesNettoController.setResetFilter();
                Get.close(null);
              },
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Divider(
                height: 0,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8, bottom: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            width: double.infinity,
                            child: Text(
                              "Tanggal Faktur",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          GetBuilder(
                            init: SalesNettoController(),
                            builder: (_) {
                              return Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: 16),
                                        padding: EdgeInsets.only(top: 13.5, bottom: 13.5, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          color: Colors.grey[100],
                                          border: Border.all(
                                            color: Colors.grey[200]
                                          )
                                        ),
                                        child: Text(
                                          _.invoiceDate != '' ? tanggal(DateTime.parse(_.invoiceDate), shortMonth: true) : ''
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        gradient: LinearGradient(
                                          colors: [ColorTheme.third, ColorTheme.thirdSec],
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                        ),
                                      ),
                                      child: FlatButton(
                                        padding: EdgeInsets.all(0),
                                        child: Icon(
                                          Mdi.calendar,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          final DateTime _date = await showDatePicker(
                                            context: context,
                                            initialDate: invoiceDate,
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
                                          _salesNettoController.setFilterInvoiceDate(_date);
                                          // Get.close(null);
                                        },
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
                    GetBuilder(
                      init: SalesNettoController(),
                      builder: (_) {
                        if (_.state == 1) {
                          return Container(
                            margin: EdgeInsets.only(top: 8, bottom: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: double.infinity,
                                  child: Text(
                                    "Tanggal Pelunasan",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(right: 16),
                                          padding: EdgeInsets.only(top: 13.5, bottom: 13.5, left: 16, right: 16),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            color: Colors.grey[100],
                                            border: Border.all(
                                              color: Colors.grey[200]
                                            )
                                          ),
                                          child: Text(
                                            _.paymentDate != '' ? tanggal(DateTime.parse(_.paymentDate), shortMonth: true) : ''
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          gradient: LinearGradient(
                                            colors: [ColorTheme.third, ColorTheme.thirdSec],
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                          ),
                                        ),
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0),
                                          child: Icon(
                                            Mdi.calendar,
                                            color: Colors.white,
                                          ),
                                          onPressed: () async {
                                            final DateTime _date = await showDatePicker(
                                              context: context,
                                              initialDate: paymentDate,
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
                                            _salesNettoController.setFilterPaymentDate(_date);
                                            // Get.close(null);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }
                    ),
                    GetBuilder(
                      init: SalesNettoController(),
                      builder: (_) { 
                        return Container(
                          margin: EdgeInsets.only(bottom: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                width: double.infinity,
                                child: Text(
                                  "Pelanggan",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: TextFormField(
                                          controller: TextEditingController(text: TextTransform.title(_.customerPersonsName)),
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            hintText: "Pilih Pelanggan..",
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
                                          onTap: () {
                                            ModelSalesNetto.getCustomer = [];
                                            showSearch(context: context, delegate: SalesNettoAutoCompleteCustomerScreen('recap'));
                                          },
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
                    GetBuilder(
                      init: SalesNettoController(),
                      builder: (_) { 
                        return Visibility(
                          visible: _.state == 0 ? true : false,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  width: double.infinity,
                                  child: Text(
                                    "Status Pembayaran",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: GetBuilder(
                                            init: SalesNettoController(),
                                            builder: (_) {
                                              return InkWell(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(
                                                      color: _.filterCredit == true ? ColorTheme.primary : Colors.black26, 
                                                      width: 1
                                                    ),
                                                    color: _.filterCredit == true ? ColorsBase.primary[50] : Colors.white,
                                                  ),
                                                  child: Text(
                                                    "Kredit",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: _.filterCredit == true ? ColorTheme.primary : Colors.black38
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  _salesNettoController.setFilter(_.filterCredit, 'credit');
                                                },
                                              );
                                            }
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: GetBuilder(
                                            init: SalesNettoController(),
                                            builder: (_) {
                                              return InkWell(
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 8),
                                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(
                                                      color: _.filterCOD == true ? ColorTheme.primary : Colors.black26, 
                                                      width: 1
                                                    ),
                                                    color: _.filterCOD == true ? ColorsBase.primary[50] : Colors.white,
                                                  ),
                                                  child: Text(
                                                    "C.O.D",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: _.filterCOD == true ? ColorTheme.primary : Colors.black38
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  _salesNettoController.setFilter(_.filterCOD, 'cod');
                                                },
                                              );
                                            }
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: GetBuilder(
                                            init: SalesNettoController(),
                                            builder: (_) {
                                              return InkWell(
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 8),
                                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(
                                                      color: _.filterConsignment == true ? ColorTheme.primary : Colors.black26, 
                                                      width: 1
                                                    ),
                                                    color: _.filterConsignment == true ? ColorsBase.primary[50] : Colors.white,
                                                  ),
                                                  child: Text(
                                                    "Konsinyasi",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: _.filterConsignment == true ? ColorTheme.primary : Colors.black38
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  _salesNettoController.setFilter(_.filterConsignment, 'consignment');
                                                },
                                              );
                                            }
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        color: ColorsBase.primary[10],
        child: GetBuilder(
          init: SalesNettoController(),
          builder: (resp) {
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
                        child: Text(
                          "Terapkan",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    _salesNettoController.setFilterApplyRecap();
                    Get.close(null);
                  },
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
