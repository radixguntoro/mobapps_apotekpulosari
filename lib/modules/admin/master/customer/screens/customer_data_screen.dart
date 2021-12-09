import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/controllers/customer_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/screens/customer_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class CustomerDataScreen extends StatelessWidget {
  final _customerController = Get.put(CustomerController());
  final data;
  final index;

  CustomerDataScreen(
    this.data,
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
          Column(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                child: Icon(
                  Mdi.accountGroup,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Text(
                    TextTransform.title(data['name']),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    data['id'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
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
                _customerController.readDetailData(data);
                var createData = await Get.to(CustomerEditScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
                if (createData == 'success') {
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