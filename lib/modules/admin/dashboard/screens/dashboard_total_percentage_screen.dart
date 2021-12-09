import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/dashboard/models/model_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class DashboardTotalPercentageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = [
      Percentage(
        "Penjualan", 
        ModelDashboard.totalSales, 
        ColorsBase.primary[100]
      ),
      Percentage(
        "Pembelian", 
        ModelDashboard.totalPurchase, 
        ColorsBase.primary
      )
    ];

    var series = [
      charts.Series(
        domainFn: (Percentage percentage, _) => percentage.title,
        measureFn: (Percentage percentage, _) => percentage.total,
        colorFn: (Percentage percentage, _) => percentage.color,
        id: 'Percentage',
        data: data
      )
    ];

    var chart = charts.PieChart(
      series,
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 16,
      )
    );

    return Expanded(
      child: Container(
        height: 248,
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
        margin: EdgeInsets.only(right: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 168.0,
                    child: Center(
                      child: RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Container(
                                child: Text(
                                  NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(ModelDashboard.totalPercentage),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 2),
                                child: Text(
                                  "%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(
                          height: 144.0
                        ), // adjust the height here
                        child: chart, 
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Persentase",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        margin: EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: ColorsBase.primary,
                                shape: BoxShape.circle
                              ),
                            ),
                            Text(
                              "Pembelian",
                              style: TextStyle(
                                fontSize: 12
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        child: Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: ColorsBase.primary[100],
                                shape: BoxShape.circle
                              ),
                            ),
                            Text(
                              "Penjualan",
                              style: TextStyle(
                                fontSize: 12
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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

class Percentage {
  final String title;
  final double total;
  final charts.Color color;

  Percentage(this.title, this.total, Color color) : this.color = charts.Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);
}