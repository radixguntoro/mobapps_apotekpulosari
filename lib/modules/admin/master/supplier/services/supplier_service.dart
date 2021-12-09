import 'dart:convert';
import 'dart:io';
import 'package:apotik_pulosari/modules/admin/master/supplier/models/model_supplier.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:apotik_pulosari/routes/api.dart';

class SupplierService {
  static String modules = 'supplier';
  String name;
  String address;
  String city;
  String identityNumber;
  String status;
  int personsId;
  List data;
  
  SupplierService({
    this.name,
    this.address,
    this.city,
    this.identityNumber,
    this.status,
    this.personsId
  });

  static Future<String> createData() async {
    ModelSupplier.data = {
      "id": ModelSupplier.personsId,
      "persons_id": ModelSupplier.personsId,
      "name": ModelSupplier.name,
      "address": ModelSupplier.address,
      "city": ModelSupplier.city,
      "identityNumber": ModelSupplier.identityNumber,
      "status": ModelSupplier.status,
      "phones": ModelSupplier.phone == null ? [] : [
        {
          "id": ModelSupplier.phoneId,
          "number": ModelSupplier.phone,
          "status": "create",
        },
      ] 
    };

    Map data = {
      "supplier": json.encode(ModelSupplier.data)
    };

    print("Inputan $data");

    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[modules]['create'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      print("Request" + request.body);
      if (request.statusCode == 200) {
        ModelSupplier.resp = "success";
      } else if(request.statusCode == 500) {
        ModelSupplier.resp = "failed";
      }
      return "success";
    } catch (e) {
      return "failed";
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
      ModelSupplier.totalData = resp['total'];
      ModelSupplier.currentPage = resp['current_page'];
      return resp['data'];
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
      ModelSupplier.totalData = resp['total'];
      ModelSupplier.currentPage = resp['current_page'];
      return resp['data'];
    } else {
      throw Exception('error fetching data');
    }
  }

  static Future<String> readDetailData(val) async {
    ModelSupplier.name = val['name'];
    ModelSupplier.address = val['address'];
    ModelSupplier.city = val['city'];
    ModelSupplier.identityNumber = val['identityNumber'];
    ModelSupplier.status = val['status'];
    ModelSupplier.personsId = val['personsId'];
    ModelSupplier.phoneId = val['phoneId'].toString();
    ModelSupplier.phone = val['phone'];
    
    return "success";
  }

  static Future<List> readDataAll() async {
    // print(Api.route[modules]['readDataAll']);
    GetStorage box = GetStorage();
    String token = box.read('token');
    final request = await http.get(
      Api.route[modules]['readDataAll'],
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
    ModelSupplier.data = {
      "id": ModelSupplier.personsId,
      "persons_id": ModelSupplier.personsId,
      "name": ModelSupplier.name,
      "address": ModelSupplier.address,
      "city": ModelSupplier.city,
      "identityNumber": ModelSupplier.identityNumber,
      "status": ModelSupplier.status,
      "phones": ModelSupplier.phone == null ? [] : [
        {
          "id": ModelSupplier.phoneId,
          "number": ModelSupplier.phone,
          "status": "edit",
        },
      ] 
    };

    Map data = {
      "supplier": json.encode(ModelSupplier.data)
    };

    print("Inputan $data");

    GetStorage box = GetStorage();
    String token = box.read('token');

    try {
      final request = await http.post(
        Api.route[modules]['update'], 
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      print("Request" + request.body);
      if (request.statusCode == 200) {
        ModelSupplier.resp = "success";
      } else if(request.statusCode == 500) {
        ModelSupplier.resp = "failed";
      }
      return "success";
    } catch (e) {
      return "failed";
    }
  }
}

