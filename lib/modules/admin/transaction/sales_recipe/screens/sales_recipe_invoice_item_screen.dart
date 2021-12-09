
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SalesRecipeInvoiceItemScreen extends StatelessWidget {
  final item;

  SalesRecipeInvoiceItemScreen(
    this.item,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(right: 8),
                    margin: EdgeInsets.only(bottom: 6),
                    child: Text(
                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(item['qty']),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    )
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    margin: EdgeInsets.only(bottom: 6),
                    child: Text(
                      item['medicineName'].toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   flex: 2,
                //   child: Container(
                //     margin: EdgeInsets.only(bottom: 6),
                //     child: Text(
                //       NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['price'].toString())),
                //       textAlign: TextAlign.end,
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 12,
                //       ),
                //     )
                //   ),
                // ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: Text(
                      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0).format(double.parse(item['subtotal'].toString())),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    )
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