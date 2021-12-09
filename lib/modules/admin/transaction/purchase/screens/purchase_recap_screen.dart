import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/controllers/purchase_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/models/model_purchase.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_create_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_filter_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_recap_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class PurchaseRecapScreen extends StatefulWidget {
  @override
  _PurchaseRecapScreenState createState() => _PurchaseRecapScreenState();
}

class _PurchaseRecapScreenState extends State<PurchaseRecapScreen> {
  final _scrollController = ScrollController();
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  final DateTime invoiceDate = DateTime.now();
  final DateTime paymentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _purchaseController.readFirst();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll == currentScroll) {
      print(maxScroll);
      print(currentScroll);
      _purchaseController.readMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Rekap Data",
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
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .16),
                  offset: Offset(0, -4),
                  blurRadius: 40,
                ),
              ],
            ),
            child: RefreshIndicator(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[100],
                                ),
                                child: TextFormField(
                                  readOnly: true,
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                                    labelText: "Pencarian",
                                    labelStyle: TextStyle(
                                      color: Colors.black54
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[200]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[100]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[200]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[200]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: "Pencarian...",
                                    hintStyle: TextStyle(
                                      color: Colors.black54
                                    ),
                                    prefixIcon: Icon(
                                      Mdi.magnify,
                                      color: Colors.black38
                                    ),
                                  ),
                                  obscureText: false,
                                  onTap: () {
                                    ModelPurchase.getData = [];
                                    showSearch(context: context, delegate: PurchaseRecapSearchScreen());
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [ColorTheme.third, ColorTheme.thirdSec],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Icon(
                                  Mdi.tune,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Get.to(PurchaseRecapFilterScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: GetBuilder(
                                init: PurchaseController(),
                                builder: (_) {
                                  return Text(
                                    "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelPurchase.totalData))} data",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12
                                    ),
                                  );
                                }
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: GetBuilder(
                                init: PurchaseController(),
                                builder: (_) {
                                  return Text(
                                    NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format((ModelPurchase.totalValue)),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: ColorTheme.primary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14
                                    ),
                                  );
                                }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey[50],
                      width: MediaQuery.of(context).size.width,
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: TabBar(
                                unselectedLabelColor: ColorTheme.primary,
                                labelColor: ColorTheme.primary,
                                indicatorWeight: 2.5,
                                indicator: BoxDecoration(
                                  color: ColorsBase.primary[10],
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorTheme.primary, width: 2.5
                                    )
                                  )
                                ),
                                tabs: [
                                  Tab(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Rekap",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Lunas",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                onTap: (value) {
                                  _purchaseController.setPaidOnly(value);
                                },
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
                          init: PurchaseController(),
                          builder: (resp) {
                            if (ModelPurchase.isLoading == true) {
                              return LoadingShimmerRecap();
                            } else {
                              if(ModelPurchase.getData.length > 0){
                                return ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(0),
                                  itemCount: ModelPurchase.maxData ? ModelPurchase.getData.length : ModelPurchase.getData.length + 1,
                                  controller: _scrollController,
                                  itemBuilder: (context, int i) {
                                    return i < ModelPurchase.getData.length ? PurchaseRecapListScreen(ModelPurchase.getData[i], i) : Container();
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
              onRefresh: () async {
                _purchaseController.readFirst();
              },
            ),
          ),
        ]
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        child: FlatButton(
          child: Icon(
            Mdi.plus,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          onPressed: () async{
            Get.to(PurchaseCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
  
  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }
}

