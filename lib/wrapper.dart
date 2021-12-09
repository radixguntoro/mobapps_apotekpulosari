import 'package:apotik_pulosari/modules/auth/controllers/auth_controller.dart';
import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/auth/screens/login_screen.dart';
import 'package:apotik_pulosari/modules/admin/home/screens/home_screen.dart';
import 'package:apotik_pulosari/modules/client/home/screens/home_screen.dart' as member;
// import 'package:apotik_pulosari/modules/utility/controllers/connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
// import 'package:new_version/new_version.dart';

// ignore: must_be_immutable
class Wrapper extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthController(),
      builder: (_) {
        if (box.read('persons_id') != null) {
          if (DateFormat('yyyy-MM-dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)) == DateFormat('yyyy-MM-dd').format(DateTime.parse(box.read('date')))) {  
            ModelAuth.username = box.read('username');
            ModelAuth.permission = box.read('permission');
            ModelAuth.personsId = box.read('persons_id');

            if (box.read('permission') == 3) {
              return member.HomeScreen(ModelAuth.username, ModelAuth.permission, ModelAuth.personsId);
            } else {
              return HomeScreen(ModelAuth.username, ModelAuth.permission, ModelAuth.personsId);
            }
          } else {
            _authController.signOut();
            return LoginScreen();
          }
        } else {
          return LoginScreen();
        }
      },
    );
    // return GetBuilder(
    //   init: ConnectionController(),
    //   builder: (resp) {
    //     return GetBuilder(
    //       init: AuthController(),
    //       builder: (_) {
    //         if (box.read('persons_id') != null) {
    //           if (DateFormat('yyyy-MM-dd').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)) == DateFormat('yyyy-MM-dd').format(DateTime.parse(box.read('date')))) {  
    //             ModelAuth.username = box.read('username');
    //             ModelAuth.permission = box.read('permission');
    //             ModelAuth.personsId = box.read('persons_id');
    //             return HomeScreen(ModelAuth.username, ModelAuth.permission, ModelAuth.personsId);
    //           } else {
    //             _authController.signOut();
    //             return LoginScreen(resp.localVersion);
    //           }
    //         } else {
    //           return LoginScreen(resp.localVersion);
    //         }
    //       },
    //     );
    //   }
    // );
  }
}