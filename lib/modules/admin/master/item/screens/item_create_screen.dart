import 'package:apotik_pulosari/components/response/response_screen.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/master/item/controllers/item_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/master/item/screens/item_form_desc_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/item/screens/item_form_detail_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/item/screens/item_form_image_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mdi/mdi.dart';

class ItemCreateScreen extends StatelessWidget {
  final _itemController = Get.put(ItemController());

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
                                child: GetBuilder(
                                  init: ItemController(),
                                  builder: (_) {
                                    return FlatButton(
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
                                        switch (ModelItem.page) {
                                          case 'firstPage':
                                            Get.close(null);
                                            break;
                                          case 'secondPage':
                                            _itemController.setForm('firstPage');
                                            break;
                                          case 'thirdPage':
                                            _itemController.setForm('secondPage');
                                            break;
                                          default:
                                        }
                                      },
                                    );
                                  },
                                )
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
                    child: GetBuilder(
                      init: ItemController(),
                      builder: (_) {
                        return Text(
                          ModelItem.page == 'firstPage' ? "Deskripsi" : ModelItem.page == 'secondPage' ? "Unggah Gambar" : "Detil",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                          ),
                        );
                      }
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16, bottom: 0, left: 16, right: 16),
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
                              init: ItemController(),
                              builder: (_) {
                                if (ModelItem.page == 'firstPage') {
                                  return ItemFormDescScreen();
                                } else if (ModelItem.page == 'secondPage') {
                                  return ItemFormImageScreen();
                                } else {
                                  return ItemFormDetailScreen();
                                }
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
          init: ItemController(),
          builder: (_) {
            if (ModelItem.isLoading == true) {
              return LoadingSaveForm();
            } else {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
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
                                    ModelItem.page == 'thirdPage' ? "Simpan" : "Selanjutnya",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Icon(
                                  ModelItem.page == 'thirdPage' ? Mdi.checkAll : Mdi.arrowRight,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          onPressed: () async {
                            switch (ModelItem.page) {
                              case 'firstPage':
                                _itemController.setForm('secondPage');
                                break;
                              case 'secondPage':
                                _itemController.setForm('thirdPage');
                                break;
                              case 'thirdPage':
                                _itemController.createData();
                                break;
                              default:
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

