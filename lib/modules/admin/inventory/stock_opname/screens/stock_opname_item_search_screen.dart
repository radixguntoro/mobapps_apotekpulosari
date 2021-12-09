import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/controllers/stock_opname_controller.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/models/model_stock_opname.dart';
import 'package:apotik_pulosari/modules/admin/inventory/stock_opname/screens/stock_opname_item_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class StockOpnameItemSearchScreen extends SearchDelegate<String> {
  final StockOpnameController _stockOpnameController = Get.put(StockOpnameController());

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Mdi.close), 
        onPressed: () { 
          query = '';
         }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation
      ),
      onPressed: () {
        _stockOpnameController.readFirst();
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(query);
    if (query.length >= 2) {
      _stockOpnameController.readDataBySearch(query);
    }
    if(ModelStockOpname.getData.length > 0) {
      return ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: ModelStockOpname.getData.length,
        itemBuilder: (context, int i) {
          return i < ModelStockOpname.getData.length ? StockOpnameItemSearchResultScreen(ModelStockOpname.getData[i], query, i) : Container();
        },
      );
    } else {
      return _emptyCart(context);
    }
  }

  Widget showResults(BuildContext context) {
    return null;
  }
}

Widget _emptyCart(context) {
  return Container(
    margin: EdgeInsets.only(top: 48),
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: Text(
            "Oops!",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 32),
          child: Text(
            "Data tidak ditemukan",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: Image(
            width: 160,
            image: AssetImage("assets/images/icons/state_page/noresult.png"),
          ),
        ),
      ],
    ),
  );
}