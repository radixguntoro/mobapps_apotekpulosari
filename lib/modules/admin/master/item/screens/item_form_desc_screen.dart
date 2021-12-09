import 'package:apotik_pulosari/modules/admin/master/item/controllers/item_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/item/models/model_item.dart';
import 'package:apotik_pulosari/modules/admin/master/item/screens/item_autocomplete_supplier_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ItemFormDescScreen extends StatelessWidget {
  final _categories = ModelItem.getCategory;
  final _units = ModelItem.getUnit;

  @override
  Widget build(BuildContext context) {
    final _itemController = Get.put(ItemController());
    TextEditingController _valBarcode = TextEditingController(text: ModelItem.tabletBarcode);
    TextEditingController _valName = TextEditingController(text: ModelItem.name);
    TextEditingController _valSupplier = TextEditingController(text: ModelItem.supplierPersonsName);

    return Container(
      color: Colors.white,
      child: Form(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Nama *",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    child: TextFormField(
                      controller: _valName,
                      autofocus: true,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Masukkan nama obat..",
                        contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) async => {
                        ModelItem.name = value,
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Kategori *",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    child: GetBuilder(
                      init:ItemController(),
                      builder: (_) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 16, right: 12),
                            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                            hintText: 'Please select expense',
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text("Pilih Kategori"),
                              value: ModelItem.categoryId,
                              isExpanded: true,
                              underline: Container(
                                width: double.infinity,
                                height: 0,
                              ),
                              items: _categories.map((val) {
                                return DropdownMenuItem(
                                  child: Text(val['name']),
                                  value: val['id'],
                                );
                              }).toList(),
                              onChanged: (val) {
                                print(val);
                                _itemController.setCategory(val);
                              },
                            ),
                          ),
                        );
                      }
                    )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Satuan *",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    child: GetBuilder(
                      init:ItemController(),
                      builder: (_) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 16, right: 12),
                            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                            hintText: 'Please select expense',
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text("Pilih Satuan"),
                              value: int.parse(ModelItem.unitId),
                              isExpanded: true,
                              underline: Container(
                                width: double.infinity,
                                height: 0,
                              ),
                              items: _units.map((val) {
                                return DropdownMenuItem(
                                  child: Text(val['name']),
                                  value: val['id'],
                                );
                              }).toList(),
                              onChanged: (val) {
                                print(val);
                                _itemController.setUnit(val);
                              },
                            ),
                          ),
                        );
                      }
                    )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Konsinyasi *",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12
                              ),
                            )
                          ),
                          TextFormField(
                            controller: _valSupplier,
                            readOnly: true,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText: "Pilih Supplier..",
                              contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onTap: () {
                              ModelItem.getSupplier = [];
                              showSearch(context: context, delegate: ItemAutoCompleteSupplierScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: Colors.grey[300],
                      ),
                      color: Colors.grey[200]
                    ),
                    margin: EdgeInsets.only(top: 24, left: 16),
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Mdi.refresh,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        _itemController.setClearSupplier();
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Kode Barcode",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    child: GetBuilder(
                      init:ItemController(),
                      builder: (_) {
                        if(_valBarcode.text == '') {
                          return TextFormField(
                            controller: _valBarcode,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: "Masukkan kode barcode...",
                              contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),
                              suffixIcon: Padding(
                                child: IconButton(
                                  color: Colors.grey[500], 
                                  icon: Icon(Mdi.barcode), 
                                  onPressed: () async{ 
                                    String tabletBarcode = await scanner.scan();
                                    _itemController.scanTabletBarcodeQRCode(tabletBarcode);
                                  }
                                ),
                                padding: EdgeInsets.all(0)
                              ),
                            ),
                            onChanged: (val) {
                              ModelItem.tabletBarcode = val;
                            },
                          );
                        } else {
                          return TextFormField(
                            controller: _valBarcode,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                              hintText: "Masukkan kode barcode...",
                              contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12),
                              suffixIcon: Padding(
                                child: IconButton(
                                  color: Colors.grey[500], 
                                  icon: Icon(Mdi.close), 
                                  onPressed: () async{ 
                                    _itemController.clearTabletBarcodeQRCode();
                                  }
                                ),
                                padding: EdgeInsets.all(0)
                              ),
                            ),
                            onChanged: (val) {
                              ModelItem.tabletBarcode = val;
                            },
                          );
                        }
                      }
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}