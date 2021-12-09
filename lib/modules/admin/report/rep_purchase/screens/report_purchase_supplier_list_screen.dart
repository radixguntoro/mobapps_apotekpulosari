import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_filter_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_supplier_recap_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_supplier_list_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportPurchaseSupplierListScreen extends StatelessWidget {
  final _scrollController = ScrollController();
  final ReportPurchaseController _reportPurchaseController = Get.put(ReportPurchaseController());
  
  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() { 
      _reportPurchaseController.setScroll(_scrollController);
    });
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          _reportPurchaseController.readFirst();
        },
        child: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: GetBuilder(
                        init: ReportPurchaseController(),
                        builder: (_) {
                          return Container(
                            height: 64,
                            color: ColorTheme.secondary,
                            padding: EdgeInsets.only(left: 16, right: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            "Supplier",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            ModelReportPurchase.supplierPersonsName == '' ? 'SEMUA SUPPLIER' : ModelReportPurchase.supplierPersonsName,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                    Container(
                      width: 64,
                      height: 64,
                      color: ColorTheme.third,
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Icon(
                          Mdi.tune,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(ReportPurchaseFilterScreen('', '', 'supplier_list'), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                        },
                      )
                    ),
                  ],
                ),
              ), 
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 64,
                        color: ColorTheme.third,
                        padding: EdgeInsets.only(left: 16, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              child: Text(
                                "Total Nota",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Container(
                              child: GetBuilder(
                                init: ReportPurchaseController(),
                                builder: (resp) {
                                  if (resp.isLoading == true) {
                                    return Container(
                                      child: SpinKitThreeBounce(
                                        color: Colors.white,
                                        size: 16.0,
                                      )
                                    );
                                  } else {
                                    return Text(
                                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(ModelReportPurchase.getDataHeaderSupplier['total_invoice'].toString())),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  }
                                }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 64,
                        color: ColorsBase.primary[50],
                        padding: EdgeInsets.only(left: 16, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              child: Text(
                                "Total Tagihan",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Container(
                              child: GetBuilder(
                                init: ReportPurchaseController(),
                                builder: (resp) {
                                  if (resp.isLoading == true) {
                                    return Container(
                                      child: SpinKitThreeBounce(
                                        color: Colors.black,
                                        size: 16.0,
                                      )
                                    );
                                  } else {
                                    return Text(
                                      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(ModelReportPurchase.getDataHeaderSupplier['total_billing'].toString())),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  }
                                }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: GetBuilder(
                    init: ReportPurchaseController(),
                    builder: (resp) {
                      if (resp.isLoading == true) {
                        return LoadingShimmerRecap();
                      } else {
                        if(ModelReportPurchase.getDataSupplier.length > 0){
                          return SfDataGrid(
                            source: ReportPurchaseSupplierListDataScreen(ModelReportPurchase.getDataSupplier),
                            frozenColumnsCount: 0,
                            headerRowHeight: 40,
                            rowHeight: 40,
                            gridLinesVisibility: GridLinesVisibility.none,
                            headerGridLinesVisibility: GridLinesVisibility.none,
                            headerCellBuilder: (contex, column) {
                              switch (column.mappingName) {
                                case 'id':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'ID',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'name':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Nama',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'total_invoice':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Nota',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                case 'total_purchase':
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: ColorsBase.primary[100]
                                        ),
                                      ),
                                      color: ColorTheme.primary,
                                    ),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Tagihan',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  );
                                  break;
                                default:
                                  return null;
                              }
                            },
                            cellBuilder: (BuildContext context, GridColumn column, int rowIndex){
                              if (resp.isLoading == true) {
                                return null;
                              } else {
                                if (rowIndex != -1) {
                                  switch (column.mappingName) {
                                    case 'id':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          ModelReportPurchase.getDataSupplier[rowIndex]['id'].toString(),
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'name':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          ModelReportPurchase.getDataSupplier[rowIndex]['name'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54
                                          ),
                                        )
                                      );
                                      break;
                                    case 'total_invoice':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportPurchase.getDataSupplier[rowIndex]['total_invoice'].toString())))
                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'total_purchase':
                                      return Container(
                                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 16),
                                        decoration: BoxDecoration(
                                          color: (rowIndex+1) % 2 == 0 ? ColorsBase.primary[50] : Colors.white,
                                          border: Border(
                                            right: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                            bottom: BorderSide(
                                              color: ColorsBase.primary[100]
                                            ),
                                          )
                                        ),
                                        child: Text(
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportPurchase.getDataSupplier[rowIndex]['total_purchase'].toString())))
                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    default:
                                      return null;
                                  }
                                } else {
                                  return null;
                                }
                              }
                            },
                            columns: <GridColumn>[
                              GridWidgetColumn(
                                mappingName: 'id', 
                                headerText: 'ID',
                                width: 120,
                              ),
                              GridWidgetColumn(
                                mappingName: 'name', 
                                headerText: 'Nama',
                                width: 320,
                              ),
                              GridWidgetColumn(
                                mappingName: 'total_invoice', 
                                headerText: 'Nota',
                                width: 104,
                              ),
                              GridWidgetColumn(
                                mappingName: 'total_purchase', 
                                headerText: 'Tagihan',
                                width: 144,
                              ),
                            ],
                            onCellTap: (details) async {
                              if (details.rowColumnIndex.rowIndex > 0) {
                                var date = [(ModelReportPurchase.getDataSupplier[details.rowColumnIndex.rowIndex - 1]['date_start']), ModelReportPurchase.getDataSupplier[details.rowColumnIndex.rowIndex - 1]['date_end']];
                                _reportPurchaseController.setDate(date, 'dateRange');
                                _reportPurchaseController.readDetail(ModelReportPurchase.getDataSupplier[details.rowColumnIndex.rowIndex - 1]['id']);
                                Get.to(ReportPurchaseSupplierRecapListScreen(ModelReportPurchase.getDataSupplier[details.rowColumnIndex.rowIndex - 1]), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                              }
                            },
                            // stackedHeaderRows: <StackedHeaderRow>[
                            //   StackedHeaderRow(cells: [
                            //     StackedHeaderCell(
                            //       columnNames: ['id', 'name'],
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //           border: Border(
                            //             right: BorderSide(
                            //               color: ColorsBase.primary[100]
                            //             ),
                            //             bottom: BorderSide(
                            //               color: ColorsBase.primary[100]
                            //             ),
                            //           ),
                            //           color: ColorTheme.primary,
                            //         ),
                            //         child: Center(
                            //           child: Text(
                            //             'Pelanggan',
                            //             style: TextStyle(
                            //               color: Colors.white,
                            //               fontFamily: 'Montserrat',
                            //               fontSize: 10,
                            //               fontWeight: FontWeight.w600
                            //             ),
                            //           )
                            //         )
                            //       )
                            //     ),
                            //     StackedHeaderCell(
                            //       columnNames: ['total_invoice_netto', 'total_invoice_credit'],
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //           border: Border(
                            //             right: BorderSide(
                            //               color: ColorsBase.primary[100]
                            //             ),
                            //             bottom: BorderSide(
                            //               color: ColorsBase.primary[100]
                            //             ),
                            //           ),
                            //           color: ColorTheme.primary,
                            //         ),
                            //         child: Center(
                            //           child: Text(
                            //             'Total Nota',
                            //             style: TextStyle(
                            //               color: Colors.white,
                            //               fontFamily: 'Montserrat',
                            //               fontSize: 10,
                            //               fontWeight: FontWeight.w600
                            //             ),
                            //           ),
                            //         ),
                            //       )
                            //     ),
                            //     StackedHeaderCell(
                            //       columnNames: ['total_Purchase_netto', 'total_Purchase_credit'],
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //           border: Border(
                            //             bottom: BorderSide(
                            //               color: ColorsBase.primary[100]
                            //             ),
                            //           ),
                            //           color: ColorTheme.primary,
                            //         ),
                            //         child: Center(
                            //           child: Text(
                            //             'Total Tagihan',
                            //             style: TextStyle(
                            //               color: Colors.white,
                            //               fontFamily: 'Montserrat',
                            //               fontSize: 10,
                            //               fontWeight: FontWeight.w600
                            //             ),
                            //           )
                            //         )
                            //       )
                            //     )
                            //   ])
                            // ]
                          );
                        } else {
                          return _emptyData(context);
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }
}
