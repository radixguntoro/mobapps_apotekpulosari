import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/modules/admin/master/unit/controllers/unit_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/unit/screens/unit_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class UnitDataScreen extends StatelessWidget {
  final _unitController = Get.put(UnitController());

  final item;
  final index;

  UnitDataScreen(
    this.item,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (index+1) % 2 == 0 ? Colors.white : Colors.grey[50],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Text(
                    item['name'].toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: InkWell(
              child: Icon(
                Mdi.circleEditOutline,
                color: Colors.black54,
              ),
              onTap: () async{
                _unitController.readDetailData(item);
                var updateData = await Get.to(UnitEditScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                if (updateData == 'success') {
                  Get.snackbar(
                    "Sukses",
                    "Data berhasil diubah",
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
                      "Data berhasil diubah",
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
            ),
          ),
        ],
      )
    );
  }
}