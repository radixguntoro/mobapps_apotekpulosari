import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/user/models/model_user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:apotik_pulosari/routes/api.dart';

class UserService {
  static String modules = 'user';

  static Future<dynamic> createData() async {
    ModelUser.data = {
      "name": ModelUser.name,
      "email": ModelUser.email,
      "roles_id": ModelUser.rolesId,
      "username": ModelUser.username,
      "password": ModelUser.password,
      "status": 1,
      "phone": ModelUser.phone 
    };

    Map data = {
      "user": json.encode(ModelUser.data)
    };

    print(data);

    GetStorage box = GetStorage();
    String token = box.read('token');
    print("${Api.route[ModelUser.modules]['create']}");
    try {
      final request = await http.post(
        Api.route[ModelUser.modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
      return resp;
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }

  static Future<List> readRoles() async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readRoles']);
    final request = await http.get(
      Api.route[modules]['readRoles'], 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      return resp;
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readList'] + "search=$type&page=$page&row=$limit");
    final request = await http.get(
      Api.route[modules]['readList'] + "search=$type&page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelUser.totalData = resp['total'];
      ModelUser.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readData(int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[modules]['readList'] + "page=$page&row=$limit");
    final request = await http.get(
      Api.route[modules]['readList'] + "page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelUser.totalData = resp['total'];
      ModelUser.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<Map> readDetail(personsId) async{
    print("${Api.route[modules]['readId'] + "id=$personsId"}");
    try {
      GetStorage box = GetStorage();
      String token = box.read('token');
      final request = await http.get(
        Api.route[modules]['readId'] + "id=$personsId", 
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      var resp = json.decode(request.body);
      // print(resp.toString());
      return resp;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<String> readDetailData(val) async {
    ModelUser.name = val['name'];
    ModelUser.email = val['email'];
    ModelUser.address = val['address'];
    ModelUser.city = val['city'];
    ModelUser.identityNumber = val['identityNumber'];
    ModelUser.gender = val['gender'];
    ModelUser.rolesId = val['rolesId'];
    ModelUser.status = val['status'];
    ModelUser.personsId = val['personsId'];
    ModelUser.username = val['username'];
    ModelUser.password = val['password'];
    ModelUser.phoneId = val['phoneId'].toString();
    ModelUser.phone = val['phone'];
    
    return "success";
  }

  static Future<String> updateProfile(data) async{
    try {
      print(data);
      var request = await http.post(Api.route[modules]['updateProfile'], body: data);

      print(request.body);
      if (request.statusCode == 200) {
        return "success";
      } else if(request.statusCode == 500) {
        return "failed";
      }
      return "warning";
    } catch (e) {
      print(e.toString());
      return "failed";
    }
  }

  static Future<dynamic> updateData() async{
    ModelUser.data = {
      "persons_id": ModelUser.personsId,
      "name": ModelUser.name,
      "email": ModelUser.email,
      "roles_id": ModelUser.rolesId,
      "status": 1,
      "phone": ModelUser.phone 
    };

    Map data = {
      "user": json.encode(ModelUser.data)
    };

    print(data);

    GetStorage box = GetStorage();
    String token = box.read('token');
    print("${Api.route[ModelUser.modules]['update']}");
    try {
      final request = await http.post(
        Api.route[ModelUser.modules]['update'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
      return resp;
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }

  static Future<dynamic> updatePassword(param) async {
    ModelUser.data = {
      'persons_id': param['id'],
      'password': ModelUser.password,
    };

    Map data = {
      "user": json.encode(ModelUser.data)
    };
    print(data.toString());
    // return "success";
    GetStorage box = GetStorage();
    String token = box.read('token');
    print("${Api.route[ModelUser.modules]['updatePassword']}");
    try {
      final request = await http.post(
        Api.route[ModelUser.modules]['updatePassword'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );

      var resp = json.decode(request.body);
      print(resp.toString());
      return resp;
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }
}