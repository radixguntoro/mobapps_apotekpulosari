import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/master/category/controllers/category_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/category/models/model_category.dart';
import 'package:apotik_pulosari/modules/admin/master/category/screens/category_form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mdi/mdi.dart';

class CategoryCreateScreen extends StatelessWidget {
  final _categoryController = Get.put(CategoryController());

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
                                  "Tambah Data",
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
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                    child: Text(
                      "Informasi",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 16),
                    color: Colors.white,
                    child: DividerDashed(
                      color: Colors.grey[300],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView(
                        padding: EdgeInsets.all(16),
                        shrinkWrap: true,
                        children: [
                          Container(
                            child: GetBuilder(
                              init: CategoryController(),
                              builder: (_) {
                                return CategoryFormScreen();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        child: GetBuilder(
          init: CategoryController(),
          builder: (_) {
            if (ModelCategory.isLoading == true) {
              return LoadingSaveForm();
            } else {
              return _bottomNavBar(context);
            }
          },
        ),
      ),
    );
  }

  Widget _bottomNavBar(context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: 48,
          // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [ColorTheme.primary, ColorTheme.primarySec],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "Simpan",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                Mdi.checkAll,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onPressed: () async {
          // ignore: await_only_futures
          await _categoryController.createData();
          if (ModelCategory.isValidate == false) {
            Get.snackbar(
              "Oops!",
              "Nama kategori masih kosong",
              titleText: Container(
                child: Text(
                  "Oops!",
                  style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                  )
                ),
              ),
              messageText: Text(
                "Nama kategori masih kosong",
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 12,
                )
              ),
              backgroundColor: Colors.red[50].withOpacity(0.95),
              shouldIconPulse: true,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(16),
              icon: Icon(
                Mdi.closeCircle,
                size: 24,
                color: Colors.red,
              ), 
              barBlur: 0,
              duration: Duration(seconds: 3),
              borderRadius: 5,
            );
          } else {
            if (ModelCategory.result == 'success') {
              Get.back(result: ModelCategory.result);
              _categoryController.readFirst();
            }
          }
        },
      ),
    );
  }
}

