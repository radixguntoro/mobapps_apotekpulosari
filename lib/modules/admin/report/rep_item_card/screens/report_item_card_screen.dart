import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_export_xls_recap_stock_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_export_xls_stock_in_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_export_xls_stock_out_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_history_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_stock_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_stockin_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_stockout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

class ReportItemCardScreen extends StatelessWidget {
  final ReportItemCardController _reportItemCardController = Get.put(ReportItemCardController());
  final ReportItemCardExportXLSRecapStockController _reportItemCardExportXLSRecapStockController = Get.put(ReportItemCardExportXLSRecapStockController());
  final ReportItemCardExportXLSStockOutController _reportItemCardExportXLSStockOutController = Get.put(ReportItemCardExportXLSStockOutController());
  final ReportItemCardExportXLSStockInController _reportItemCardExportXLSStockInController = Get.put(ReportItemCardExportXLSStockInController());

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        _reportItemCardController.clearData();
        _reportItemCardController.setTabState(0);
        Get.close(null);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(
              "Lap. Kartu Barang",
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
              onPressed: () async {
                _reportItemCardController.clearData();
                _reportItemCardController.setTabState(0);
                // _reportItemCardController.readFirst();
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
              margin: EdgeInsets.only(top: 88),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .08),
                    offset: Offset(0, 4),
                    blurRadius: 40,
                  ),
                ],
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24), 
                    topRight: Radius.circular(24)
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    GetBuilder(
                      init: ReportItemCardController(),
                      builder: (_) {
                        return Container(
                          child: DefaultTabController(
                            initialIndex: 0,
                            length: 4,
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                                    color: ColorsBase.primary[10],
                                  ),
                                  height: 72,
                                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
                                  child: TabBar(
                                    isScrollable: true,
                                    unselectedLabelColor: ColorTheme.third,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: ColorTheme.third
                                    ),
                                    labelPadding: EdgeInsets.only(left: 8, right: 8),
                                    tabs: [
                                      Tab(
                                        child: Container(
                                          padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorTheme.third, width: 1)
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Riwayat",
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorTheme.third, width: 1)
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Stok",
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorTheme.third, width: 1)
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Barang Keluar",
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: ColorTheme.third, width: 1)
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Barang Masuk",
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    onTap: (value) {
                                      _reportItemCardController.setTabState(value);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                    Expanded(
                      child: GetBuilder(
                        init: ReportItemCardController(),
                        builder: (_) {
                          return Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                if(_.state == 0) 
                                  ReportItemCardHistoryScreen(),
                                if(_.state == 1)
                                  ReportItemCardStockScreen(),
                                if(_.state == 2)
                                  ReportItemCardStockOutScreen(),
                                if(_.state == 3)
                                  ReportItemCardStockInScreen(),
                              ],
                            )
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
        floatingActionButton: GetBuilder(
          init: ReportItemCardController(),
          builder: (_) {
            if(_.state == 1 && ModelReportItemCard.dataItems.length > 0 || _.state == 2 && ModelReportItemCard.dataItemsOut.length > 0 || _.state == 3 && ModelReportItemCard.dataItemsIn.length > 0) {
              return Container(
                width: 56,
                height: 56,
                child: FlatButton(
                  child: Icon(
                    Mdi.microsoftExcel,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  onPressed: () async{
                    switch (_.state) {
                      case 1:
                        _reportItemCardExportXLSRecapStockController.exportToExcel();
                        break;
                      case 2:
                        _reportItemCardExportXLSStockOutController.exportToExcel();
                        break;
                      case 3:
                        _reportItemCardExportXLSStockInController.exportToExcel();
                        break;
                      default:
                    }
                  },
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .32),
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [ColorTheme.primary, ColorTheme.primarySec],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
              );
            } else {
              return Container();
            }
          }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
