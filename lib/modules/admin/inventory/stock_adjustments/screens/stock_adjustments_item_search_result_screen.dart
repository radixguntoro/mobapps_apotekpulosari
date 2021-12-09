import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_adjustments/controllers/stock_adjustments_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class StockAdjustmentsItemSearchResultScreen extends StatelessWidget {
  final StockAdjustmentsController _stockAdjustmentsController = Get.put(StockAdjustmentsController());
  final item;
  final query;
  final total;
  final index;

  StockAdjustmentsItemSearchResultScreen(
    this.item,
    this.query,
    this.total,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(16),
        color: (index+1) % 2 == 0 ?  Colors.white : ColorsBase.primary[10],
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
                Mdi.magnify,
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
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: searchMatch(item['name'].toUpperCase(), 'name') 
                    )
                  ),
                  Container(
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: searchMatch(item['id'], 'id') 
                    )
                  ),
                ],
              )
            ),
          ],
        )
      ),
      onTap: () {
        _stockAdjustmentsController.setItem(item);
        Get.close(null);
      },
    );
  }

  final TextStyle posResName = TextStyle(
    color: Colors.black, 
    fontWeight: FontWeight.w600, 
    fontFamily: 'Montserrat',
    fontSize: 14,
  );

  final TextStyle negResName = TextStyle(
    color: Colors.black, 
    fontWeight: FontWeight.normal,
    fontFamily: 'Montserrat',
    fontSize: 14,
  );

  final TextStyle posResId = TextStyle(
    color: ColorTheme.third, 
    fontWeight: FontWeight.w600, 
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  final TextStyle negResId = TextStyle(
    color: Colors.black54, 
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontSize: 12,
  );

  TextSpan searchMatch(String match, String state) {
    if (query == null || query == "")
      return TextSpan(
        text: match, 
        style: state == 'name' ? negResName : negResId
      );
      var refinedMatch = match.toLowerCase();
      var refinedSearch = query.toLowerCase();
    if (refinedMatch.contains(refinedSearch)) {
      if (refinedMatch.substring(0, refinedSearch.length) == refinedSearch) {
        return TextSpan(
          style: state == 'name' ? posResName : posResId,
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
          style: state == 'name' ? posResName : posResId
        );
      } else {
        return TextSpan(
          style: state == 'name' ? negResName : negResId,
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
      return TextSpan(text: match, style: state == 'name' ? negResName : negResId);
    }
    return TextSpan(
      text: match.substring(0, refinedMatch.indexOf(refinedSearch)),
      style: state == 'name' ? negResName : negResId,
      children: [
        searchMatch(match.substring(refinedMatch.indexOf(refinedSearch)), state)
      ],
    );
  }
}