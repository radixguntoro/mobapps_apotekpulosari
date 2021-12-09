import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/controllers/report_stock_opname_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/models/model_report_stock_opname.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/screens/report_stock_opname_filter_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_stock_opname/screens/report_stock_opname_recap_list_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportStockOpnameRecapListScreen extends StatelessWidget {
  final ReportStockOpnameController _reportStockOpnameController = Get.put(ReportStockOpnameController());
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: GetBuilder(
                      init: ReportStockOpnameController(),
                      builder: (_) {
                        return Container(
                          height: 64,
                          color: ColorTheme.secondary,
                          child: Container(
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
                                            "Periode",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "${DateFormat("MMMM yyyy", "id_ID").format(DateTime.parse(ModelReportStockOpname.dateStart.toString()))}",
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
                          ),
                        );
                      }
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 64,
                      color: ColorTheme.third.withOpacity(0.8),
                      padding: EdgeInsets.only(left: 16, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              "Total Barang",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Container(
                            child: GetBuilder(
                              init: ReportStockOpnameController(),
                              builder: (resp) {
                                if (ModelReportStockOpname.isLoading == true) {
                                  return Container(
                                    child: SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 16.0,
                                    )
                                  );
                                } else {
                                  return Text(
                                    NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelReportStockOpname.totalData),
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
                        Get.to(ReportStockOpnameFilterScreen('item_list'), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                      },
                    )
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: GetBuilder(
                  init: ReportStockOpnameController(),
                  builder: (resp) {
                    if (ModelReportStockOpname.isLoading == true) {
                      return LoadingShimmerRecap();
                    } else {
                      if(ModelReportStockOpname.getData.length > 0){
                        return SfDataGrid(
                          source: ReportStockOpnameRecapListDataScreen(ModelReportStockOpname.getData),
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
                                    'SKU',
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
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Visibility(
                                        visible: resp.sortName == 'none' ? false : true,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 4),
                                          child: Icon(
                                            resp.sortName == 'asc' ? Mdi.arrowUp : Mdi.arrowDown,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Nama',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  )
                                );
                                break;
                              case 'category':
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
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Kategori',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                );
                                break;
                              case 'price_sell':
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
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Harga Jual',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                );
                                break;
                              case 'status':
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
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Visibility(
                                        visible: resp.sortStatus == 'none' ? false : true,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 4),
                                          child: Icon(
                                            resp.sortName == 'asc' ? Mdi.arrowUp : Mdi.arrowDown,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Status S.O',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  )
                                );
                                break;
                              case 'created_at':
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
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Tanggal S.O',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                                );
                                break;
                              case 'cashier_name':
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
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Kasir',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                );
                                break;
                              case 'stock_in_system':
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
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Visibility(
                                      //   visible: resp.sortStock == 'none' ? false : true,
                                      //   child: Container(
                                      //     margin: EdgeInsets.only(right: 4),
                                      //     child: Icon(
                                      //       resp.sortStock == 'asc' ? Mdi.arrowDown : Mdi.arrowUp,
                                      //       size: 16,
                                      //       color: Colors.white,
                                      //     ),
                                      //   ),
                                      // ),
                                      Text(
                                        'Sistem',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  )
                                );
                                break;
                              case 'stock_in_physic':
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
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Visibility(
                                      //   visible: resp.sortStock == 'none' ? false : true,
                                      //   child: Container(
                                      //     margin: EdgeInsets.only(right: 4),
                                      //     child: Icon(
                                      //       resp.sortStock == 'asc' ? Mdi.arrowDown : Mdi.arrowUp,
                                      //       size: 16,
                                      //       color: Colors.white,
                                      //     ),
                                      //   ),
                                      // ),
                                      Text(
                                        'Fisik',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  )
                                );
                                break;
                              case 'stock_difference':
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
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Visibility(
                                      //   visible: resp.sortStock == 'none' ? false : true,
                                      //   child: Container(
                                      //     margin: EdgeInsets.only(right: 4),
                                      //     child: Icon(
                                      //       resp.sortStock == 'asc' ? Mdi.arrowDown : Mdi.arrowUp,
                                      //       size: 16,
                                      //       color: Colors.white,
                                      //     ),
                                      //   ),
                                      // ),
                                      Text(
                                        'Selisih',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  )
                                );
                                break;
                              default:
                                return null;
                            }
                          },
                          cellBuilder: (BuildContext context, GridColumn column, int rowIndex){
                            if (ModelReportStockOpname.isLoading == true) {
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
                                        ModelReportStockOpname.getData[rowIndex]['id'].toString(),
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
                                        ModelReportStockOpname.getData[rowIndex]['name'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54
                                        ),
                                      )
                                    );
                                    break;
                                  case 'category':
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
                                        ModelReportStockOpname.getData[rowIndex]['category'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    );
                                    break;
                                  case 'price_sell':
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
                                        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelReportStockOpname.getData[rowIndex]['price_sell'].toString())),
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    );
                                    break;
                                  case 'status':
                                    return Container(
                                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
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
                                      child: Container(
                                        padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                                        child: Text(
                                          ModelReportStockOpname.getData[rowIndex]['status'] == 'none' ? 'Belum S.O' : 'Sudah S.O',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 10,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color:  ModelReportStockOpname.getData[rowIndex]['status'] == 'none' ? ColorTheme.danger : ColorTheme.successColor,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      )
                                    );
                                    break;
                                  case 'created_at':
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
                                        ModelReportStockOpname.getData[rowIndex]['status'] == 'none' ? '-' : DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.parse(ModelReportStockOpname.getData[rowIndex]['created_at'])),
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      )
                                    );
                                    break;
                                  case 'cashier_name':
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
                                        ModelReportStockOpname.getData[rowIndex]['status'] == 'none' ? '-' : TextTransform.title(ModelReportStockOpname.getData[rowIndex]['cashier_name']),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    );
                                    break;
                                  case 'stock_in_system':
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
                                        ModelReportStockOpname.getData[rowIndex]['status'] == 'none' ? '-' : NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((int.parse(ModelReportStockOpname.getData[rowIndex]['stock_in_system'].toString())))
                                        ,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      )
                                    );
                                    break;
                                  case 'stock_in_physic':
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
                                        ModelReportStockOpname.getData[rowIndex]['status'] == 'none' ? '-' : NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((int.parse(ModelReportStockOpname.getData[rowIndex]['stock_in_physic'].toString())))
                                        ,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      )
                                    );
                                    break;
                                  case 'stock_difference':
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
                                        ModelReportStockOpname.getData[rowIndex]['status'] == 'none' ? '-' : NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((int.parse(ModelReportStockOpname.getData[rowIndex]['stock_difference'].toString())))
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
                              headerText: 'SKU',
                              width: 128,
                            ),
                            GridWidgetColumn(
                              mappingName: 'name', 
                              headerText: 'Nama',
                              width: 336,
                            ),
                            GridWidgetColumn(
                              mappingName: 'category', 
                              headerText: 'Kategori',
                              width: 144,
                            ),
                            GridWidgetColumn(
                              mappingName: 'price_sell', 
                              headerText: 'Harga Jual',
                              width: 128,
                            ),
                            GridWidgetColumn(
                              mappingName: 'status', 
                              headerText: 'Status',
                              width: 128,
                            ),
                            GridWidgetColumn(
                              mappingName: 'created_at', 
                              headerText: 'Tanggal',
                              width: 128,
                            ),
                            GridWidgetColumn(
                              mappingName: 'cashier_name', 
                              headerText: 'Kasir',
                              width: 104,
                            ),
                            GridWidgetColumn(
                              mappingName: 'stock_in_system', 
                              headerText: 'Sistem',
                              width: 96,
                            ),
                            GridWidgetColumn(
                              mappingName: 'stock_in_physic', 
                              headerText: 'Fisik',
                              width: 96,
                            ),
                            GridWidgetColumn(
                              mappingName: 'stock_difference', 
                              headerText: 'Selish',
                              width: 96,
                            ),
                          ],
                          onCellTap: (details) {
                            if (details.rowColumnIndex.rowIndex == 0) {
                              _reportStockOpnameController.setSortData(details.column.mappingName);
                            }
                          },
                          // loadMoreViewBuilder: (BuildContext context, LoadMoreRows loadMoreRows) {
                          //   if(ModelReportStockOpname.isLoading == false) {
                          //     Future<String> loadRows() async {
                          //       // ignore: await_only_futures
                          //       await _reportStockOpnameController.readMore();
                          //       return Future<String>.value('Completed');
                          //     }
                          //     return FutureBuilder<String>(
                          //       initialData: 'loading',
                          //       future: loadRows(),
                          //       builder: (context, snapShot) {
                          //         if (snapShot.data == 'loading') {
                          //           return Container(
                          //             height: 48.0,
                          //             color: Colors.white,
                          //             width: double.infinity,
                          //             alignment: Alignment.center,
                          //             child: Container(
                          //               width: 24,
                          //               height: 24,
                          //               child: CircularProgressIndicator(
                          //                 strokeWidth: 3,
                          //                 valueColor: AlwaysStoppedAnimation(ColorTheme.primary)
                          //               ),
                          //             )
                          //           );
                          //         } else {
                          //           return SizedBox.fromSize(size: Size.zero);
                          //         }
                          //       },
                          //     );
                          //   }
                          //   return null;
                          // },
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
    );
  }

  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }
}
