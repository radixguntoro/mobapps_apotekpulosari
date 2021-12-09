import 'package:apotik_pulosari/modules/admin/master/item/controllers/item_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_cart_item_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class PurchaseCartItemSearchScreen extends SearchDelegate<String> {
  final ItemController _itemController = Get.put(ItemController());

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
          progress: transitionAnimation,
      ),
      onPressed: () {
        _itemController.readFirst();
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
    if (query.length >= 2) {
      _itemController.readDataBySearch(query);
    }
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: ModelItem.getData.length,
      itemBuilder: (context, int i) {
        return i < ModelItem.getData.length ? PurchaseCartItemSearchResultScreen(ModelItem.getData[i], query, ModelItem.getData.length, i) : Container();
      },
    );
  }

  Widget showResults(BuildContext context) {
    return null;
  }
}