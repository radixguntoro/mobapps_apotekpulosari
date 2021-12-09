import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/controllers/report_sales_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/models/model_report_sales.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_recap_detail_data_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_sales/screens/report_sales_recap_detail_lab_result_screen.dart';
import 'package:apotik_pulosari/modules/utility/controllers/panel_slide_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ReportSalesRecapDetailScreen extends StatelessWidget {
  final PanelSlideController _panelSlideController = Get.put(PanelSlideController());
  final ReportSalesController _reportSalesController = Get.put(ReportSalesController());
  final data;

  ReportSalesRecapDetailScreen(
    this.data
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _panelSlideController.setPanelHeight(0);
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
                      child: Row(
                        children: [
                          Expanded(
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
                                  child: Text(
                                    "Penjualan ${data['title']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: ColorTheme.third
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                              color: ColorTheme.secondary,
                              padding: EdgeInsets.only(left: 16, right: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   margin: EdgeInsets.only(right: 12),
                                  //   child: Icon(
                                  //     Mdi.calendarMonth,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 6),
                                            child: Text(
                                              "Tanggal",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              DateFormat("dd MMM yyyy HH:mm", "id_ID").format(DateTime.parse(data['created_at'])),
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
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 64,
                              color: ColorTheme.third,
                              padding: EdgeInsets.only(left: 16, right: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   margin: EdgeInsets.only(right: 12),
                                  //   child: Icon(
                                  //     Mdi.account,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 6),
                                            child: Text(
                                              "Kasir",
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              TextTransform.title(data['cashier_name']),
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
                          ),
                          Container(
                            width: 64,
                            height: 64,
                            color: ColorTheme.third.withOpacity(0.8),
                            child: IconButton(
                              icon: Icon(
                                Mdi.printer,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _reportSalesController.exportToPDF(data['codes_id']);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    GetBuilder(
                      init: ReportSalesController(),
                      builder: (resp) {
                        if (ModelReportSales.isLoading == true) {
                          return Container();
                        } else {
                          return ModelReportSales.getDataDetail['codesId'] != '301' ? 
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      height: 64,
                                      color: ModelReportSales.getDataDetail['codesId'] == '306' ||ModelReportSales.getDataDetail['codesId'] == '307' ? ColorTheme.primary : ColorTheme.third,
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
                                                      ModelReportSales.getDataDetail['codesId'] == '306' ||ModelReportSales.getDataDetail['codesId'] == '307' ?  "Pelanggan" : "Pasien",
                                                      style: TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 10
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      ModelReportSales.getDataDetail['codesId'] == '306' ||ModelReportSales.getDataDetail['codesId'] == '307' ?
                                                      (ModelReportSales.getDataDetail['customer'] != null ? ModelReportSales.getDataDetail['customer']['name'].toUpperCase() : "-") :
                                                      (ModelReportSales.getDataDetail['patient'] != null ? TextTransform.title(ModelReportSales.getDataDetail['patient']) : "-"),
                                                      overflow: TextOverflow.ellipsis,
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
                                  ),
                                  ModelReportSales.getDataDetail['codesId'] == '302' ?
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 64,
                                              color: ColorsBase.primary,
                                              padding: EdgeInsets.only(left: 16, right: 12),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(bottom: 6),
                                                    child: Text(
                                                      "Umur" ,
                                                      style: TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      ModelReportSales.getDataDetail['age'] != null ? ModelReportSales.getDataDetail['age'].toString() : "-",
                                                      overflow: TextOverflow.ellipsis,
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
                                          Expanded(
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
                                                      "Berat (Kg)" ,
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      ModelReportSales.getDataDetail['weight'].trim() != null ? ModelReportSales.getDataDetail['weight'].toString() : "-",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors.black,
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
                                  ) :
                                  ModelReportSales.getDataDetail['codesId'] == '303' ? 
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      height: 64,
                                      color: ColorsBase.primary[50],
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
                                                      "Dokter" ,
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      ModelReportSales.getDataDetail['doctor'] != null ? TextTransform.title(ModelReportSales.getDataDetail['doctor']) : "-",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors.black,
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
                                  ) : 
                                  ModelReportSales.getDataDetail['codesId'] == '304' ?
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 64,
                                              color: ColorsBase.primary,
                                              padding: EdgeInsets.only(left: 16, right: 12),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(bottom: 6),
                                                    child: Text(
                                                      "Umur" ,
                                                      style: TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      ModelReportSales.getDataDetail['age'] != null ? ModelReportSales.getDataDetail['age'].toString() : "-",
                                                      overflow: TextOverflow.ellipsis,
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
                                          Expanded(
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
                                                      "Hasil Lab" ,
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Lihat",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          child: Container(
                                                            margin: EdgeInsets.only(left: 4),
                                                            child: Icon(
                                                              Mdi.informationOutline,
                                                              color: ColorTheme.secondary,
                                                              size: 18,
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Get.to(ReportSalesRecapDetailLabResultScreen(ModelReportSales.getDataDetail), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ) : Container(),
                                ],
                              ),
                            ) : Visibility(
                              visible: false,
                              child: Container(),
                            );
                        }
                      }
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
                              if(ModelReportSales.getDataDetail['details'].length > 0){
                                return ListView.builder (
                                  shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  itemCount: ModelReportSales.maxData ? ModelReportSales.getDataDetail['details'].length : ModelReportSales.getDataDetail['details'].length + 1,
                                  itemBuilder: (context, int i) {
                                    return i < ModelReportSales.getDataDetail['details'].length ? ReportSalesRecapDetailDataScreen(ModelReportSales.getDataDetail, ModelReportSales.getDataDetail['details'][i], i) : Container();
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
          ]
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
                                                            "Subtotal",
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
                                                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getDataDetail['total'].toString()))),
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
                                                            "Potongan",
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
                                                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getDataDetail['discount'].toString()))),
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
                                            "Total",
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
                                            NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getDataDetail['grandTotal'].toString()))),
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
                          ModelReportSales.getDataDetail['codesId'] == '306' ? Container() : Visibility(
                            visible: resp.isFull == false ? false : true,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 150),
                              opacity: resp.isFull == false ? 0 : 1, 
                              child: Container(
                                margin: EdgeInsets.only(bottom: 8),
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
                                                      "Tunai",
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
                                                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getDataDetail['payment'].toString()))),
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
                                    Divider(
                                      color: Colors.white54,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
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
                                                      "Kembali",
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
                                                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(ModelReportSales.getDataDetail['balance'].toString()))),
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
