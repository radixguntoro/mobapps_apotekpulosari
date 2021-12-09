import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/controllers/closing_cashier_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/models/model_closing_cashier.dart';
import 'package:apotik_pulosari/modules/admin/transaction/closing_cashier/screens/closing_cashier_recap_by_sales_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'closing_cashier_recap_by_cashier_screen.dart';

class ClosingCashierRecapDetailScreen extends StatelessWidget {
  final ClosingCashierController _closingCashierController = Get.put(ClosingCashierController());
  final data;

  ClosingCashierRecapDetailScreen(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Detil Rekap",
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
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                              color: ColorsBase.primary[10],
                            ),
                            height: 72,
                            padding: EdgeInsets.only(top: 16, bottom: 16, left: 0, right: 0),
                            child: TabBar(
                              unselectedLabelColor: ColorTheme.third,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorTheme.third
                              ),
                              tabs: [
                                Tab(
                                  child: Container(
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: ColorTheme.third, width: 1)
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Kasir",
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: ColorTheme.third, width: 1)
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Penjualan",
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              onTap: (value) {
                                _closingCashierController.setDetailState(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: ColorsBase.primary[10],
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                      child: GetBuilder(
                        init: ClosingCashierController(),
                        builder: (_) {
                          if (ModelClosingCashier.isDetailState == 0) {
                            return Text(
                              "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelClosingCashier.getDetailByCashier.length))} orang",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12
                              ),
                            );
                          } else {
                            return Text(
                              "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelClosingCashier.getDetailBySales.length))} tipe",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12
                              ),
                            );
                          }
                        }
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: GetBuilder(
                        init: ClosingCashierController(),
                        builder: (resp) {
                          if (resp.isLoading == true) {
                            return LoadingShimmerRecap();
                          } else {
                            if (ModelClosingCashier.isDetailState == 0) {
                              if (ModelClosingCashier.getDetailByCashier.length > 0) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  itemCount: ModelClosingCashier.getDetailByCashier.length > 0 ? ModelClosingCashier.getDetailByCashier.length : 0,
                                  itemBuilder: (context, int i) {
                                    return ModelClosingCashier.getDetailByCashier.length > 0 ? ClosingCashierRecapByCashierScreen(ModelClosingCashier.getDetailByCashier[i]) : Container();
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  },
                                );
                              } else {
                                return _emptyData(context);
                              }
                            } else {
                              if (ModelClosingCashier.getDetailBySales.length > 0) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  itemCount: ModelClosingCashier.getDetailBySales.length > 0 ? ModelClosingCashier.getDetailBySales.length : 0,
                                  itemBuilder: (context, int i) {
                                    return ModelClosingCashier.getDetailBySales.length > 0 ? ClosingCashierRecapBySalesScreen(ModelClosingCashier.getDetailBySales[i]) : Container();
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  },
                                );
                              } else {
                                return _emptyData(context);
                              }
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Text(
                              "Total",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text(
                              ":",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GetBuilder(
                                init: ClosingCashierController(),
                                builder: (resp) {
                                  if (ModelClosingCashier.isDetailState == 0) {
                                    return Container(
                                      child: Text(
                                        NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(ModelClosingCashier.incomeAppTotalByCashier.toString()))),
                                        style: TextStyle(
                                          color: ColorTheme.primary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      child: Text(
                                        NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((double.parse(ModelClosingCashier.incomeAppTotalBySales.toString()))),
                                        style: TextStyle(
                                          color: ColorTheme.primary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    );
                                  }
                                }
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
  
  Widget _emptyData(context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 48),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Hello!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 32),
                child: Text(
                  "Keranjang masih kosong",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Image(
                  width: 160,
                  image: AssetImage("assets/images/icons/state_page/emptycart.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
