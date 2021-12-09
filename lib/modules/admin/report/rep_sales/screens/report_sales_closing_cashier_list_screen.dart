import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_closing_cashier_list_data_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_closing_cashier_recap_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_screen.dart';
import 'package:apotik_pulosari/modules/utility/controllers/panel_slide_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesClosingCashierListScreen extends StatelessWidget {
  final PanelSlideController _panelSlideController = Get.put(PanelSlideController());
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          _reportSalesController.readFirst();
        },
        child: Stack(
          children: [
            Container(
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
                                                "Periode",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportSales.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportSales.dateEnd.toString()))}",
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
                              Get.to(ReportSalesFilterScreen('', '', 'closing_cashier_list'), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                            },
                          )
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 88),
                      color: Colors.white,
                      child: GetBuilder(
                        init: ReportSalesController(),
                        builder: (resp) {
                          if (ModelReportSales.isLoading == true) {
                            return LoadingShimmerRecap();
                          } else {
                            if(ModelReportSales.getData.length > 0){
                              return SfDataGrid(
                                source: ReportSalesClosingCashierListDataScreen(ModelReportSales.getData),
                                frozenColumnsCount: 0,
                                headerRowHeight: 40,
                                rowHeight: 40,
                                gridLinesVisibility: GridLinesVisibility.none,
                                headerGridLinesVisibility: GridLinesVisibility.none,
                                headerCellBuilder: (contex, column) {
                                  switch (column.mappingName) {
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
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Tanggal',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        )
                                      );
                                      break;
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
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        )
                                      );
                                      break;
                                    case 'shift':
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
                                          'Shift',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        )
                                      );
                                      break;
                                    case 'time_at':
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
                                          'Jam Tutup',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        )
                                      );
                                      break;
                                    case 'cashier':
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
                                          'Kasir',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        )
                                      );
                                      break;
                                    case 'income_app':
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
                                          'Pendapatan Sistem',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        )
                                      );
                                      break;
                                    case 'income_real':
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
                                          'Pendapatan Fisik',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        )
                                      );
                                      break;
                                    case 'income_diff':
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
                                          'Selisih',
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
                                              DateFormat('dd-MM-yyyy', 'id_ID').format(DateTime.parse(ModelReportSales.getData[rowIndex]['created_at'])),
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                            )
                                          );
                                          break;
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
                                        case 'shift':
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
                                              ModelReportSales.getData[rowIndex]['shift'],
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                            )
                                          );
                                          break;
                                        case 'time_at':
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
                                              TextTransform.title(ModelReportSales.getData[rowIndex]['time_at']),
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                            )
                                          );
                                          break;
                                        case 'cashier':
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
                                              TextTransform.title(ModelReportSales.getData[rowIndex]['cashier']),
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                            )
                                          );
                                          break;
                                        case 'income_app':
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
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getData[rowIndex]['income_app'].toString()))),
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                            )
                                          );
                                          break;
                                        case 'income_real':
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
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getData[rowIndex]['income_real'].toString()))),
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            )
                                          );
                                          break;
                                        case 'income_diff':
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
                                              NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getData[rowIndex]['income_diff'].toString()))),
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: double.parse(ModelReportSales.getData[rowIndex]['income_diff'].toString()) > 0 ? Colors.black : ColorTheme.danger
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
                                    mappingName: 'created_at', 
                                    headerText: 'Tanggal',
                                    width: 114,
                                  ),
                                  GridWidgetColumn(
                                    mappingName: 'id', 
                                    headerText: 'ID',
                                    width: 152,
                                  ),
                                  GridWidgetColumn(
                                    mappingName: 'shift', 
                                    headerText: 'Shift',
                                    width: 80,
                                  ),
                                  GridWidgetColumn(
                                    mappingName: 'time_at', 
                                    headerText: 'Waktu',
                                    width: 104,
                                  ),
                                  GridWidgetColumn(
                                    mappingName: 'cashier', 
                                    headerText: 'Kasir',
                                    width: 104,
                                  ),
                                  GridWidgetColumn(
                                    mappingName: 'income_app', 
                                    headerText: 'Pendapatan Sistem',
                                    width: 152,
                                  ),
                                  GridWidgetColumn(
                                    mappingName: 'income_real', 
                                    headerText: 'Pendapatan Fisik',
                                    width: 152,
                                  ),
                                  GridWidgetColumn(
                                    mappingName: 'income_diff', 
                                    headerText: 'Selisih',
                                    width: 152,
                                  ),
                                ],
                                onCellTap: (details) {
                                  if (details.rowColumnIndex.rowIndex > 0) {
                                    Get.to(ReportSalesClosingCashierRecapListScreen(ModelReportSales.getData[details.rowColumnIndex.rowIndex - 1]), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                                    _reportSalesController.readDetail(ModelReportSales.getData[details.rowColumnIndex.rowIndex - 1]['id']);
                                  }
                                },
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
            SlidingUpPanel(
              maxHeight: 256,
              minHeight: 88,
              boxShadow: [
                BoxShadow(
                  color: ColorTheme.primary.withOpacity(0.08),
                  offset: Offset(0, -2),
                  blurRadius: 8,
                ),
              ],
              color: ColorTheme.third,
              parallaxEnabled: true,
              parallaxOffset: .5,
              panelBuilder: (scroll) => _panel(scroll, context),
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
              onPanelSlide: (pos) {
                _panelSlideController.setPanelHeight(pos);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }

  Widget _panel(ScrollController scroll, context){
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GetBuilder(
        init: ReportSalesController(),
        builder: (res) {
          return Container(
            child: GetBuilder(
              init: PanelSlideController(),
              builder: (resp) {
                return ListView(
                  controller: scroll,
                  children: <Widget>[
                    SizedBox(height: 24.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 32,
                          height: 4,
                          decoration: BoxDecoration(
                          color: Colors.white70,
                            borderRadius: BorderRadius.all(Radius.circular(16.0))
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Visibility(
                            visible: resp.isFull == false ? false : true,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 150),
                              opacity: resp.isFull == false ? 0 : 1, 
                              child: Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 16, bottom: 4),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                            "Total Sistem",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    ":",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        if(ModelReportSales.isLoading == true)
                                                          SpinKitThreeBounce(
                                                            color: Colors.white,
                                                            size: 16.0,
                                                          )
                                                        else
                                                          Text(
                                                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelReportSales.getDataHeader['total_income_app'].toString())),
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w600
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                            "Total Fisik",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    ":",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        if(ModelReportSales.isLoading == true)
                                                          SpinKitThreeBounce(
                                                            color: Colors.white,
                                                            size: 16.0,
                                                          )
                                                        else
                                                          Text(
                                                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelReportSales.getDataHeader['total_income_real'].toString())),
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w600
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white54,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Total Selisih",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        if(ModelReportSales.isLoading == true)
                                          SpinKitThreeBounce(
                                            color: Colors.white,
                                            size: 16.0,
                                          )
                                        else
                                          Text(
                                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(ModelReportSales.getDataHeader['total_income_diff'].toString())),
                                            style: TextStyle(
                                              fontSize: resp.isFull == false ? 16 : 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                      ],
                                    ),
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
          );
        },
      ),
    );
  }
}
