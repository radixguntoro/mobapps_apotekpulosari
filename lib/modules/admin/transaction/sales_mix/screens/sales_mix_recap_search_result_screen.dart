import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_recap_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

class SalesMixRecapSearchResultScreen extends StatelessWidget {
  final data;
  final query;
  final total;
  final index;

  SalesMixRecapSearchResultScreen(
    this.data,
    this.query,
    this.total,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (index+1) % 2 == 0 ? Colors.white : Colors.grey[50],
        
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: RichText(
                          textScaleFactor: MediaQuery.of(context).textScaleFactor,
                          text: searchMatch((data['tr_sales_transactions_id']).toString(), 'id') 
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          tanggal(DateTime.parse(data['tr_sales']['transaction']['created_at']), shortMonth: true),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Icon(
                      Mdi.chevronRight,
                      size: 24,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      Get.to(SalesMixRecapDetailScreen(data), transition: Transition.rightToLeft, duration: Duration(milliseconds: ModelTransition.speed),);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Total Belanja",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format((double.parse(data['tr_sales']['transaction']['grand_total']))),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Tunai",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format((double.parse(data['payment']))),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "Kembali",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format((double.parse(data['balance']))),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

  final TextStyle posResSupplier = TextStyle(
    color: ColorTheme.primary, 
    fontWeight: FontWeight.w600, 
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  final TextStyle negResSupplier = TextStyle(
    color: ColorTheme.secondary, 
    fontWeight: FontWeight.normal,
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  final TextStyle posResDate = TextStyle(
    color: Colors.black, 
    fontWeight: FontWeight.w600, 
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  final TextStyle negResDate = TextStyle(
    color: Colors.black54, 
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  final TextStyle posResId = TextStyle(
    color: ColorTheme.third, 
    fontWeight: FontWeight.w600, 
    fontFamily: 'Montserrat',
    fontSize: 14,
  );

  final TextStyle negResId = TextStyle(
    color: ColorTheme.primary, 
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontSize: 14,
  );

  TextSpan searchMatch(String match, String state) {
    if (query == null || query == "")
      return TextSpan(
        text: match, 
        style: state == 'supplier' ? negResSupplier : state == 'date' ? negResDate : negResId
      );
      var refinedMatch = match.toLowerCase();
      var refinedSearch = query.toLowerCase();
    if (refinedMatch.contains(refinedSearch)) {
      if (refinedMatch.substring(0, refinedSearch.length) == refinedSearch) {
        return TextSpan(
          style: state == 'supplier' ? posResSupplier : state == 'date' ? posResDate : posResId,
          text: match.substring(0, refinedSearch.length),
          children: [
            searchMatch(
              match.substring(
                refinedSearch.length,
              ),
              state
            ),
          ],
        );
      } else if (refinedMatch.length == refinedSearch.length) {
        return TextSpan(
          text: match, 
          style: state == 'supplier' ? posResSupplier : state == 'date' ? posResDate : posResId
        );
      } else {
        return TextSpan(
          style: state == 'supplier' ? negResSupplier : state == 'date' ? negResDate : negResId,
          text: match.substring(
            0,
            refinedMatch.indexOf(refinedSearch),
          ),
          children: [
            searchMatch(
              match.substring(
                refinedMatch.indexOf(refinedSearch),
              ),
              state
            ),
          ],
        );
      }
    } else if (!refinedMatch.contains(refinedSearch)) {
      return TextSpan(text: match, style: state == 'supplier' ? negResSupplier : state == 'date' ? negResDate : negResId);
    }
    return TextSpan(
      text: match.substring(0, refinedMatch.indexOf(refinedSearch)),
      style: state == 'supplier' ? negResSupplier : state == 'date' ? negResDate : negResId,
      children: [
        searchMatch(match.substring(refinedMatch.indexOf(refinedSearch)), state)
      ],
    );
  }
}