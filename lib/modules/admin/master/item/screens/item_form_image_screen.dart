import 'dart:convert';
import 'dart:typed_data';
import 'package:apotik_pulosari/modules/admin/master/item/controllers/item_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class ItemFormImageScreen extends StatelessWidget {
  final _itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ItemController(),
      builder: (_) {
        if (ModelItem.isLoading == true) {
          return Container();
        } else {
          print(ModelItem.imgBase64);
          if (ModelItem.imgBase64 == null || ModelItem.imgBase64 == '') {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[100]
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 8),
                              child: Text(
                                "Ambil Gambar",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Icon(
                              Mdi.camera,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                        onPressed: () async {
                          _itemController.setImageCamera();
                        }
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 1
                      )
                    ),
                    child: _.imgFrom != null ?
                    Image.file(
                      _.imgFrom,
                      fit: BoxFit.cover,
                    ) : 
                    Icon(
                      Mdi.imageOutline,
                      color: Colors.black38,
                      size: 72,
                    )
                  ),
                ]
              )
            );
          } else {
            Uint8List image = base64.decode(ModelItem.imgBase64);
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      // padding: EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[100]
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 8),
                              child: Text(
                                "Ambil Gambar",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Icon(
                              Mdi.camera,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                        onPressed: () async {
                          _itemController.setImageCamera();
                        }
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 1
                      )
                    ),
                    child: Image.memory(image)
                  ),
                ]
              )
            );
          }
        }
      }
    );
  }
}