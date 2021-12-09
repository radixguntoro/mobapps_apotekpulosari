import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/controllers/report_item_card_controller.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/models/model_report_item_card.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_filter_screen.dart';
import 'package:apotik_pulosari/modules/admin/report/rep_item_card/screens/report_item_card_history_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ReportItemCardHistoryScreen extends StatelessWidget {

  final _scrollController = ScrollController();
  final ReportItemCardController _reportItemCardController = Get.put(ReportItemCardController());
  
  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() { 
      _reportItemCardController.setScroll(_scrollController);
    });
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          _reportItemCardController.readHistoryStockList();
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
                        init: ReportItemCardController(),
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
                                            "${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportItemCard.dateStart.toString()))} - ${DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(ModelReportItemCard.dateEnd.toString()))}",
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
                          Get.to(ReportItemCardFilterScreen('history_list'), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
                                        "Nama Barang",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 10
                                        ),
                                      ),
                                    ),
                                    GetBuilder(
                                      init: ReportItemCardController(),
                                      builder: (resp) {
                                        if (ModelReportItemCard.isLoading == true) {
                                          return Container(
                                            child: SpinKitThreeBounce(
                                              color: Colors.black,
                                              size: 16.0,
                                            )
                                          );
                                        } else {
                                          return Container(
                                            child: Text(
                                              ModelReportItemCard.medicineName,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          );
                                        }
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
                  ]
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: ColorsBase.primary[100]
                              ),
                            ),
                            color: ColorTheme.primary,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                          height: 40,
                          child: Text(
                            "Tanggal",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 2,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       border: Border(
                      //         right: BorderSide(
                      //           color: ColorsBase.primary[100]
                      //         ),
                      //       ),
                      //       color: ColorTheme.primary,
                      //     ),
                      //     padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      //     height: 40,
                      //     child: Text(
                      //       "Ket.",
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         fontSize: 10,
                      //         fontWeight: FontWeight.w600,
                      //         color: Colors.white
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: ColorsBase.primary[100]
                              ),
                            ),
                            color: ColorTheme.primary,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                          height: 40,
                          child: Text(
                            "Masuk",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: ColorsBase.primary[100]
                              ),
                            ),
                            color: ColorTheme.primary,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                          height: 40,
                          child: Text(
                            "Keluar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorTheme.primary,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                          height: 40,
                          child: Text(
                            "Sisa",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: GetBuilder(
                    init: ReportItemCardController(),
                    builder: (resp) {
                      if(ModelReportItemCard.isLoading == true) {
                        return LoadingShimmerRecap();
                      } else {
                        if(ModelReportItemCard.getData.length > 0) {
                          return ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: ModelReportItemCard.getData.length > 0 ? ModelReportItemCard.getData.length : 0,
                            itemBuilder: (context, int index) {
                              return ModelReportItemCard.getData.length > 0 ? ReportItemCardHistoryDataScreen(ModelReportItemCard.getData[index], index) : Container();
                            },
                          );
                        } else {
                          return _emptyData(context);
                        }
                      }
                    }
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