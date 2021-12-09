import 'package:apotik_pulosari/components/infostate/infostate.dart';
import 'package:apotik_pulosari/modules/admin/master/supplier/models/model_supplier.dart';
import 'package:apotik_pulosari/modules/admin/master/supplier/controllers/supplier_controller.dart';
import 'package:apotik_pulosari/modules/admin/transaction/purchase/screens/purchase_autocomplete_supplier_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class PurchaseAutoCompleteSupplierScreen extends SearchDelegate<String> {
  final SupplierController _supplierController = Get.put(SupplierController());
  final state;

  PurchaseAutoCompleteSupplierScreen(
    this.state
  );

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
        _supplierController.readFirst();
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
      _supplierController.readDataBySearch(query);
    } 
    if(ModelSupplier.getData.length > 0) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 16),
        itemCount: ModelSupplier.getData.length,
        itemBuilder: (context, int i) {
          return i < ModelSupplier.getData.length ? PurchaseAutoCompleteSupplierResultScreen(ModelSupplier.getData[i], query, i, state) : Container();
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