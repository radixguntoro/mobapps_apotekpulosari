import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/modules/admin/master/user/controllers/user_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/user/models/model_user.dart';
import 'package:apotik_pulosari/modules/admin/master/user/screens/user_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class UserSearchScreen extends SearchDelegate<String> {
  final UserController _userController = Get.put(UserController());

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
        _userController.readFirst();
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
    if (query.length > 2) {
      _userController.readDataBySearch(query);
    } 
    if(ModelUser.getData.length > 0) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 16),
        itemCount: ModelUser.getData.length,
        itemBuilder: (context, int i) {
          return i < ModelUser.getData.length ? UserSearchResultScreen(ModelUser.getData[i], query, i) : Container();
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