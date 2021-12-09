import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/customer/models/model_customer.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:apotik_pulosari/routes/api.dart';

class CustomerService {
  String name;
  String address;
  String city;
  String identityNumber;
  String status;
  int personsId;
  List data;
  
  CustomerService({
    this.name,
    this.address,
    this.city,
    this.identityNumber,
    this.status,
    this.personsId
  });

  static Future<String> createData() async {
    ModelCustomer.data = {
      "id": ModelCustomer.personsId,
      "persons_id": ModelCustomer.personsId,
      "name": ModelCustomer.name,
      "address": ModelCustomer.address,
      "city": ModelCustomer.city,
      "identityNumber": ModelCustomer.identityNumber,
      "status": ModelCustomer.status,
      "phones": ModelCustomer.phone == null ? [] : [
        {
          "id": ModelCustomer.phoneId,
          "number": ModelCustomer.phone,
          "status": "create",
        },
      ] 
    };

    Map data = {
      "customer": json.encode(ModelCustomer.data)
    };

    print("Inputan $data");

    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[ModelCustomer.modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      print("Request" + request.body);
      if (request.statusCode == 200) {
        ModelCustomer.resp = "success";
      } else if(request.statusCode == 500) {
        ModelCustomer.resp = "failed";
      }
      return "success";
    } catch (e) {
      return "failed";
    }
  }

  static Future<List> readData(int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[ModelCustomer.modules]['readList'] + "page=$page&row=$limit");
    final request = await http.get(
      Api.route[ModelCustomer.modules]['readList'] + "page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      ModelCustomer.totalData = resp['total'];
      ModelCustomer.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<List> readDataBySearch(String type, int page, int limit) async {
    GetStorage box = GetStorage();
    String token = box.read('token');
    print(Api.route[ModelCustomer.modules]['readList'] + "search=$type&page=$page&row=$limit");
    final request = await http.get(
      Api.route[ModelCustomer.modules]['readList'] + "search=$type&page=$page&row=$limit", 
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      print(resp['data']);
      ModelCustomer.totalData = resp['total'];
      ModelCustomer.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<String> readDetailData(val) async {
    ModelCustomer.name = val['name'];
    ModelCustomer.address = val['address'];
    ModelCustomer.city = val['city'];
    ModelCustomer.identityNumber = val['identityNumber'];
    ModelCustomer.status = val['status'];
    ModelCustomer.personsId = val['personsId'];
    ModelCustomer.phoneId = val['phoneId'].toString();
    ModelCustomer.phone = val['phone'];
    
    return "success";
  }

  static Future<List> readDataAll() async {
    // print(Api.route[ModelCustomer.modules]['readDataAll']);
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[ModelCustomer.modules]['readDataAll'],
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"}
    );
    if (request.statusCode == 200) {
      var resp = json.decode(request.body);
      if (resp.length > 0) {
        return resp;
      } else {
        return resp;
      }
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<String> updateData() async {
    ModelCustomer.data = {
      "id": ModelCustomer.personsId,
      "persons_id": ModelCustomer.personsId,
      "name": ModelCustomer.name,
      "address": ModelCustomer.address,
      "city": ModelCustomer.city,
      "identityNumber": ModelCustomer.identityNumber,
      "status": ModelCustomer.status,
      "phones": ModelCustomer.phone == null ? [] : [
        {
          "id": ModelCustomer.phoneId,
          "number": ModelCustomer.phone,
          "status": "edit",
        },
      ] 
    };

    Map data = {
      "customer": json.encode(ModelCustomer.data)
    };

    print("Inputan $data");

    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[ModelCustomer.modules]['update'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      print("Request" + request.body);
      if (request.statusCode == 200) {
        ModelCustomer.resp = "success";
      } else if(request.statusCode == 500) {
        ModelCustomer.resp = "failed";
      }
      return "success";
    } catch (e) {
      return "failed";
    }
  }
}

