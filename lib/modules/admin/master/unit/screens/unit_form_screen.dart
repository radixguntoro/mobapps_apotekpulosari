import 'package:apotik_pulosari/modules/admin/master/unit/models/model_unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnitFormScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController _valName = TextEditingController(text: ModelUnit.name);

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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Masukkan nama unit..",
                        labelText: 'Nama',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 12)
                      ),
                      onChanged: (value) async => {
                        ModelUnit.name = value,
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