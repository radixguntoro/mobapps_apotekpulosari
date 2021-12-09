import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/models/model_dashboard.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/screens/dashboard_total_asset_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class DashboardTotalAssetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 136,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .16),
                offset: Offset(0, 4),
                blurRadius: 16,
              ),
            ],
            gradient: LinearGradient(
              colors: [ColorTheme.secondary, ColorTheme.secondarySec],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    shape: BoxShape.circle
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Icon(
                      Mdi.chevronRight,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.to(DashboardTotalAssetDetailScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed));
                    },
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Mdi.walletMembership,
                            size: 24,
                            color: ColorsBase.secondary[25],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GetBuilder(
                          init: DashboardController(),
                          builder: (_) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "Nilai Aset",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(ModelDashboard.totalAsset),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.white70,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    tanggal(DateTime.now(), shortMonth: true),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}