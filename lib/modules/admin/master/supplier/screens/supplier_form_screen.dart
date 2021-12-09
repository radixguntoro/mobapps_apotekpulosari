import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/admin/master/supplier/controllers/supplier_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/supplier/models/model_supplier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupplierFormScreen extends StatelessWidget {
  final SupplierController _supplierController = Get.put(SupplierController());
  
  @override
  Widget build(BuildContext context) {
    TextEditingController _valName = TextEditingController(text: ModelSupplier.name);
    TextEditingController _valPhone = TextEditingController(text: ModelSupplier.phone);

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
                    margin: EdgeInsets.only(bottom: 6),
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
                        hintText: "Masukkan nama...",
                        contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12)
                      ),
                      onChanged: (value) async => {
                        ModelSupplier.name = value,
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
                    margin: EdgeInsets.only(bottom: 6),
                    child: Text(
                      "No. Telp",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    child: TextFormField(
                      controller: _valPhone,
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
                        hintText: "Masukkan no. telp...",
                        contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12)
                      ),
                      onChanged: (value) async => {
                        ModelSupplier.phone = value,
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: Text(
                      "Status",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      border: Border.all(
                        color: Colors.black38,
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: GetBuilder(
                            init: SupplierController(),
                            builder: (_) {
                              return Row(
                                children: <Widget>[
                                  Radio(
                                    activeColor: ColorTheme.primary,
                                    value: 'active',
                                    groupValue: ModelSupplier.status,
                                    onChanged: (val) {
                                      _supplierController.selectStatus(val);
                                    },
                                  ),
                                  Text(
                                    'Aktif',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Container(
                          child: GetBuilder(
                            init: SupplierController(),
                            builder: (_) {
                              return Row(
                                children: <Widget>[
                                  Radio(
                                    activeColor: ColorTheme.primary,
                                    value: 'inactive',
                                    groupValue: ModelSupplier.status,
                                    onChanged: (val) {
                                      _supplierController.selectStatus(val);
                                    },
                                  ),
                                  Text(
                                    'Tidak Aktif',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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