import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/master/category/controllers/category_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/category/models/model_category.dart';
import 'package:apotik_pulosari/modules/admin/master/category/screens/category_data_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/category/screens/category_search_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/category/screens/category_create_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final _scrollController = ScrollController();
  final CategoryController _categoryController = Get.put(CategoryController());

  @override
  void initState() {
    super.initState();
    _categoryController.readFirst();
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
      _categoryController.readMore();
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
                                  ModelCategory.titlePage,
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
                                  width: 56,
                                  height: 56,
                                  child: FlatButton(
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: Icon(
                                      Mdi.magnify,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      ModelCategory.getData = [];
                                      showSearch(context: context, delegate: CategorySearchScreen());
                                    },
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
                color: Colors.grey[100],
              ),
              child: RefreshIndicator(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorTheme.primary, ColorTheme.primarySec],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                          color: Colors.grey[200],
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, .16),
                              offset: Offset(0, -4),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: GetBuilder(
                                init: CategoryController(),
                                builder: (_) {
                                  return Text(
                                    "Total: ${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((ModelCategory.totalData))} data",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12
                                    ),
                                  );
                                }
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: GetBuilder(
                            init: CategoryController(),
                            builder: (resp) {
                              if (ModelCategory.isLoading == true) {
                                return LoadingShimmer();
                              } else {
                                if(ModelCategory.getData.length > 0) {
                                  return ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    itemCount: ModelCategory.maxData ? ModelCategory.getData.length : ModelCategory.getData.length + 1,
                                    controller: _scrollController,
                                    itemBuilder: (context, int i) {
                                      return i < ModelCategory.getData.length ? CategoryDataScreen(ModelCategory.getData[i], i) : Container();
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
                  _categoryController.readFirst();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          _categoryController.clearInput();
          var createData = await Get.to(CategoryCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
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