import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/controllers/customer_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/models/model_customer.dart';
import 'package:apotik_pulosari/modules/admin/master/customer/screens/customer_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class CustomerSearchScreen extends SearchDelegate<String> {
  final CustomerController _customerController = Get.put(CustomerController());

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
        _customerController.readFirst();
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
      _customerController.readDataBySearch(query);
    }
    if(ModelCustomer.getData.length > 0) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 16),
        itemCount: ModelCustomer.getData.length,
        itemBuilder: (context, int i) {
          return i < ModelCustomer.getData.length ? CustomerSearchResultScreen(ModelCustomer.getData[i], query, i) : Container();
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