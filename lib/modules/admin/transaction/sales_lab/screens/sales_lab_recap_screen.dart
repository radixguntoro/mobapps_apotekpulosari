import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/controllers/sales_lab_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/models/model_sales_lab.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/screens/sales_lab_create_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/screens/sales_lab_recap_list_screen.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_lab/screens/sales_lab_recap_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class SalesLabRecapScreen extends StatefulWidget {
  @override
  _SalesLabRecapScreenState createState() => _SalesLabRecapScreenState();
}

class _SalesLabRecapScreenState extends State<SalesLabRecapScreen> {
  final _scrollController = ScrollController();
  final SalesLabController _salesLabController = Get.put(SalesLabController());
  
  @override
  void initState() {
    super.initState();
    _salesLabController.readFirst();
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
      _salesLabController.readMore();
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
                                    ModelSalesLab.getData = [];
                                    showSearch(context: context, delegate: SalesLabRecapSearchScreen());
                                  },
                                ),
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
                      child: GetBuilder(
                        init: SalesLabController(),
                        builder: (_) {
                          return Text(
                            "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelSalesLab.totalData))} data",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12
                            ),
                          );
                        }
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: GetBuilder(
                          init: SalesLabController(),
                          builder: (resp) {
                            if (ModelSalesLab.isLoading == true) {
                              return LoadingShimmerRecap();
                            } else {
                              if(ModelSalesLab.getData.length > 0){
                                return ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(0),
                                  itemCount: ModelSalesLab.maxData ? ModelSalesLab.getData.length : ModelSalesLab.getData.length + 1,
                                  controller: _scrollController,
                                  itemBuilder: (context, int i) {
                                    return i < ModelSalesLab.getData.length ? SalesLabRecapListScreen(ModelSalesLab.getData[i], i) : Container();
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
                _salesLabController.readFirst();
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
            Get.to(SalesLabCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
            _salesLabController.calcTotal();
          },
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ColorTheme.primary.withOpacity(0.40),
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