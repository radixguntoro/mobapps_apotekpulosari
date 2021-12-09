import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/controllers/sales_recipe_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/models/model_sales_recipe.dart';
import 'package:apotik_pulosari/modules/admin/transaction/sales_recipe/screens/sales_recipe_recap_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class SalesRecipeRecapSearchScreen extends SearchDelegate<String> {
  final SalesRecipeController _salesRecipeController = Get.put(SalesRecipeController());

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
        _salesRecipeController.readFirst();
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
      _salesRecipeController.readDataBySearch(query);
    }

    if(ModelSalesRecipe.getData.length > 0) {
      return ListView.separated(
        padding: EdgeInsets.only(top: 8, bottom: 16),
        itemCount: ModelSalesRecipe.getData.length,
        itemBuilder: (context, int i) {
          return i < ModelSalesRecipe.getData.length ? SalesRecipeRecapSearchResultScreen(ModelSalesRecipe.getData[i], query, ModelSalesRecipe.getData.length, i) : Container();
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