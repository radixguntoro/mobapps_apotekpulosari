import 'package:apotik_pulosari/components/response/loading_save_screen.dart';
import 'package:apotik_pulosari/components/snackbar/snackbar.dart';
import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/master/user/controllers/user_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/user/screens/user_form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mdi/mdi.dart';

class UserCreateScreen extends StatelessWidget {
  final _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Expanded(
                    child: Container(
                      // color: Colors.white,
                      child: ListView(
                        padding: EdgeInsets.all(16),
                        shrinkWrap: true,
                        children: [
                          Container(
                            child: GetBuilder(
                              init: UserController(),
                              builder: (_) {
                                return UserFormScreen('create');
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
          init: UserController(),
          builder: (_) {
            return Container(
              padding: EdgeInsets.all(16),
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
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
                  Get.off(LoadingSaveScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                  // ignore: await_only_futures
                  await _userController.createData();
                  if (_.result == 'success') {
                    Get.close(null);
                    Snackbar.success(_.response);
                  } else {
                    Get.close(null);
                    Snackbar.fail(_.response);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

