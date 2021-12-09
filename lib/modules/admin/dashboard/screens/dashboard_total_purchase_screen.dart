import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/models/model_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class DashboardTotalPurchaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 248,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ColorTheme.primary.withOpacity(0.40),
              offset: Offset(0, 4),
              blurRadius: 16,
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [ColorTheme.primary, ColorTheme.primarySec],
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
                      color: Colors.white24,
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
                        
                      },
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 48),
                  padding: EdgeInsets.all(16),
                  child: GetBuilder(
                    init: DashboardController(),
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: Text(
                              "Pembelian",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Mdi.dolly,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              ModelAuth.permission == 99 || ModelAuth.permission == 1 ? NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(ModelDashboard.totalPurchase) : NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelDashboard.totalInvPurchase),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.white54,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 4),
                            child: Text(
                              tanggal(DateTime.now(), shortMonth: true),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.white70,
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
            )
          ),
        ),
      ),
    );
  }
}