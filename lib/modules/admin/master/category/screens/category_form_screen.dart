import 'package:apotik_pulosari/modules/admin/master/category/models/model_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryFormScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController _valName = TextEditingController(text: ModelCategory.name);

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
                    child: TextFormField(
                      controller: _valName,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(),
                        hintText: "Masukkan nama kategori..",
                        contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12)
                      ),
                      onChanged: (value) async => {
                        ModelCategory.name = value,
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}