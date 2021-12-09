import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchaseRecapReturnDetailItemScreen extends StatelessWidget {
  final item;
  final data;
  final index;

  PurchaseRecapReturnDetailItemScreen(
    this.item,
    this.data,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
      decoration: BoxDecoration(
        color: (index+1) % 2 == 0 ? Colors.white : Colors.grey[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(
                      DateFormat("dd MMM yyyy", "id_ID").format(DateTime.parse(item['return']['created_at'])),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(int.parse(item['qty'].toString())),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(
                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(data['price'].toString()) * int.parse(item['qty'].toString())),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorTheme.primary,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}