import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/client/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class HomeMedicineItemScreen extends StatelessWidget {
  final item;
  final index;

  HomeMedicineItemScreen(
    this.item,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (resp) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: (index+1) % 2 == 1 ? 1 : 0,
                color: (index+1) % 2 == 1 ? Colors.grey[100] : Colors.transparent
              ),
              bottom: BorderSide(
                width: 1,
                color: Colors.grey[100]
              ),
            )
          ),
          child: FlatButton(
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 24),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsBase.primary[50],
                  ),
                  child: Icon(
                    Mdi.pill,
                    color: ColorTheme.primary,
                    size: 40,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text(
                          item['name'].toUpperCase(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format((double.parse(item['tabletPriceSell']))),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ColorTheme.primary
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
            onPressed: () async {
              
            },
          ),
        );
      }
    );
  }
}