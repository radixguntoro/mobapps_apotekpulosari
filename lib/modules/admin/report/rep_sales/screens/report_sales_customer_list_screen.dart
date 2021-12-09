import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_customer_recap_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_customer_list_data_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesCustomerListScreen extends StatelessWidget {
  final _scrollController = ScrollController();
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  
  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() { 
      _reportSalesController.setScroll(_scrollController);
    });
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          _reportSalesController.readFirst();
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
                        init: ReportSalesController(),
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
                                            "Tipe",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            _.filterSalesTypeSingle == '306' ? "Penjualan Netto" : "Penjualan Kredit",
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
                          Get.to(ReportSalesFilterScreen('', '', 'customer_list'), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                init: ReportSalesController(),
                                builder: (resp) {
                                  if (ModelReportSales.isLoading == true) {
                                    return Container(
                                      child: SpinKitThreeBounce(
                                        color: Colors.white,
                                        size: 16.0,
                                      )
                                    );
                                  } else {
                                    return Text(
                                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(ModelReportSales.getDataHeader['total_invoice'].toString())),
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
                                init: ReportSalesController(),
                                builder: (resp) {
                                  if (ModelReportSales.isLoading == true) {
                                    return Container(
                                      child: SpinKitThreeBounce(
                                        color: Colors.black,
                                        size: 16.0,
                                      )
                                    );
                                  } else {
                                    return Text(
                                      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(ModelReportSales.getDataHeader['total_billing'].toString())),
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
                    init: ReportSalesController(),
                    builder: (resp) {
                      if (ModelReportSales.isLoading == true) {
                        return LoadingShimmerRecap();
                      } else {
                        if(ModelReportSales.getData.length > 0){
                          return SfDataGrid(
                            source: ReportSalesCustomerListDataScreen(ModelReportSales.getData),
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
                                case 'total_sales':
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
                              if (ModelReportSales.isLoading == true) {
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
                                          ModelReportSales.getData[rowIndex]['id'].toString(),
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
                                          ModelReportSales.getData[rowIndex]['name'],
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
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getData[rowIndex]['total_invoice'].toString())))
                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        )
                                      );
                                      break;
                                    case 'total_sales':
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
                                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportSales.getData[rowIndex]['total_sales'].toString())))
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
                                width: 256,
                              ),
                              GridWidgetColumn(
                                mappingName: 'total_invoice', 
                                headerText: 'Nota',
                                width: 104,
                              ),
                              GridWidgetColumn(
                                mappingName: 'total_sales', 
                                headerText: 'Tagihan',
                                width: 144,
                              ),
                            ],
                            onCellTap: (details) {
                              if (details.rowColumnIndex.rowIndex > 0 && ModelReportSales.getData[details.rowColumnIndex.rowIndex - 1]['total_invoice'] > 0) {
                                var date = [(ModelReportSales.getData[details.rowColumnIndex.rowIndex - 1]['date_start']), ModelReportSales.getData[details.rowColumnIndex.rowIndex - 1]['date_end']];
                                _reportSalesController.setDate(date, 'dateRange');
                                _reportSalesController.readDetail(ModelReportSales.getData[details.rowColumnIndex.rowIndex - 1]['id']);
                                Get.to(ReportSalesCustomerRecapListScreen(ModelReportSales.getData[details.rowColumnIndex.rowIndex - 1]), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                              } else {
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
                                            margin: EdgeInsets.only(top: 16, bottom: 24),
                                            width: 120,
                                            child: Image(
                                              image: AssetImage("assets/images/icons/state_page/noresult.png"),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            child: Text(
                                              "Oops!",
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
                                              "Tidak ada nota untuk supplier ini.",
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
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                    color: Colors.grey[100]
                                                  ),
                                                  child: FlatButton(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                    child: Text(
                                                      "Tutup",
                                                    ),
                                                    onPressed: () async {
                                                      Get.close(null);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                );
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
                            //       columnNames: ['total_sales_netto', 'total_sales_credit'],
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
