import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/modules/admin/master/item/controllers/item_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/master/item/screens/item_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class ItemSearchScreen extends SearchDelegate<String> {
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
    print(query);
    if (query.length >= 2) {
      _itemController.readDataBySearch(query);
    }

    if(ModelItem.getData.length > 0) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 16),
        itemCount: ModelItem.getData.length,
        itemBuilder: (context, int i) {
          return i < ModelItem.getData.length ? ItemSearchResultScreen(ModelItem.getData[i], query, i) : Container();
        }
      );
    } else {
      return _emptyData(context);
    }
  }

  Widget showResults(BuildContext context) {
    return null;
  }

  Widget _emptyData(context) {
    return Infostate.emptyData(context);
  }
}