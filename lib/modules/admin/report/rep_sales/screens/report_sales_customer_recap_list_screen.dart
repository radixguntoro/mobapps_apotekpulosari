import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_customer_recap_list_data_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_recap_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_filter_screen.dart';
import 'package:apotik_pulosari/modules/utility/controllers/panel_slide_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSalesCustomerRecapListScreen extends StatelessWidget {
  final PanelSlideController _panelSlideController = Get.put(PanelSlideController());
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  final data;

  ReportSalesCustomerRecapListScreen(
    this.data
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _panelSlideController.setPanelHeight(0);
        _reportSalesController.setClearFilterRecap();
        Get.close(null);
        return null;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              data['id'].toString(),
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
                _panelSlideController.setPanelHeight(0);
                _reportSalesController.setClearFilterRecap();
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
                color: ColorsBase.primary[50],
                boxShadow: [
                  BoxShadow(
                    color: ColorTheme.primary.withOpacity(0.16),
                    offset: Offset(0, -4),
                    blurRadius: 8,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 72,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              "Tipe",
                              style: TextStyle(
                                fontSize: 10,
                                color: ColorTheme.third
                              ),
                            ),
                          ),
                          Container(
                            child: GetBuilder(
                              init: ReportSalesController(),
                              builder: (resp) {
                                return Text(
                                  TextTransform.title(resp.filterSalesTypeSingle == '306' ? "Penjualan Netto" : "Penjualan Kredit"),
                                  style: TextStyle(
                                    color: ColorTheme.third,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
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
                                              data['name'].toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12
                                              ),
                                            ),
                                          ),
                                          GetBuilder(
                                            init: ReportSalesController(),
                                            builder: (resp) {
                                              return Container(
                                                child: Text(
                                                  "${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(ModelReportSales.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(ModelReportSales.dateEnd.toString()))}",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              );
                                            }
                                          ),
                                        ],
                                      ),
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
                                Get.to(ReportSalesFilterScreen(data, ModelReportSales.getDataRecap, 'customer_detail'), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(ModelReportSales.getDataRecap['total_invoice'].toString())),
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
                                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(ModelReportSales.getDataRecap['total_sales'].toString())),
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
                              if(ModelReportSales.getDataRecap['data'].length > 0){
                                return SfDataGrid(
                                  source: ReportSalesCustomerRecapListDataScreen(ModelReportSales.getDataRecap['data']),
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
                                            textAlign: TextAlign.left,
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
                                            'No. Transaksi',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
                                            ),
                                          )
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
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Status',
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
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Kasir',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
                                            ),
                                          )
                                        );
                                        break;
                                      case 'grand_total':
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
                                            'Grand Total',
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
                                                DateFormat('dd-MM-yyyy HH:mm').format(DateTime.parse(ModelReportSales.getDataRecap['data'][rowIndex]['created_at'])),
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
                                                ModelReportSales.getDataRecap['data'][rowIndex]['id'].toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54
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
                                                  ModelReportSales.getDataRecap['data'][rowIndex]['status_title'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color:  ModelReportSales.getDataRecap['data'][rowIndex]['status'] == 'credit' ? ColorTheme.danger :  ModelReportSales.getDataRecap['data'][rowIndex]['status'] == 'cod' ? ColorTheme.warningColor :  ModelReportSales.getDataRecap['data'][rowIndex]['status'] == 'consignment' ? Colors.blue : ColorTheme.successColor,
                                                  borderRadius: BorderRadius.circular(4),
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
                                                TextTransform.title(ModelReportSales.getDataRecap['data'][rowIndex]['cashier_name']),
                                                style: TextStyle(
                                                  fontSize: 12
                                                ),
                                              )
                                            );
                                            break;
                                          case 'grand_total':
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
                                                NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportSales.getDataRecap['data'][rowIndex]['grand_total'].toString()))),
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
                                      mappingName: 'created_at', 
                                      headerText: 'Tanggal',
                                      width: 152,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'id', 
                                      headerText: 'ID',
                                      width: 152,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'status', 
                                      headerText: 'status',
                                      width: 120,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'cashier_name', 
                                      headerText: 'Kasir',
                                      width: 104,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'grand_total', 
                                      headerText: 'Grand Total',
                                      width: 144,
                                    ),
                                  ],
                                  onCellTap: (details) {
                                    if (details.rowColumnIndex.rowIndex > 0) {
                                      Get.to(ReportSalesRecapDetailScreen(ModelReportSales.getDataRecap['data'][details.rowColumnIndex.rowIndex - 1]), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                                      _reportSalesController.readDetailRecap(ModelReportSales.getDataRecap['data'][details.rowColumnIndex.rowIndex - 1]['id'], ModelReportSales.getDataRecap['data'][details.rowColumnIndex.rowIndex - 1]['codes_id']);
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
            ),
            // SlidingUpPanel(
            //   maxHeight: 256,
            //   minHeight: 88,
            //   boxShadow: [
            //     BoxShadow(
            //       color: ColorTheme.primary.withOpacity(0.08),
            //       offset: Offset(0, -2),
            //       blurRadius: 8,
            //     ),
            //   ],
            //   color: ColorTheme.third,
            //   parallaxEnabled: true,
            //   parallaxOffset: .5,
            //   panelBuilder: (scroll) => _panel(scroll, context),
            //   // borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
            //   onPanelSlide: (pos) {
            //     _panelSlideController.setPanelHeight(pos);
            //   },
            // ),
          ]
        ),
      ),
    );
  }

  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }

  // Widget _panel(ScrollController scroll, context){
  //   return MediaQuery.removePadding(
  //     context: context,
  //     removeTop: true,
  //     child: GetBuilder(
  //       init: ReportSalesController(),
  //       builder: (res) {
  //         return Container(
  //           child: GetBuilder(
  //             init: PanelSlideController(),
  //             builder: (resp) {
  //               return ListView(
  //                 controller: scroll,
  //                 children: <Widget>[
  //                   SizedBox(height: 24.0,),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: <Widget>[
  //                       Container(
  //                         width: 32,
  //                         height: 4,
  //                         decoration: BoxDecoration(
  //                         color: Colors.white70,
  //                           borderRadius: BorderRadius.all(Radius.circular(16.0))
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.all(16),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         Visibility(
  //                           visible: resp.isFull == false ? false : true,
  //                           child: AnimatedOpacity(
  //                             duration: Duration(milliseconds: 150),
  //                             opacity: resp.isFull == false ? 0 : 1, 
  //                             child: Container(
  //                               margin: EdgeInsets.only(bottom: 8),
  //                               child: Column(
  //                                 children: [
  //                                   Container(
  //                                     padding: EdgeInsets.only(top: 16, bottom: 4),
  //                                     child: Column(
  //                                       children: [
  //                                         Container(
  //                                           margin: EdgeInsets.only(bottom: 8),
  //                                           child: Row(
  //                                             children: [
  //                                               Expanded(
  //                                                 flex: 3,
  //                                                 child: Container(
  //                                                   child: Column(
  //                                                     crossAxisAlignment: CrossAxisAlignment.start,
  //                                                     children: <Widget>[
  //                                                       Container(
  //                                                         child: Text(
  //                                                           "Subtotal",
  //                                                           style: TextStyle(
  //                                                             color: Colors.white,
  //                                                             fontSize: 12,
  //                                                           ),
  //                                                         ),
  //                                                       ),
  //                                                     ],
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               Expanded(
  //                                                 flex: 1,
  //                                                 child: Text(
  //                                                   ":",
  //                                                   style: TextStyle(
  //                                                     color: Colors.white,
  //                                                     fontSize: 12,
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               Expanded(
  //                                                 flex: 6,
  //                                                 child: Container(
  //                                                   child: Column(
  //                                                     crossAxisAlignment: CrossAxisAlignment.end,
  //                                                     children: [
  //                                                       if(ModelReportSales.isLoading == true)
  //                                                         SpinKitThreeBounce(
  //                                                           color: Colors.white,
  //                                                           size: 16.0,
  //                                                         )
  //                                                       else
  //                                                         Text(
  //                                                           NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: ModelReportSales.getDataDetail['codesId'] == '306' ? 2 : 0).format((double.parse(ModelReportSales.getDataDetail['total'].toString()))),
  //                                                           style: TextStyle(
  //                                                             color: Colors.white,
  //                                                             fontSize: 14,
  //                                                             fontWeight: FontWeight.w600
  //                                                           ),
  //                                                         ),
  //                                                     ],
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         ),
  //                                         Container(
  //                                           child: Row(
  //                                             children: [
  //                                               Expanded(
  //                                                 flex: 3,
  //                                                 child: Container(
  //                                                   child: Column(
  //                                                     crossAxisAlignment: CrossAxisAlignment.start,
  //                                                     children: <Widget>[
  //                                                       Container(
  //                                                         child: Text(
  //                                                           "Potongan",
  //                                                           style: TextStyle(
  //                                                             color: Colors.white,
  //                                                             fontSize: 12,
  //                                                           ),
  //                                                         ),
  //                                                       ),
  //                                                     ],
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               Expanded(
  //                                                 flex: 1,
  //                                                 child: Text(
  //                                                   ":",
  //                                                   style: TextStyle(
  //                                                     color: Colors.white,
  //                                                     fontSize: 12,
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               Expanded(
  //                                                 flex: 6,
  //                                                 child: Container(
  //                                                   child: Column(
  //                                                     crossAxisAlignment: CrossAxisAlignment.end,
  //                                                     children: [
  //                                                       if(ModelReportSales.isLoading == true)
  //                                                         SpinKitThreeBounce(
  //                                                           color: Colors.white,
  //                                                           size: 16.0,
  //                                                         )
  //                                                       else
  //                                                         Text(
  //                                                           NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: ModelReportSales.getDataDetail['codesId'] == '306' ? 2 : 0).format((double.parse(ModelReportSales.getDataDetail['discount'].toString()))),
  //                                                           style: TextStyle(
  //                                                             color: Colors.white,
  //                                                             fontSize: 14,
  //                                                           ),
  //                                                         ),
  //                                                     ],
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Divider(
  //                                     color: Colors.white54,
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Container(
  //                           margin: EdgeInsets.only(bottom: 8),
  //                           child: Row(
  //                             children: [
  //                               Expanded(
  //                                 flex: 3,
  //                                 child: Container(
  //                                   child: Column(
  //                                     crossAxisAlignment: CrossAxisAlignment.start,
  //                                     children: <Widget>[
  //                                       Container(
  //                                         child: Text(
  //                                           "Total",
  //                                           style: TextStyle(
  //                                             color: Colors.white,
  //                                             fontSize: 12,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ),
  //                               Expanded(
  //                                 flex: 1,
  //                                 child: Text(
  //                                   ":",
  //                                   style: TextStyle(
  //                                     color: Colors.white,
  //                                     fontSize: 12,
  //                                   ),
  //                                 ),
  //                               ),
  //                               Expanded(
  //                                 flex: 6,
  //                                 child: Container(
  //                                   child: Column(
  //                                     crossAxisAlignment: CrossAxisAlignment.end,
  //                                     children: [
  //                                       if(ModelReportSales.isLoading == true)
  //                                         SpinKitThreeBounce(
  //                                           color: Colors.white,
  //                                           size: 16.0,
  //                                         )
  //                                       else
  //                                         Text(
  //                                           NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: ModelReportSales.getDataDetail['codesId'] == '306' ? 2 : 0).format((double.parse(ModelReportSales.getDataDetail['grandTotal'].toString()))),
  //                                           style: TextStyle(
  //                                             fontSize: resp.isFull == false ? 16 : 14,
  //                                             color: Colors.white,
  //                                             fontWeight: FontWeight.w600
  //                                           ),
  //                                         ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         ModelReportSales.getDataDetail['codesId'] == '306' || ModelReportSales.getDataDetail['codesId'] == '307' ? Container() : Visibility(
  //                           visible: resp.isFull == false ? false : true,
  //                           child: AnimatedOpacity(
  //                             duration: Duration(milliseconds: 150),
  //                             opacity: resp.isFull == false ? 0 : 1, 
  //                             child: Container(
  //                               margin: EdgeInsets.only(bottom: 8),
  //                               child: Column(
  //                                 children: [
  //                                   Container(
  //                                     margin: EdgeInsets.only(bottom: 8),
  //                                     child: Row(
  //                                       children: [
  //                                         Expanded(
  //                                           flex: 3,
  //                                           child: Container(
  //                                             child: Column(
  //                                               crossAxisAlignment: CrossAxisAlignment.start,
  //                                               children: <Widget>[
  //                                                 Container(
  //                                                   child: Text(
  //                                                     "Tunai",
  //                                                     style: TextStyle(
  //                                                       color: Colors.white,
  //                                                       fontSize: 12,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         Expanded(
  //                                           flex: 1,
  //                                           child: Text(
  //                                             ":",
  //                                             style: TextStyle(
  //                                               color: Colors.white,
  //                                               fontSize: 12,
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         Expanded(
  //                                           flex: 6,
  //                                           child: Container(
  //                                             child: Column(
  //                                               crossAxisAlignment: CrossAxisAlignment.end,
  //                                               children: [
  //                                                 if(ModelReportSales.isLoading == true)
  //                                                   SpinKitThreeBounce(
  //                                                     color: Colors.white,
  //                                                     size: 16.0,
  //                                                   )
  //                                                 else
  //                                                   Text(
  //                                                     NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getDataDetail['payment'].toString()))),
  //                                                     style: TextStyle(
  //                                                       color: Colors.white,
  //                                                       fontSize: 14,
  //                                                       fontWeight: FontWeight.w600
  //                                                     ),
  //                                                   ),
  //                                               ],
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Divider(
  //                                     color: Colors.white54,
  //                                   ),
  //                                   Container(
  //                                     margin: EdgeInsets.only(top: 8),
  //                                     child: Row(
  //                                       children: [
  //                                         Expanded(
  //                                           flex: 3,
  //                                           child: Container(
  //                                             child: Column(
  //                                               crossAxisAlignment: CrossAxisAlignment.start,
  //                                               children: <Widget>[
  //                                                 Container(
  //                                                   child: Text(
  //                                                     "Kembali",
  //                                                     style: TextStyle(
  //                                                       color: Colors.white,
  //                                                       fontSize: 12,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         Expanded(
  //                                           flex: 1,
  //                                           child: Text(
  //                                             ":",
  //                                             style: TextStyle(
  //                                               color: Colors.white,
  //                                               fontSize: 12,
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         Expanded(
  //                                           flex: 6,
  //                                           child: Container(
  //                                             child: Column(
  //                                               crossAxisAlignment: CrossAxisAlignment.end,
  //                                               children: [
  //                                                 if(ModelReportSales.isLoading == true)
  //                                                   SpinKitThreeBounce(
  //                                                     color: Colors.white,
  //                                                     size: 16.0,
  //                                                   )
  //                                                 else
  //                                                   Text(
  //                                                     NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getDataDetail['balance'].toString()))),
  //                                                     style: TextStyle(
  //                                                       color: Colors.white,
  //                                                       fontSize: 14,
  //                                                       fontWeight: FontWeight.w600
  //                                                     ),
  //                                                   ),
  //                                               ],
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             }
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
