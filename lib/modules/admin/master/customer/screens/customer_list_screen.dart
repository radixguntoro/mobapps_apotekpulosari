import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/controllers/customer_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/models/model_customer.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/screens/customer_create_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/screens/customer_data_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/screens/customer_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class CustomerListScreen extends StatefulWidget {
  @override
  _CustomerListScreenState createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final _scrollController = ScrollController();
  final CustomerController _customerController = Get.put(CustomerController());

  @override
  void initState() {
    super.initState();
    _customerController.readFirst();
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
      _customerController.readMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorTheme.primary, ColorTheme.primarySec],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: 216,
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
                  Positioned(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: AppBar(
                              elevation: 0,
                              title: Center(
                                child: Text(
                                  ModelCustomer.titlePage,
                                  style: TextStyle(
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
                          ),
                        ],
                      ),
                    ),
                  ), 
                ]
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 88),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, .16),
                    offset: Offset(0, -4),
                    blurRadius: 16,
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
                                        Mdi.magnify
                                      ),
                                    ),
                                    obscureText: false,
                                    onTap: () {
                                      ModelCustomer.getData = [];
                                      showSearch(context: context, delegate: CustomerSearchScreen());
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
                          init: CustomerController(),
                          builder: (_) {
                            return Text(
                              "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelCustomer.totalData))} data",
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
                            init: CustomerController(),
                            builder: (resp) {
                              if (ModelCustomer.isLoading == true) {
                                return LoadingShimmer();
                              } else {
                                if(ModelCustomer.getData.length > 0) {
                                  return ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: ModelCustomer.maxData ? ModelCustomer.getData.length : ModelCustomer.getData.length + 1,
                                    controller: _scrollController,
                                    itemBuilder: (context, int i) {
                                      return i < ModelCustomer.getData.length ? CustomerDataScreen(ModelCustomer.getData[i], i) : Container();
                                    }
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
                  _customerController.readFirst();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          _customerController.clearInput();
          var createData = await Get.to(CustomerCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
          if (createData == 'success') {
            Get.snackbar(
              "Sukses",
              "Data berhasil disimpan",
              titleText: Container(
                child: Text(
                  "Sukses!",
                  style: TextStyle(
                    color: Colors.green[800],
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                  )
                ),
              ),
              messageText: Text(
                "Data berhasil disimpan",
                style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 12,
                )
              ),
              backgroundColor: Colors.green[50].withOpacity(0.9),
              shouldIconPulse: true,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(16),
              icon: Icon(
                Mdi.checkCircle,
                size: 24,
                color: Colors.green,
              ), 
              barBlur: 0,
              duration: Duration(seconds: 3),
              borderRadius: 5,
            );
          }
        },
        child: Container(
          width: 56,
          height: 56,
          child: Icon(
            Mdi.plus,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [ColorTheme.primary, ColorTheme.primarySec],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
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
