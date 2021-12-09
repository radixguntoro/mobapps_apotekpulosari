import 'package:apotik_pulosari/components/utilities/divider.dart';
import 'package:apotik_pulosari/modules/admin/master/user/controllers/user_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/user/models/model_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFormScreen extends StatelessWidget {
  final UserController _userController = Get.put(UserController());
  final state;

  UserFormScreen(
    this.state
  );
  
  @override
  Widget build(BuildContext context) {
    TextEditingController _valName = TextEditingController(text: ModelUser.name);
    TextEditingController _valPhone = TextEditingController(text: ModelUser.phone);
    TextEditingController _valUsername = TextEditingController(text: ModelUser.username);
    TextEditingController _valPassword = TextEditingController(text: ModelUser.password);

    return Container(
      color: Colors.white,
      child: Form(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  GetBuilder(
                    init: UserController(),
                    builder: (_) {
                      return Text(
                        "Informasi",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              color: Colors.white,
              child: DividerDashed(
                color: Colors.grey[300],
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
                        ModelUser.name = value,
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
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
                        ModelUser.phone = value,
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  GetBuilder(
                    init: UserController(),
                    builder: (_) {
                      return Text(
                        "Akun Pengguna",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              color: Colors.white,
              child: DividerDashed(
                color: Colors.grey[300],
              ),
            ),
            Visibility(
              visible: state == 'create' ? true : false,
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Username *",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12
                        ),
                      )
                    ),
                    Container(
                      child: TextFormField(
                        controller: _valUsername,
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
                          hintText: "Masukkan username...",
                          contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12)
                        ),
                        onChanged: (value) async => {
                          ModelUser.username = value,
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: state == 'create' ? true : false,
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Password *",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12
                        ),
                      )
                    ),
                    Container(
                      child: TextFormField(
                        controller: _valPassword,
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
                          hintText: "**********",
                          contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 12)
                        ),
                        onChanged: (value) async => {
                          ModelUser.password = value,
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Hak Akses",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12
                      ),
                    )
                  ),
                  Container(
                    child: GetBuilder(
                      init:UserController(),
                      builder: (_) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                            hintText: 'Tolong pilih metode',
                            contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text("Pilih Hak Akses"),
                              value: ModelUser.rolesId,
                              isExpanded: true,
                              underline: Container(
                                width: double.infinity,
                                height: 0,
                              ),
                              items: ModelUser.roles.map((val) {
                                return DropdownMenuItem(
                                  child: Text(val['name']),
                                  value: val['id'].toString(),
                                );
                              }).toList(),
                              onChanged: (val) async {
                                _userController.setRole(val);
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
          ],
        ),
      ),
    );
  }
}