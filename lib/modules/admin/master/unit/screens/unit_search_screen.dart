import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/modules/admin/master/unit/controllers/unit_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/unit/models/model_unit.dart';
import 'package:apotik_pulosari/modules/admin/master/unit/screens/unit_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class UnitSearchScreen extends SearchDelegate<String> {
  final UnitController _unitController = Get.put(UnitController());

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
        _unitController.readFirst();
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
      _unitController.readDataBySearch(query);
    }
    if(ModelUnit.getData.length > 0) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 16),
        itemCount: ModelUnit.getData.length,
        itemBuilder: (context, int i) {
          return i < ModelUnit.getData.length ? UnitSearchResultScreen(ModelUnit.getData[i], query, i) : Container();
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