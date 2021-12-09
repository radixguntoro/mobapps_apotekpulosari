import 'dart:convert';

import 'package:apotik_pulosari/modules/auth/models/model_auth.dart';
import 'package:apotik_pulosari/modules/admin/master/user/models/model_user.dart';
import 'package:apotik_pulosari/modules/admin/master/user/services/user_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  GetStorage box = GetStorage();
  String result = '';
  Map response = {};
  String name;
  String address;
  String city;
  String identityNumber;
  String gender;
  String status;
  String username;
  String password;
  String personsId;
  List<dynamic> roles = [];

  int page = 1;
  int limit = 10;

  UserController({
    this.username, 
    this.password,
    this.personsId, 
    this.name,
    this.address,
    this.city,
    this.identityNumber,
    this.gender,
    this.status,
  });

  @override
  void onInit() {
    ModelUser.result = 'ready';
    readRoles();
  }

  void isLoadingTrue() {
    ModelUser.isLoading = true;
  }

  void isLoadingFalse() {
    ModelUser.isLoading = false;
  }

  void isFormEnable() {
    ModelUser.password = '';
    ModelUser.isFormEnable = true;
  }

  void isFormDisable() {
    ModelUser.isFormEnable = false;
  }

  void clearInput() {
    ModelUser.name = '';
    ModelUser.email = '';
    ModelUser.address = '';
    ModelUser.city = '';
    ModelUser.identityNumber = '';
    ModelUser.gender = '';
    ModelUser.status = 'active';
    ModelUser.phone = '';
    ModelUser.rolesId = '2';
    ModelUser.username = '';
    ModelUser.password = '';
  }

  void readRoles() async{
    var resp = await UserService.readRoles();
    ModelUser.roles = resp;
    print(ModelUser.roles.toString());
    update();
  }

  void readDataBySearch(type) async{
    var resp = await UserService.readDataBySearch(type, page, limit);
    ModelUser.getData = resp;
    update();
  }

  void readFirst() async{
    isLoadingTrue();
    update();
    page = 1;
    limit = 10;
    ModelUser.maxData = false;
    var resp = await UserService.readData(page, limit);
    ModelUser.getData = resp;
    isLoadingFalse();
    update();
  }

  void readMore() async{
    page = ModelUser.currentPage + 1;
    limit = 5;
    var resp = await UserService.readData(page, limit);
    if (resp.isEmpty) {
      ModelUser.maxData = true;
    } else {
      ModelUser.maxData = false;
      ModelUser.getData += resp;
    }
    update();
  }

  void readDetail() async{
    isLoadingTrue();
    update();
    var resp = await UserService.readDetail(ModelAuth.personsId);
    ModelUser.name = resp['name'];
    ModelUser.email = resp['user']['email'];
    ModelUser.rolesName = resp['user']['role_name'];
    ModelUser.status = resp['status'];
    isLoadingFalse();
    update();
  }

  void readDetailData(data) async{
    isLoadingTrue();
    update();
    try {
      var resp = await UserService.readDetailData(data);
      if (resp == "success") {
        isLoadingFalse();
        update();
      } else if(resp == "failed") {
        isLoadingFalse();
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void createData() async{
    isLoadingTrue();
    update();
    try {
      response = await UserService.createData();
      if (response['status'] == 1) {
        result = 'success';
        readFirst();
        isLoadingFalse();
        update();
      } else {
        result = 'failed';
        isLoadingFalse();
        // Snackbar.fail(response);
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void updateData() async{
    isLoadingTrue();
    update();
    try {
      response = await UserService.updateData();
      if (response['status'] == 1) {
        result = 'success';
        readFirst();
        isLoadingFalse();
        update();
      } else {
        result = 'failed';
        isLoadingFalse();
        // Snackbar.fail(response);
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void updateProfile() async{
    isLoadingTrue();
    update();
    try {
      ModelUser.data = {
        "name": ModelUser.name,
        "email": ModelUser.email,
        "address": ModelUser.address,
        "city": ModelUser.city,
        "identityNumber": ModelUser.identityNumber,
        "gender": ModelUser.gender,
        "roles_id": ModelUser.rolesId,
        "status": ModelUser.status,
        "users_persons_id": ModelAuth.personsId,
        "username": ModelUser.username,
        "password": ModelUser.password,
        "phones": [
          {
            "number": ModelUser.phone,
            "status": "edit",
          },
        ] 
      };

      Map data = {
        "user": json.encode(ModelUser.data),
      };

      var resp = await UserService.updateProfile(data);
      if (resp == "success") {
        isLoadingFalse();
        update();
      } else if(resp == "failed") {  
        isLoadingFalse();
        update();
      }
    } catch (e) {
    }
  }

  void updatePassword(data) async{
    isLoadingTrue();
    update();
    try {
      response = await UserService.updatePassword(data);
      if (response['status'] == 1) {
        result = 'success';
        readFirst();
        isLoadingFalse();
        update();
      } else {
        result = 'failed';
        isLoadingFalse();
        // Snackbar.fail(response);
        update();
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void setRole(val) async{
    ModelUser.rolesId = val.toString();
    update();
  }

  void selectStatus(val) async{
    ModelUser.status = val;
    update();
  }
}