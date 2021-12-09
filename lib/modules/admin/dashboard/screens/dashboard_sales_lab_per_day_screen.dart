import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/models/model_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class DashboardSalesLabPerDayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .16),
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
            height: 176,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white
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
                      color: Colors.grey[200],
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
                        color: Colors.black26,
                      ),
                      onPressed: () {
                        
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: -8,
                  left: -8,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorTheme.primary.withOpacity(0.16),
                    ),
                    child: Icon(
                      Mdi.flask,
                      size: 28,
                      color: ColorTheme.primary,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  child: GetBuilder(
                    init: DashboardController(),
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              ModelAuth.permission == 99 || ModelAuth.permission == 1 ? "Penjualan" : "Nota",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Lab",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Text(
                              ModelAuth.permission == 99 || ModelAuth.permission == 1 ? NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(ModelDashboard.totalSalesLab) : NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelDashboard.totalInvSalesLab),
                              style: TextStyle(
                                color: ColorTheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black26,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 4),
                            child: Text(
                              tanggal(DateTime.now(), shortMonth: true),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.black54,
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