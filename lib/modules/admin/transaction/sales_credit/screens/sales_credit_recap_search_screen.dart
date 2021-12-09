import 'package:apotik_pulosari/modules/admin/transaction/sales_credit/controllers/sales_credit_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_credit/models/model_sales_credit.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_credit/screens/sales_credit_recap_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class SalesCreditRecapSearchScreen extends SearchDelegate<String> {
  final SalesCreditController _salesCreditController = Get.put(SalesCreditController());

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
        close(context, null);
        _salesCreditController.readFirst();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.length >= 2) {
      _salesCreditController.readDataBySearch(query);
    }

    if(ModelSalesCredit.getData.length > 0) {
      return ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: ModelSalesCredit.getData.length,
        itemBuilder: (context, int i) {
          return i < ModelSalesCredit.getData.length ? SalesCreditRecapSearchResultScreen(ModelSalesCredit.getData[i], query, ModelSalesCredit.getData.length, i) : Container();
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