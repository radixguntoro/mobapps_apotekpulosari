import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportSalesFilterCustomerListScreen extends StatelessWidget {
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: double.infinity,
                      child: Text(
                        "Tipe Penjualan",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          for (var item in ModelReportSales.getSalesCustomer)
                            WidgetSpan(
                              child: GetBuilder(
                                init: ReportSalesController(),
                                builder: (_) {
                                  return InkWell(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 8, right: 8),
                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: _.filterSalesTypeSingle == item['id'] ? ColorTheme.primary : Colors.black26, 
                                          width: 1
                                        ),
                                        color: _.filterSalesTypeSingle == item['id'] ? ColorsBase.primary[50] : Colors.white,
                                      ),
                                      child: Text(
                                        TextTransform.title(item['name']),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: _.filterSalesTypeSingle == item['id'] ? ColorTheme.primary : Colors.black38,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      _reportSalesController.setFilterSalesTypeSingle(item['id']);
                                    },
                                  );
                                }
                              )
                            )
                            
                        ]
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: double.infinity,
                      child: Text(
                        "Status",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    GetBuilder(
                      init: ReportSalesController(),
                      builder: (_) {
                        return Visibility(
                          visible: _.filterSalesTypeSingle == '306' ? true : false,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                for (var item in ModelReportSales.getSalesStatus)
                                  WidgetSpan(
                                    child: GetBuilder(
                                      init: ReportSalesController(),
                                      builder: (_) {
                                        return InkWell(
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 8, right: 8),
                                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: _.filterSalesStatus.contains(item['id']) == false ? ColorTheme.primary : Colors.black26, 
                                                width: 1
                                              ),
                                              color: _.filterSalesStatus.contains(item['id']) == false ? ColorsBase.primary[50] : Colors.white,
                                            ),
                                            child: Text(
                                              TextTransform.title(item['name']),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: _.filterSalesStatus.contains(item['id']) == false ? ColorTheme.primary : Colors.black38,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            _reportSalesController.setFilterSalesStatus(item['id']);
                                          },
                                        );
                                      }
                                    )
                                  )
                                  
                              ]
                            ),
                          ),
                        );
                      }
                    ),
                    GetBuilder(
                      init: ReportSalesController(),
                      builder: (_) {
                        return Visibility(
                          visible: _.filterSalesTypeSingle == '307' ? true : false,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                for (var item in ModelReportSales.getSalesStatus)
                                  if(item['id'] == 'credit' || item['id'] == 'paid')
                                  WidgetSpan(
                                    child: GetBuilder(
                                      init: ReportSalesController(),
                                      builder: (_) {
                                        return InkWell(
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 8, right: 8),
                                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: _.filterSalesStatus.contains(item['id']) == false ? ColorTheme.primary : Colors.black26, 
                                                width: 1
                                              ),
                                              color: _.filterSalesStatus.contains(item['id']) == false ? ColorsBase.primary[50] : Colors.white,
                                            ),
                                            child: Text(
                                              TextTransform.title(item['name']),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: _.filterSalesStatus.contains(item['id']) == false ? ColorTheme.primary : Colors.black38,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            _reportSalesController.setFilterSalesStatus(item['id']);
                                          },
                                        );
                                      }
                                    )
                                  )
                                  
                              ]
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
    );
  }
}
