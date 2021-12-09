import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/controllers/stock_opname_controller.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/screens/stock_opname_create_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class StockOpnameRecapItemDataScreen extends StatelessWidget {
  final _stockOpnameController = Get.put(StockOpnameController());
  final item;
  final index;

  StockOpnameRecapItemDataScreen(
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
              Mdi.pill,
              color: Colors.white,
              size: 24,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Text(
                    item['name'].toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    item['id'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black38,
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
                Mdi.squareEditOutline,
                color: Colors.black54,
              ),
              onTap: () async {
                _stockOpnameController.setItem(item);
                Get.to(StockOpnameCreateScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
              },
            ),
          ),
        ],
      )
    );
  }
}