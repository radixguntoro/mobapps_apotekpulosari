import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/controllers/sales_mix_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/models/model_sales_mix.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_mix/screens/sales_mix_recap_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class SalesMixRecapSearchScreen extends SearchDelegate<String> {
  final SalesMixController _salesMixController = Get.put(SalesMixController());

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
        _salesMixController.readFirst();
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
      _salesMixController.readDataBySearch(query);
    }

    if(ModelSalesMix.getData.length > 0) {
      return ListView.separated(
        padding: EdgeInsets.only(top: 8, bottom: 16),
        itemCount: ModelSalesMix.getData.length,
        itemBuilder: (context, int i) {
          return i < ModelSalesMix.getData.length ? SalesMixRecapSearchResultScreen(ModelSalesMix.getData[i], query, ModelSalesMix.getData.length, i) : Container();
        },
        separatorBuilder: (context, index) {
          return Divider();
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