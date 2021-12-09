import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/controllers/dashboard_controller.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/models/model_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class DashboardBalanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 96,
      left: 16,
      child: ClipRRect(
        child: Container(
          width: MediaQuery.of(context).size.width - 32,
          height: 176,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [ColorTheme.secondary, ColorTheme.secondarySec],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .16),
                offset: Offset(0, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: 16,
                top: 16,
                child: InkWell(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Mdi.plus,
                      color: ColorTheme.secondary,
                    ),
                  ),
                  onTap: () {
                    print('Ready');
                  },
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0xFFEB001C).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned(
                right: 36,
                bottom: 16,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFA000).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned(
                left: -80,
                bottom: -40,
                child: Transform.rotate(
                  angle: 2.6,
                  child: Container(
                    width: 200,
                    height: 96,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -56,
                bottom: -48,
                child: Transform.rotate(
                  angle: 2.6,
                  child: Container(
                    width: 200,
                    height: 96,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: GetBuilder(
                  init: DashboardController(),
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Total Aset",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(ModelDashboard.totalAsset),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                ),
              )
            ],
          )
        ),
      )
    );
  }
}