import 'package:apotik_pulosari/components/transition/model_transition.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/components/utilities/text_transform.dart';
import 'package:apotik_pulosari/modules/admin/master/user/controllers/user_controller.dart';
import 'package:apotik_pulosari/modules/admin/master/user/screens/user_edit_screen.dart';
import 'package:apotik_pulosari/modules/admin/master/user/screens/user_form_change_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mdi/mdi.dart';

class UserDataScreen extends StatelessWidget {
  final _userController = Get.put(UserController());
  final data;
  final index;

  UserDataScreen(
    this.data,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: [],
      secondaryActions: [
        Container(
          height: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(4),
            color: Colors.cyan[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Icon(
                    Mdi.lockReset,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            onPressed: () async {
              await Get.to(UserFormChangePasswordScreen(data), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
            },
          ),
        ),
        Container(
          height: double.infinity,
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: ColorTheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Icon(
                    Mdi.circleEditOutline,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Ubah",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            onPressed: () async {
              _userController.readDetailData(data);
              await Get.to(UserEditScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: ModelTransition.speed),);
            },
          ),
        ),
      ],
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: (index+1) % 2 == 0 ? Colors.white : Colors.grey[50],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [ColorTheme.secondary, ColorTheme.secondarySec],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Icon(
                    Mdi.account,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: Text(
                      TextTransform.title(data['name']),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: Text(
                      data['phone'],
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorTheme.primary,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      data['rolesName'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}