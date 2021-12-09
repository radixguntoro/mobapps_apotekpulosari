import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/controllers/report_purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/models/model_report_purchase.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_filter_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_supplier_recap_list_data_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_purchase/screens/report_purchase_recap_detail_screen.dart';
import 'package:apotik_pulosari/modules/utility/controllers/panel_slide_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportPurchaseSupplierRecapListScreen extends StatelessWidget {
  final PanelSlideController _panelSlideController = Get.put(PanelSlideController());
  final ReportPurchaseController _reportPurchaseController = Get.put(ReportPurchaseController());
  final data;

  ReportPurchaseSupplierRecapListScreen(
    this.data
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _panelSlideController.setPanelHeight(0);
        _reportPurchaseController.setClearFilterRecap();
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
                _reportPurchaseController.setClearFilterRecap();
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
                              init: ReportPurchaseController(),
                              builder: (resp) {
                                return Text(
                                  "Pembelian",
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
                                            init: ReportPurchaseController(),
                                            builder: (resp) {
                                              return Container(
                                                child: Text(
                                                  "${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(ModelReportPurchase.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", 'id_ID').format(DateTime.parse(ModelReportPurchase.dateEnd.toString()))}",
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
                                Get.to(ReportPurchaseFilterScreen(data, ModelReportPurchase.getDataRecap, 'supplier_detail'), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(ModelReportPurchase.getDataRecap['total_invoice'].toString())),
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
                                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(double.parse(ModelReportPurchase.getDataRecap['total_purchase'].toString())),
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
                              if(ModelReportPurchase.getDataRecap['data'].length > 0){
                                return SfDataGrid(
                                  source: ReportPurchaseSupplierRecapListDataScreen(ModelReportPurchase.getDataRecap['data']),
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
                                      case 'total':
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
                                            'Total',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
                                            ),
                                          )
                                        );
                                        break;
                                      case 'discount':
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
                                            'Diskon',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
                                            ),
                                          )
                                        );
                                        break;
                                      case 'subtotal':
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
                                            'Subtotal',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
                                            ),
                                          )
                                        );
                                        break;
                                      case 'ppn':
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
                                            'PPN',
                                            textAlign: TextAlign.start,
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
                                            color: ColorTheme.primary,
                                          ),
                                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Grand Total',
                                            textAlign: TextAlign.start,
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
                                                DateFormat('dd-MM-yyyy HH:mm').format(DateTime.parse(ModelReportPurchase.getDataRecap['data'][rowIndex]['created_at'])),
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
                                                ModelReportPurchase.getDataRecap['data'][rowIndex]['id'].toString(),
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
                                                  ModelReportPurchase.getDataRecap['data'][rowIndex]['status'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color:  ModelReportPurchase.getDataRecap['data'][rowIndex]['status_id'] == 'credit' ? ColorTheme.danger :  ModelReportPurchase.getDataRecap['data'][rowIndex]['status_id'] == 'cod' ? ColorTheme.warningColor :  ModelReportPurchase.getDataRecap['data'][rowIndex]['status_id'] == 'consignment' ? Colors.blue : ColorTheme.successColor,
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
                                                TextTransform.title(ModelReportPurchase.getDataRecap['data'][rowIndex]['cashier_name']),
                                                style: TextStyle(
                                                  fontSize: 12
                                                ),
                                              )
                                            );
                                            break;
                                          case 'total':
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
                                                NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportPurchase.getDataRecap['data'][rowIndex]['total'].toString())))
                                                ,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: 12
                                                ),
                                              )
                                            );
                                            break;
                                          case 'discount':
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
                                                NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportPurchase.getDataRecap['data'][rowIndex]['discount'].toString())))
                                                ,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: 12
                                                ),
                                              )
                                            );
                                            break;
                                          case 'subtotal':
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
                                                NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportPurchase.getDataRecap['data'][rowIndex]['subtotal'].toString())))
                                                ,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: 12
                                                ),
                                              )
                                            );
                                            break;
                                          case 'ppn':
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
                                              child: Container(
                                                child: Container(
                                                  width: 18,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                    color: double.parse(ModelReportPurchase.getDataRecap['data'][rowIndex]['ppn']) > 0 ? ColorTheme.successColor :ColorTheme.danger,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    double.parse(ModelReportPurchase.getDataRecap['data'][rowIndex]['ppn']) > 0 ? Mdi.check : Mdi.close,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                ),
                                              ),
                                            );
                                            break;
                                          case 'grand_total':
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
                                                NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2).format((double.parse(ModelReportPurchase.getDataRecap['data'][rowIndex]['grand_total'].toString())))
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
                                      headerText: 'Status',
                                      width: 120,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'cashier_name', 
                                      headerText: 'Kasir',
                                      width: 104,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'total', 
                                      headerText: 'Total',
                                      width: 144,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'discount', 
                                      headerText: 'Diskon',
                                      width: 144,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'subtotal', 
                                      headerText: 'Subtotal',
                                      width: 144,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'ppn', 
                                      headerText: 'PPN',
                                      width: 72,
                                    ),
                                    GridWidgetColumn(
                                      mappingName: 'grand_total', 
                                      headerText: 'Grand Total',
                                      width: 144,
                                    ),
                                  ],
                                  onCellTap: (details) {
                                    if (details.rowColumnIndex.rowIndex > 0) {
                                      Get.to(ReportPurchaseRecapDetailScreen(ModelReportPurchase.getDataRecap['data'][details.rowColumnIndex.rowIndex - 1]), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                                      _reportPurchaseController.readDetailRecap(ModelReportPurchase.getDataRecap['data'][details.rowColumnIndex.rowIndex - 1]['id']);
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
          ]
        ),
      ),
    );
  }

  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }
}
