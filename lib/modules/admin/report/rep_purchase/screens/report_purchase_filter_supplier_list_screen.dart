import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_autocomplete_supplier_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportPurchaseFilterSupplierListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Supplier",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GetBuilder(
                              init: ReportPurchaseController(),
                              builder: (_) {
                                return Container(
                                  child: TextFormField(
                                    controller: TextEditingController(text: ModelReportPurchase.supplierPersonsName),
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
                                      suffixIcon: Icon(
                                        Mdi.magnify
                                      ),
                                    ),
                                    onTap: () {
                                      showSearch(context: context, delegate: ReportPurchaseAutoCompleteSupplierScreen());
                                    },
                                  ),
                                );
                              }
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
    );
  }
}
